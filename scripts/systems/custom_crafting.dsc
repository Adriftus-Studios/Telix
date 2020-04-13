custom_crafting_test_item:
  type: item
  display name: <&a>Crafting Test Item
  material: iron_sword
  custom_recipes:
    1:
      type: shaped
      recipe:
        - "[] [] []"
        - "[] [] []"
        - "[] [] []"
    2:
      type: shapeless
      recipe: custom_iron_ingot|custom_iron_ingot|stick

custom_crafting_inventory:
  type: inventory
  mapped_crafting_slots: 12|13|14|21|22|23|30|31|32
  output_slot: 26
  definitions:
    filler: <item[white_stained_glass_pane]>
    GUITop: <item[white_stained_glass_pane]>
    GUIBottom: <item[white_stained_glass_pane]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [filler] [] [] [] [filler] [filler] [filler] [filler]"
    - "[filler] [filler] [] [] [] [filler] [filler] [] [filler]"
    - "[GUITop] [filler] [] [] [] [filler] [filler] [filler] [filler]"
    - "[GUIBottom] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

custom_crafting_openInventory:
  type: task
  script:
    - note <inventory[custom_crafting_inventory]> as:crafting.<player.uuid>
    - inventory open d:crafting.<player.uuid>

custom_crafting_events:
  type: world
  events:
    on player clicks in custom_crafting_inventory priority:-1000:
      - narrate <context.raw_slot>
      - if <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].contains[<context.slot>]||false>:
        - narrate <context.clicked_inventory.slot[<context.slot>]>
      

# DEBUG STUFF BELOW
custom_crafting_inventory_testCommand:
  type: command
  name: testcraft
  script:
    - inject custom_crafting_openInventory

# Crafting Slots:
# [12] [13] [14]
# [21] [22] [23]
# [30] [31] [32]