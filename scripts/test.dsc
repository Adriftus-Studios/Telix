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
    - define points:<proc[define_spiral].context[<player.location>|<player.location.forward[20]>|0.5|0]>
    - run animation_ability_test def:<[points].escaped>
    - define points:<proc[define_spiral].context[<player.location>|<player.location.forward[20]>|0.5|180]>
    - run animation_ability_test def:<[points].escaped>

animation_ability_test:
  type: task
  definitions: points
  script:
  - define points:<[points].unescaped>
  - repeat <[points].size>:
    - playeffect spell_witch <[points].get[<[value]>]> offset:0 visibility:300 quantity:2
    - wait 1t
    - if <[points].get[<[value]>].find.living_entities.within[0.5].size> != 0:
      - hurt 3 <[points].get[<[value]>].find.living_entities.within[0.5]>
      - repeat stop