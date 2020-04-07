ability_group_teleport:
  type: command
  name: group_teleport
  ability_tree: Test
  ability_type: active
  points_to_unlock: 1
  power_cost: 20
  description: Teleports all players within the space bubble to spawn.
  color: <co@91,225,245>
  icon:
    material: nether_star
    custom_model_data: 0
  script:
    - if !<player.has_flag[group_teleport_cooldown]>:
      - inject abilities_check
      - inject abilities_cost
      - define location:<player.location>
      - define destination:<location[spawn]>
      - repeat 36:
        - define item:<player.inventory.slot[<[value]>]>
        - if <[item].nbt[saved_location]||null> != null && <[item].nbt[teleport_charges]> > 0:
          - define slot:<[value]>
      - if <[slot]||null> != null:
        - define item:<player.inventory.slot[<[slot]>]>
        - define destination:<[item].nbt[saved_location].as_location>
        - adjust def:item nbt:teleport_charges/<[item].nbt[teleport_charges].sub[1]>
        - inject build_item
        - inventory set d:<player.inventory> slot:<[slot]> o:<[item]>
      - define layers:<proc[define_sphere2].context[<[location].above>|2.5|0.3]>
      - define sphere:<proc[define_sphere1].context[<[location].above>|2.5|0.3]>
      - repeat 5:
        - repeat <[layers].size>:
          - define points:<[layers].get[<[value]>].unescaped>
          - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
          - playeffect redstone at:<[points]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,245>
          - wait 1t
      - playeffect spell_witch at:<[sphere]> quantity:2 offset:0.1 visibility:100
      - foreach <[location].find.players.within[2.5]> as:player:
        - teleport <[player]> <[destination]>
      - flag <player> group_teleport_cooldown duration:10m
    - else:
      - narrate "<&c>You cannot use this ability for <player.flag[group_teleport_cooldown].expiration.formatted.replace[s].with[<&sp>seconds].replace[m].with[<&sp>minutes]>."