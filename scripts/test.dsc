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
  animation:
    - narrate <script.definitions>
  apply_damage:
    - hurt <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> 5
    - burn <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> <script.yaml_key[duration]>
  script:
    - inject abilities_check
    - inject abilities_cost
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    - repeat 3:
      - define random:<util.random.int[0].to[360]>
      - define offset:<proc[find_offset].context[2|<[random]>]>
      - define points:<player.forward[10].up[<[offset].get[1]>].right[<[offset].get[2]>]>

    - run locally path:animation def: