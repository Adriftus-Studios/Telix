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
  size: 45
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
      - narrate <context.raw_slot>
      - narrate <context.slot>
      - if <context.raw_slot> < 46:
        - if !<list[21|23|25].contains[<context.raw_slot>]>:
          - determine passively cancelled
          - stop
        - if <context.raw_slot> == 21:
          - if <context.cursor_item.script.yaml_key[max_stars]||null> != null:
            - wait 10t
            - define val1:<util.random.int[20].to[5]>
            
          - else:
            - determine passively cancelled
            - stop
        - if <context.raw_slot> == 23:
          - if <player.open_inventory>