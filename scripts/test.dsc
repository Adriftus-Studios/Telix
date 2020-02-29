ability_test:
  type: task
  name: test_ability
  ability_tree: Test
  ability_type: active
  range: 20
  points_to_unlock: 10
  power_cost: 10
  description: Test Skill 1
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - define offset:<proc[find_offset].context[2|<util.random.int[0].to[360]>]>
    - define points:<proc[define_curve1].context[<player.eye_location.forward[2]>|<player.eye_location.forward[<script.yaml_key[range]>].up[<[offset].get[1]>].right[<[offset].get[2]>]>|1|<util.random.int[0].to[360]>|1]>
    - run witches_demise_animation def:<[points].escaped>
    - wait 2t

animation_ability_test:
  type: task
  definitions: points|particle
  script:
  - define points:<[points].unescaped>
  - repeat <[points].size>:
    - playeffect spell_witch <[points].get[<[value]>]> offset:0 visibility:300 quantity:2
    - wait 1t
    - if <[points].get[<[value]>].find.living_entities.within[0.5].size> != 0:
      - hurt 3 <[points].get[<[value]>].find.living_entities.within[0.5]>
      - repeat stop