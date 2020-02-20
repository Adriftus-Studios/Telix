
guilds_events:
  type: world
  debug: false
  events:
    on server stars:

my_guilds_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆
  size: 54
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_equipment_top]>
    gui_bottom: <item[gui_equipment_bottom]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
  
new_guilds_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>No Guild<&r> <&6>◆
  size: 27
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [new_guild_btn] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
  
guilds_gui_events:
  type: world
  debug: false
  events:
    on player clicks in new_guilds_gui:
    - if <context.raw_slot> > 27:
      - determine passively cancelled
    on player clicks new_guild_btn in new_guilds_gui:
    - if <context.raw_slot> > 27:
      - inventory add d:<player.inventory> o:<item[new_guild_book]>
    on player signs book:
    - if <context.book> == <item[new_guild_book]>:
      - narrate <context.title>
      # create guilds with title as name and page 1 as description

guilds_command:
  type: command
  name: guilds
  description: guilds
  usage: /guilds
  script:
    - inventory open d:new_guilds_gui

new_guild_btn:
  type: item
  material: snow
  equipment_rating: 0
  display name: "<&c>Create a new Guild"

new_guild_book:
  type: item
  material: writable_book