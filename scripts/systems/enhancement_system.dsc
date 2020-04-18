star_item_command:
  type: command
  name: star_item
  description: star_item
  usage: /star_item
  script:
    - define item:<player.item_in_hand>
    - if <[item].nbt[used_sockets]||null> == null:
      - adjust def:item nbt:stars/0
    - adjust def:item nbt:stars/<[item].nbt[stars].add[1]>
    - define val:<util.random.decimal[15].to[30]>
    - define val:<util.random.decimal[12].to[<[val]>]>
    - define val:<util.random.decimal[9].to[<[val]>]>
    - define val:<util.random.decimal[5].to[<[val]>]>
    - define val:<util.random.decimal[1].to[<[val]>]>
    - foreach <[item].nbt_keys> as:stat:
      - if <[stat].starts_with[base_stats.]>:
        - define stat:<[stat].replace[base_stats.].with[]>
        - if <util.random.int[1].to[3]> == 1:
          - define value:<[item].nbt[star_stat.<[stat]>]||0>
          - adjust def:item nbt:star_stat.<[stat]>/<[value].add[<[val]>]>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

socket_item_command:
  type: command
  name: socket_item
  description: socket_item
  usage: /socket_item
  script:
    - define item:<player.item_in_hand>
    - if <[item].nbt[used_sockets]||null> == null:
      - adjust def:item nbt:used_sockets/0
    - adjust def:item nbt:used_sockets/<[item].nbt[used_sockets].add[1]>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

enhancement_inventory_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Enhancement Menu<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [enhance_upgrade_btn] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

enhance_upgrade_btn:
  type: item
  material: anvil
  display name: <&c>Upgrade Star Force
  GUI_Inventory: upgrade_star_force_inventory_gui

upgrade_star_force_inventory_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Upgrade Star Force<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [upgrade_btn] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [] [] [] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

upgrade_btn:
  type: item
  material: anvil
  display name: <&c>Enhance

enhancement_gui_handler:
  type: world
  events:
    on player closes upgrade_star_force_inventory_gui:
      - inventory add d:<player.inventory> o:<context.inventory.slot[21]>
      - inventory add d:<player.inventory> o:<context.inventory.slot[25]>
    on player clicks in upgrade_star_force_inventory_gui:
      - if <context.raw_slot> < 46:
        - if !<list[21|23|25].contains[<context.raw_slot>]>:
          - determine passively cancelled
          - stop
        - if <context.raw_slot> == 21:
          - if <context.cursor_item.material.name> != air:
            - if <context.cursor_item.script.yaml_key[max_stars]||null> == null:
              - determine passively cancelled
              - stop
            - else:
              - inventory set d:<player.open_inventory> o:<context.cursor_item.with[quantity=1]> slot:21
              - adjust <player> item_on_cursor:<context.cursor_item.with[quantity=<context.cursor_item.quantity.sub[1]>]>
        - if <context.raw_slot> == 23:
          - determine passively cancelled
          - if <player.open_inventory.slot[25].material.name> != air:
            - stop
          - if <player.open_inventory.slot[21].nbt[stars]||1> <= <player.open_inventory.slot[21].script.yaml_key[max_stars]>:
            - define item:<item[diamond]>
            - wait 15t
            - define val1:<util.random.int[15].to[30]>
            - if <player.open_inventory.script_name> != upgrade_star_force_inventory_gui:
              - stop
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val1]>]> slot:39
            - wait 15t
            - if <player.open_inventory.script_name> != upgrade_star_force_inventory_gui:
              - stop
            - define val2:<util.random.int[12].to[<[val1]>]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val2]>]> slot:40
            - wait 15t
            - if <player.open_inventory.script_name> != upgrade_star_force_inventory_gui:
              - stop
            - define val3:<util.random.int[9].to[<[val2]>]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val3]>]> slot:41
            - wait 15t
            - if <player.open_inventory.script_name> != upgrade_star_force_inventory_gui:
              - stop
            - define val4:<util.random.int[5].to[<[val3]>]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val4]>]> slot:42
            - wait 15t
            - if <player.open_inventory.script_name> != upgrade_star_force_inventory_gui:
              - stop
            - define val5:<util.random.int[1].to[<[val4]>]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val5]>]> slot:43
            - define item:<player.open_inventory.slot[21]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[item].quantity.sub[1]>]> slot:21
            - adjust def:item nbt:stars/<[item].nbt[stars].+1||1>
            - foreach <[item].nbt_keys> as:stat:
              - if <[stat].starts_with[base_stats.]>:
                - define stat:<[stat].replace[base_stats.].with[]>
                - if <util.random.int[1].to[3]> == 1:
                  - define value:<[item].nbt[star_stat.<[stat]>]||0>
                  - adjust def:item nbt:star_stat.<[stat]>:<[value].add[val5]>
            - inject build_item
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=1]> slot:25