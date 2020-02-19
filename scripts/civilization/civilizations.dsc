
civilization_events:
  type: world
  debug: false
  events:
    on server stars:

my_civ_gui:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>My Civilization<&r> <&6>◆
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
  
new_civ_gui:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>No Civilization<&r> <&6>◆
  size: 27
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [new_civ_btn] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
  
civilization_gui_events:
  type: world
  debug: false
  events:
    on player clicks in new_civ_gui:
    - determine passively cancelled
    on player clicks new_civ_btn in new_civ_gui:
    - inventory open d:in@generic[holder=ANVIL;title=Name<&sp>your<&sp>Civilization]
    on player prepares anvil craft item:
    - narrate <context.new_name>

civilization_command:
  type: command
  name: civ
  description: civ
  usage: /civ
  script:
    - inventory open d:new_civ_gui

new_civ_btn:
  type: item
  material: snow
  equipment_rating: 0
  display name: "<&c>Create a new Civilization"
