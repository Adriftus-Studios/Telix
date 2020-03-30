citadel_block_protection_events:
  type: world
  debug: false
  events:
    on player clicks block with *_lock:
      - wait 1t
      - if <context.location.material.name.ends_with[_door]> || <context.location.material.name.ends_with[_trapdoor]>:
        - if !<server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.simple>.yml]>:
          - run lock_door def:<player>|<context.location>|<context.item.script.yaml_key[lock_strength]>
          - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
          - narrate "<&7><&o>Click..."
        - else:
          - narrate "<&c>That door is already locked."
      - if <context.location.inventory||null> != null:
        - if !<server.list_files[DONT_PUT_SHIT_IN_HERE/locked_containers].contains[<context.location.simple>.yml]>:
          - run lock_container def:<player>|<context.location>|<context.item.script.yaml_key[lock_strength]>
          - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
          - narrate "<&7><&o>Click..."
        - else:
          - narrate "<&c>That container is already locked."
    on delta time secondly every:1:
      # unload timer
      - foreach <server.list_flags.filter[starts_with[unload_timer.]]>:
        - if <server.flag[<[value]>].expiration.in_seconds> <= 1:
          - if <[value].replace[unload_timer.].with[].starts_with[locked_door_]>:
            - yaml id:<[value].replace[unload_timer.].with[]> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[value].replace[unload_timer.locked_door_].with[].to_lowercase>.yml
          - if <[value].replace[unload_timer.].with[].starts_with[reinforced_block_]>:
            - yaml id:<[value].replace[unload_timer.].with[]> savefile:DONT_PUT_SHIT_IN_HERE/reinforced_block/<[value].replace[unload_timer.reinforced_block_].with[].to_lowercase>.yml
          - else:
            - yaml id:<[value].replace[unload_timer.].with[]> savefile:DONT_PUT_SHIT_IN_HERE/other/<[value].replace[unload_timer.].with[].to_lowercase>.yml
          - yaml id:<[value].replace[unload_timer.].with[]> unload
    on player right clicks *door:
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.simple>.yml]||false> || <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.down[1].simple>.yml]||false>:
        - define loc:<context.location.simple>
        - if <context.location.material.half||null> == TOP:
          - define loc:<context.location.down[1].simple>
        - if !<yaml.list.contains[locked_door_<[loc]>]>:
          - yaml load:DONT_PUT_SHIT_IN_HERE/locked_doors/<[loc]>.yml id:locked_door_<[loc]>
        - flag server unload_timer.locked_door_<[loc]> duration:10s
        - if <yaml[locked_door_<[loc]>].read[owner]> != <player>:
          - if <yaml[locked_door_<[loc]>].read[type]||player> == guild:
            - narrate TODO
          - else:
            - determine passively cancelled
            - if <context.item.script.yaml_key[category]||null> == lock_pick:
              - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
              - yaml id:locked_door_<[loc]> set strength:--
              - if <yaml[locked_door_<[loc]>].read[strength]> < 1:
                - flag server unload_timer.locked_door_<[loc]>:!
                - yaml id:locked_door_<[loc]> unload
                - adjust server delete_file:DONT_PUT_SHIT_IN_HERE/locked_doors/<[loc]>.yml
                - narrate "<&7><&o>Click..."
    on player breaks block:
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/reinforced_block].contains[<context.location.simple>.yml]>:
        - if !<yaml.list.contains[reinforced_block_<context.location.simple>]>:
          - yaml load:DONT_PUT_SHIT_IN_HERE/reinforced_block/<context.location.simple>.yml id:reinforced_block_<context.location.simple>
        - if <yaml[reinforced_block_<context.location.simple>].read[owner]> != <player>:
          - flag server unload_timer.reinforced_block_<context.location.simple> duration:10s
          - yaml id:reinforced_block_<context.location.simple> set strength:--
          - determine passively cancelled
          - if <player.item_in_hand.material.name> != air:
            - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<proc[fake_durability_use].context[<player.item_in_hand>]||<item[air]>>
          - if <yaml[reinforced_block_<context.location.simple>].read[strength]> < 1:
            - flag server unload_timer.reinforced_block_<context.location.simple>:!
            - yaml id:reinforced_block_<context.location.simple> unload
            - adjust server delete_file:DONT_PUT_SHIT_IN_HERE/reinforced_block/<context.location.simple>.yml
        - else:
          - flag server unload_timer.reinforced_block_<context.location.simple>:!
          - yaml id:reinforced_block_<context.location.simple> unload
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<context.location.simple>.yml]>:
        - if !<yaml.list.contains[locked_door_<context.location.simple>]>:
          - yaml load:DONT_PUT_SHIT_IN_HERE/locked_doors/<context.location.simple>.yml id:locked_door_<context.location.simple>
        - flag server unload_timer.locked_door_<context.location.simple> duration:10s
        - if <yaml[locked_door_<context.location.simple>].read[owner]> != <player>:
          - determine passively cancelled
        - else:
          - flag server unload_timer.locked_door_<context.location.simple>:!
          - yaml id:locked_door_<context.location.simple> unload
          - adjust server delete_file:DONT_PUT_SHIT_IN_HERE/locked_doors/<context.location.simple>.yml
    on player places block:
      - if <player.has_flag[citadel_build_mode]>:
        - define item:<player.flag[citadel_build_mode].split[|].get[1].as_item>
        - if <[item].script.yaml_key[block_reinforcement_strength]||null> != null || <player.inventory.find.scriptname[<[item].script.name>]> == -1:
          - inventory set d:<player.inventory> slot:<player.inventory.find.scriptname[<[item].script.name>]> o:<player.inventory.slot[<player.inventory.find.scriptname[<[item].script.name>]>].with[quantity=<player.inventory.slot[<player.inventory.find.scriptname[<[item].script.name>]>].quantity.sub[1]>]>
          - run reinforce_block def:<player>|<context.location>|<[item].script.yaml_key[block_reinforcement_strength]>
          - if <player.inventory.find.scriptname[<[item].script.name>]> == -1:
            - flag <player> citadel_build_mode:!
            - narrate "<&b>You have ran out of reinforcement material."
        - else:
          - flag <player> citadel_build_mode:!
          - narrate "<&b>You have ran out of reinforcement material."
    on player right clicks block:
      - stop
      - if <context.item.script.yaml_key[block_reinforcement_strength]||null> != null:
        - if <server.list_files[DONT_PUT_SHIT_IN_HERE/reinforced_block].contains[<context.location.simple>.yml]>:
          - if !<yaml.list.contains[reinforced_block_<context.location.simple>]>:
            - yaml load:DONT_PUT_SHIT_IN_HERE/reinforced_block/<context.location.simple>.yml id:reinforced_block_<context.location.simple>
          - if <yaml[reinforced_block_<context.location.simple>].read[owner]> == <player>:
            - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
            - narrate <context.item.script.yaml_key[block_reinforcement_strength]>
            - run reinforce_block def:<player>|<context.location>|<context.item.script.yaml_key[block_reinforcement_strength]>
        - else:
          - narrate <context.item.script.yaml_key[block_reinforcement_strength]>
          - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
          - run reinforce_block def:<player>|<context.location>|<context.item.script.yaml_key[block_reinforcement_strength]>

citadel_build_mode_command:
  type: command
  name: citadelbuildmode
  aliases:
  - "cbm"
  tab complete:
    - determine <list[self]>
  script:
    - if <player.item_in_hand.script.yaml_key[block_reinforcement_strength]||null> != null:
      - if <context.args.get[1]||null> != null:
        - flag <player> citadel_build_mode:!
        - wait 1t
        - flag <player> citadel_build_mode:<player.item_in_hand.script.name>|<context.args.get[1]>
        - narrate "<&b>You have entered Citadel Build Mode with <player.item_in_hand.script.yaml_key[display<&sp>name].parsed||<player.item_in_hand.material.name.substring[1,1].to_uppercase><player.item_in_hand.material.name.substring[2]>>."
      - else:
        - narrate "<&b>Not enough arguments."
    - else:
      - narrate "<&b>That item cannot be used to reinforce blocks."

citadel_command:
  type: command
  name: citadel
  aliases:
  - "c"
  script:
    - if <context.args.size> == 0:
      - narrate "not enough args"
    - else:
      - choose <context.args.get[1]>:
        - case create:
          - if <context.args.size> > 2:
            - narrate "to many args"
          - else:
            - run create_type def:citadels|<player>
            - run add_player_to_group def:citadels|<player>|<context.args.get[2]>|<player>
            - narrate "citadel group '<context.args.get[2]>' created for player '<player.name>'"
        - case list:
          - narrate <proc[get_group_list].context[citadels|<player>|mygroup|blocks]>

custom_citadel_test_item:
  type: item
  material: diamond
  display name: Citadel Test Item
  block_reinforcement_strength: 10

get_citadel_durability:
  type: procedure
  definitions: location
  debug: false
  script:
    - if <[location].material.side> == TOP:
      - define location:<[location].other_block>
    - if <server.list_files[DONT_PUT_SHIT_IN_HERE/reinforced_block].contains[<[location].simple>.yml]>:
      - if !<yaml.list.contains[reinforced_block_<[location].simple>]>:
        - yaml load:DONT_PUT_SHIT_IN_HERE/reinforced_block/<[location].simple>.yml id:reinforced_block_<[location].simple>
      - determine <yaml[reinforced_block_<[location].simple>].read[strength]||0>
    - else:
      - determine 0

get_lock_durability:
  type: procedure
  definitions: location
  debug: false
  script:
    - if <[location].material.name.ends_with[door]>:
      - if <[location].material.side> == TOP:
        - define location:<[location].other_block||<[location]>>
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<[location].simple>.yml]>:
        - if !<yaml.list.contains[locked_door_<[location].simple>]>:
          - yaml load:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].simple>.yml id:locked_door_<[location].simple>
        - determine <yaml[locked_door_<[location].simple>].read[strength]||0>
      - else:
        - determine 0
    - else if <[location].inventory||null> != null:
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_containers].contains[<[location].other_block.simple>.yml]>:
        - define location:<[location].other_block>
      - if !<yaml.list.contains[locked_container_<[location].simple>]>:
        - yaml load:DONT_PUT_SHIT_IN_HERE/locked_containers/<[location].simple>.yml id:locked_container_<[location].simple>
      - determine <yaml[locked_container_<[location].simple>].read[strength]||0>
    - else:
      - determine 0

reinforce_block:
  type: task
  definitions: player|location|strength
  debug: false
  script:
  - if <server.list_files[DONT_PUT_SHIT_IN_HERE/reinforced_block].contains[<[location].simple>.yml]>:
    - if !<yaml.list.contains[reinforced_block_<[location].simple>]>:
      - yaml load:DONT_PUT_SHIT_IN_HERE/reinforced_block/<[location].simple>.yml id:reinforced_block_<[location].simple>
  - else:
    - yaml id:reinforced_block_<[location].simple> create
  - yaml id:reinforced_block_<[location].simple> set strength:<[strength]>
  - yaml id:reinforced_block_<[location].simple> set owner:<[player]>
  - yaml id:reinforced_block_<[location].simple> savefile:DONT_PUT_SHIT_IN_HERE/reinforced_block/<[location].simple>.yml
  - flag server unload_timer.reinforced_block_<[location].simple> duration:10s

lock_container:
  type: task
  definitions: player|location|strength
  debug: false
  script:
  - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_containers].contains[<[location].simple>.yml]>:
    - if !<yaml.list.contains[locked_container_<[location].simple>]>:
      - yaml load:DONT_PUT_SHIT_IN_HERE/locked_containers/<[location].simple>.yml id:locked_container_<[location].simple>
  - else:
    - yaml id:locked_container_<[location].simple> create
  - yaml id:locked_container_<[location].simple> set strength:<[strength]>
  - yaml id:locked_container_<[location].simple> set owner:<[player]>
  - yaml id:locked_container_<[location].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_containers/<[location].simple>.yml
  - flag server unload_timer.locked_container_<[location].simple> duration:10s

lock_door:
  type: task
  definitions: player|location|strength
  debug: false
  script:
  - if <[location].material.half> == TOP:
    - define location:<[location].down[1]>
  - if <server.list_files[DONT_PUT_SHIT_IN_HERE/locked_doors].contains[<[location].simple>.yml]>:
    - if !<yaml.list.contains[locked_door_<[location].simple>]>:
      - yaml load:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].simple>.yml id:locked_door_<[location].simple>
  - else:
    - yaml id:locked_door_<[location].simple> create
  - yaml id:locked_door_<[location].simple> create
  - yaml id:locked_door_<[location].simple> set strength:<[strength]>
  - yaml id:locked_door_<[location].simple> set owner:<[player]>
  - yaml id:locked_door_<[location].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].simple>.yml
  - flag server unload_timer.locked_door_<[location].simple> duration:10s

custom_iron_lock:
  type: item
  material: iron_ingot
  category: lock
  display name: <&7>Iron Lock
  lock_strength: 100

custom_lock_pick:
  type: item
  material: stick
  category: lock_pick
  display name: <&7>Lock Pick
  break_chance: 1