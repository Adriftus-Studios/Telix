ability_arcane_strike:
  type: task
  name: arcane_strike
  ability_tree: Test
  ability_type: active
  range: 20
  points_to_unlock: 1
  power_cost: 1
  description: Arcane Strike
  icon:
    material: iron_nugget
    custom_model_data: 1001
  script:
    - define points:<proc[define_spiral].context[<player.location>|<player.location.forward[<script.yaml_key[range]>]>|0.7|0]>
    - run animation_arcane_strike def:<[points].escaped>
    - define points:<proc[define_spiral].context[<player.location>|<player.location.forward[<script.yaml_key[range]>]>|0.7|180]>
    - run animation_arcane_strike def:<[points].escaped>

animation_arcane_strike:
  type: task
  definitions: points
  script:
  - define points:<[points].unescaped>
  - repeat <[points].size>:
    - playeffect spell_witch <[points].get[<[value]>]> offset:0 visibility:300 quantity:2
    - wait 1t
    - if <[points].get[<[value]>].find.living_entities.within[0.5].size> != 0:
      - hurt 5 <[points].get[<[value]>].find.living_entities.within[0.5]>
      - repeat stop