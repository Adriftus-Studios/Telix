ability_test_spell1:
  type: task
  name: test_spell1
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 0
  power_cost: 0
  description: Test Spell 1
  range: 30
  damage: 3
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - inject abilities_check
    - inject abilities_cost
    - repeat 5:
      - define offset:<proc[find_offset].context[2|<util.random.int[0].to[360]>]>
      - define points:<proc[define_curve].context[<player.eye_location.forward[2]>|<player.eye_location.forward[<script.yaml_key[range]>].up[<[offset].get[1]>].right[<[offset].get[2]>]>|1|<util.random.int[0].to[360]>|1]>
      - run play_animation def:<[points].escaped>|spell_witch
      - wait 3t

ability_test_spell1_animation:
  type: task
  definitions: start|end|angle|player|damage
  script:
  - define points:<proc[define_curve].context[<[start]>|<[end]>|1|<[angle]>|1]>
  - foreach <[points]> as:point:
    - playeffect spell_witch <[point]> offset:0 visibility:100 quantity:2
    - wait 1t
    - if <[point].find.players.within[0.7].size> != 0:
      - hurt <[point].find.players.within[0.7].get[1]> <[damage]> cause:<[player]>
      - foreach stop

ability_test_spell2:
  type: task
  name: test_spell2
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 0
  power_cost: 0
  description: Test Spell 2
  range: 50
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
