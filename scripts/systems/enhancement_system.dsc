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
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

enhancement_inventory_gui:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Enhancement Menu<&r> <&6>◆
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
  title: <green><&6>◆ <&a><&n><&l>Upgrade Star Force<&r> <&6>◆
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
    on player clicks in enhancement_inventory_gui:
    on player clicks in upgrade_star_force_inventory_gui:
      - if <context.raw_slot> < 46:
        - if !<list[21|23|25].contains[<context.raw_slot>]>:
          - determine passively cancelled
          - stop
        - if <context.raw_slot> == 21:
          - if !<context.cursor_item.script.yaml_key[max_stars]||null> != null:
            - if <context.cursor_item.material.name> != air:
                - determine passively cancelled
                - stop
        - if <context.raw_slot> == 23:
          - determine passively cancelled
          - if <player.open_inventory.slot[21].nbt[stars]||0> < <player.open_inventory.slot[21].script.yaml_key[max_stars]>:
            - wait 10t
            - define val1:<util.random.int[10].to[20]>
            - define item:<item[diamond]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val1]>]> slot:39
            - wait 10t
            - define val2:<util.random.int[8].to[<[val1]>]>
            - define item:<item[diamond]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val2]>]> slot:40
            - wait 10t
            - define val3:<util.random.int[6].to[<[val2]>]>
            - define item:<item[diamond]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val3]>]> slot:41
            - wait 10t
            - define val4:<util.random.int[4].to[<[val3]>]>
            - define item:<item[diamond]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val4]>]> slot:42
            - wait 10t
            - define val5:<util.random.int[1].to[<[val4]>]>
            - define item:<item[diamond]>
            - inventory set d:<player.open_inventory> o:<[item].with[quantity=<[val5]>]> slot:43