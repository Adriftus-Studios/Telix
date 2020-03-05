custom_gui_command:
  type: command
  name: gui
  description: Opens the custom GUI template or replaced textures
  usage: /gui
  aliases:
    - testgui
  script:
    - inventory open d:<inventory[tester_gui]>

custom_inventory_handler:
  type: world
  events:
    on player clicks in tester_gui priority:10:
      - determine cancelled


tester_gui:
  type: inventory
  title: <green>Crafting Menu
  size: 54
  definitions:
    tester_gui_top: <item[item_tester_gui_top]>
    tester_gui_bottom: <item[item_tester_gui_bottom]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[tester_gui_top] [] [] [] [] [] [] [] []"
  - "[tester_gui_bottom] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"

########### To change the GUI, Change the CMD ############

item_tester_gui_top:
  type: item
  material: gold_nugget
  display name: <&6>
  mechanisms:
    custom_model_data: 2

item_tester_gui_bottom:
  type: item
  material: gold_nugget
  display name: <&6>
  mechanisms:
    custom_model_data: 1