ability_group_teleport:
  type: command
  name: group_teleport
  ability_tree: Test
  ability_type: active
  range: 20
  points_to_unlock: 1
  power_cost: 20
  description: Teleports all players within the space bubble to spawn.
  color: <co@91,225,245>
  icon:
    material: nether_star
    custom_model_data: 0
  script:
    - inject abilities_check
    - inject abilities_cost
    - define location:<player.location>
    - define layers:<proc[define_sphere2].context[<[location]>|1.5|0.3]>
    - define sphere:<proc[define_sphere1].context[<[location]>|1.5|0.3]>
    - repeat 8:
      - repeat <[layers].size>:
        - define points:<[layers].get[<[value]>].unescaped>
        - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
        - playeffect redstone at:<[points]> quantity:1 offset:0 visibility:100 special_data:1|<co@159,152,216>
        - wait 1t
    - playeffect spell_witch at:<[sphere]> quantity:3 offset:0 visibility:100
    - foreach <[location].find.players.within[2.5]> as:player:
      - teleport <[player]> <location[spawn]>
    # teleport inside players