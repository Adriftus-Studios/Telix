ability_teleport:
  type: command
  name: teleport
  ability_tree: ender
  ability_type: active
  points_to_unlock: 1
  power_cost: 20
  description: Teleports yourself to spawn.
  usage: Use nodestones to teleport yourself to saved locations.
  icon:
    material: nether_star
    custom_model_data: 0
  script:
    - if !<player.has_flag[teleport_cooldown]>:
      - inject abilities_cost
      - define location:<player.location.with_pitch[90]>
      - define destination:<location[spawn]>
      - repeat 36:
        - define item:<player.inventory.slot[<[value]>]>
        - if <[item].nbt[saved_location]||null> != null && <[item].nbt[teleport_charges]> > 0:
          - define slot:<[value]>
      - if <[slot]||null> != null:
        - define item:<player.inventory.slot[<[slot]>]>
        - define destination:<[item].nbt[saved_location].as_location>
        - if <[item].nbt[teleport_charges].sub[1]> < 1:
          - define item:<item[custom_depleted_nodestone]>
        - else:
          - adjust def:item nbt:teleport_charges/<[item].nbt[teleport_charges].sub[1]>
        - inject build_item
        - inventory set d:<player.inventory> slot:<[slot]> o:<[item]>
      - repeat 20:
        - define layers:|:<proc[define_circle].context[<[location].above[<[value].mul[0.1]>]>|0.7].escaped>
        - define cyl:|:<proc[define_circle].context[<[location].above[<[value].mul[0.1]>]>|0.7]>
      - repeat 5:
        - repeat <[layers].size>:
          - define points:<[layers].get[<[value]>].unescaped>
          - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
          - playeffect redstone at:<[points]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,245>
          - wait 1t
      - playeffect spell_witch at:<[cyl]> quantity:2 offset:0.1 visibility:100
      - if <[location].find.players.within[1].contains[<player>]>:
        - teleport <player> <[destination]>
      - flag <player> teleport_cooldown duration:10m
    - else:
      - narrate "<&c>You cannot use this ability for <player.flag[teleport_cooldown].expiration.formatted>."
