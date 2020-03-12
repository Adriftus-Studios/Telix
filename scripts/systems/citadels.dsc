citadel_events:
  type: world
  events:
    on player clicks block with *_lock:
      - wait 1t
      - if <context.location.material.name.ends_with[_door]> || <context.location.material.name.ends_with[_trapdoor]>:
        - if !<server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.simple>.yml]>:
          - run lock_door def:<player>|<context.location>|<context.item.script.yaml_key[lock_strength]>
        - else:
          - narrate "<&c>That door is already locked."
    on delta time secondly every:1:
      # unload timer
      - foreach <server.list_flags.filter[starts_with[unload_timer.]]>:
        - if <server.flag[<[value]>].expiration.in_seconds> <= 1:
          - if <[value].replace[unload_timer.].with[].starts_with[locked_door_]>:
            - yaml id:<[value].replace[unload_timer.].with[]> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[value].replace[unload_timer.].with[]>.yml
            - yaml id:<[value].replace[unload_timer.].with[]> unload
          - else:
            - yaml id:<[value].replace[unload_timer.].with[]> savefile:DONT_PUT_SHIT_IN_HERE/other/<[value].replace[unload_timer.].with[]>.yml
            - yaml id:<[value].replace[unload_timer.].with[]> unload
    on player right clicks *door:
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.simple>.yml]>:
        - yaml load:DONT_PUT_SHIT_IN_HERE/locked_doors/<context.location.simple>.yml id:locked_door_<context.location.simple>
        - flag server unload_timer.locked_door_<context.location.simple> duration:10s
        - if <yaml[locked_door_<context.location.simple>].read[owner]> == <player>:
          - narrate a
        - else if <yaml[locked_door_<context.location.simple>].read[type]||player> == guild:
          - narrate TODO
        - else:
          - if <context.item.script.yaml_key[category]||null> == lock_pick:
            - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
            - yaml id:locked_door_<context.location.simple> set strength:<yaml[locked_door_<context.location.simple>].read[strength].sub[1]>
            - wait 1t
            - narrate <yaml[locked_door_<context.location.simple>].read[strength]>
            - if <yaml[locked_door_<context.location.simple>].read[strength]> < 1:
              - yaml id:locked_door_<context.location.simple> unload
              - adjust server delete_file:DONT_PUT_SHIT_IN_HERE/locked_doors/<context.location.simple>.yml
              - narrate "<&b>The lock finally broke."
          - determine cancelled

lock_door:
  type: task
  definitions: player|location|strength
  script:
  - yaml id:locked_door_<[location].simple> create
  - yaml id:locked_door_<[location].simple> set strength:<[strength]>
  - yaml id:locked_door_<[location].simple> set owner:<[player]>
  - yaml id:locked_door_<[location].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].simple>.yml
  - flag server unload_timer.locked_door_<[location].simple> duration:10s
  - if <[location].material.half> == BOTTOM:
    - yaml id:locked_door_<[location].up[1].simple> create
    - yaml id:locked_door_<[location].up[1].simple> set strength:<[strength]>
    - yaml id:locked_door_<[location].up[1].simple> set owner:<[player]>
    - yaml id:locked_door_<[location].up[1].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].up[1].simple>.yml
    - flag server unload_timer.locked_door_<[location].up[1].simple> duration:10s
  - if <[location].material.half> == TOP:
    - yaml id:locked_door_<[location].down[1].simple> create
    - yaml id:locked_door_<[location].down[1].simple> set strength:<[strength]>
    - yaml id:locked_door_<[location].down[1].simple> set owner:<[player]>
    - yaml id:locked_door_<[location].down[1].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].down[1].simple>.yml
    - flag server unload_timer.locked_door_<[location].down[1].simple> duration:10s


custom_iron_lock:
  type: item
  material: iron_ingot
  category: lock
  display name: <&7>Iron Lock
  lock_strength: 10

custom_lock_pick:
  type: item
  material: stick
  category: lock_pick
  display name: <&7>Lock Pick
  break_chance: 1