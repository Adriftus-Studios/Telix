ability_group_teleport:
  type: command
  name: test_spell
  ability_tree: Test
  ability_type: active
  range: 20
  points_to_unlock: 1
  power_cost: 1
  description: Arcane Strike
  color: <co@91,225,245>
  icon:
    material: iron_nugget
    custom_model_data: 1001
  script:
    - define location:<player.location.with_pitch[-90]>
    - run animation_group_teleport_star def:<[location]>

animation_group_teleport_star:
  type: task
  definitions: location
  script:
  - repeat 140:
    - define points:<proc[define_star2].context[<[location]>|3|<[value].mul[5]>|5]>
    - playeffect redstone <[points]> offset:0 visibility:300 quantity:1 special_data:1|<co@91,225,245>
    - wait 1t