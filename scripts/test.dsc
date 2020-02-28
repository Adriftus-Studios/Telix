ability_test_spell:
  type: task
  name: test_spell
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Test Spell
  range: 20
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - inject abilities_check
    - inject abilities_cost
    - repeat 5:
      - define offset:<proc[find_offset].context[2|<util.random.int[0].to[360]>]>
      - run ability_test_spell_animation def:<player.eye_location.forward[2]>|<player.eye_location.forward[<script.yaml_key[range]>].up[<[offset].get[1]>].right[<[offset].get[2]>]>|<util.random.int[0].to[360]>|<player>
      - wait 2t

ability_test_spell_animation:
  type: task
  definitions: start|end|angle|player
  script:
  - define points:<proc[define_curve].context[<[start]>|<[end]>|1|<[angle]>|1]>
  - foreach <[points]> as:point:
    - playeffect spell_witch <[point]> offset:0 visibility:100 quantity:2
    - wait 1t
    - if <[point].find.players.within[0.7].size> != 0:
      - hurt <[point].find.players.within[0.7].get[1]> 3 cause:<[player]>
      - foreach stop