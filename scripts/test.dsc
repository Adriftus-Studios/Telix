ability_test_spell:
  type: command
  name: test_spell
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Test Spell
  icon:
    material: iron_nugget
    custom_model_data: 100
  apply_damage:
    - hurt <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> 5
    - burn <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> <script.yaml_key[duration]>
  script:
    - inject abilities_check
    - inject abilities_cost
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    - repeat 3:
      - define angle:<util.random.int[0].to[360]>
      - define offset:<proc[find_offset].context[2|<[angle]>]>
      - define start:<player.location.forward[1]>
      - define end:<player.location.forward[10].up[<[offset].get[1]>].right[<[offset].get[2]>]>
      - run ability_test_spell_animation def:<player.location.forward[1]>|<player.forward[10].up[<[offset].get[1]>].right[<[offset].get[2]>]>|<[angle]>

ability_test_spell_animation:
  type: task
  definitions: start|end|angle
  script:
  - define points:<proc[define_curve].context[<[start]>|<[end]>|1|<[angle]>|0.25]>
  - foreach <[points]> as:point:
    - playeffect spell_witch <[point]> offset:0 visibility:100 quantity:2
    - wait 1t
#  start|end|intensity|angle|between