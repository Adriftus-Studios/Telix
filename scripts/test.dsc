ability_witches_demise:
  type: task
  name: witches_demise
  ability_tree: Test
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Test Skill 1
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - narrate 1
    - inject abilities_check
    - narrate 2
    - inject abilities_cost
    - narrate 3
    - repeat 5:
      - define offset:<proc[find_offset].context[2|<util.random.int[0].to[360]>]>
      - define points:<proc[define_curve1].context[<player.eye_location.forward[2]>|<player.eye_location.forward[<script.yaml_key[range]>].up[<[offset].get[1]>].right[<[offset].get[2]>]>|1|<util.random.int[0].to[360]>|1]>
      - run witches_demise_animation def:<[points].escaped>
      - wait 2t

witches_demise_animation:
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
    
ability_test_spell2:
  type: task
  name: test_skill2
  ability_tree: Test
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Test Skill 2
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - inject abilities_check
    - inject abilities_cost
    - define points:<proc[define_spiral].context[<player.location.forward[1]>|<player.location.forward[<script.yaml_key[range]>]>|0.5|0]>
    - run play_animation def:<[points].escaped>|spell_instant
    - define points:<proc[define_spiral].context[<player.location.forward[1]>|<player.location.forward[<script.yaml_key[range]>]>|0.5|180]>
    - run play_animation def:<[points].escaped>|spell_instant
