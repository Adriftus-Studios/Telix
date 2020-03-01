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
    - run animation_group_teleport1 def:<[location]>
    - run animation_group_teleport2 def:<[location]>

animation_group_teleport1:
  type: task
  definitions: location
  script:
  - repeat 140:
    - define points1:<proc[define_star].context[<[location]>|3|<[value].mul[2]>|5]>
    - define points2:<proc[define_circle].context[<[location]>|3]>
    - playeffect redstone at:<[points1]> offset:0 visibility:300 quantity:1 special_data:1|<co@91,225,245>
    - playeffect redstone at:<[points2]> offset:0 visibility:300 quantity:1 special_data:1|<co@91,225,245>
    - wait 1t

animation_group_teleport2:
  type: task
  definitions: location
  script:
  - repeat 100:
    - define rotation:<[value]>
    - repeat 5:
      - define offset:<proc[find_offset].context[3|<[rotation].mul[2].add[<[value].mul[72]>]>]>
      - define point1:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
      - define curve:<proc[define_curve1].context[<[point1]>|<[location].above[3]]>|1|90|0.4]>
      - playeffect redstone at:<[curve]> offset:0 visibility:300 quantity:1 special_data:1|<co@91,225,245>
    - wait 1t