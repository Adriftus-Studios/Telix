crafting_test_item:
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

crafting_openInventory:
  type: task
  script:
    - note <inventory[custom_crafting_inventory]> as:crafting.<player.uuid>
    - inventory open d:crafting.<player.uuid>

# DEBUG STUFF BELOW
custom_crafting_inventory_testCommand:
  type: command
  name: testcraft
  script:
    - inject crafting_openInventory

custom_crafting_test:
  type: world
  events:
    on player clicks in custom_crafting_inventory:
      - narrate "raw_slot<&co> <context.raw_slot>"
      - narrate "slot<&co> <context.slot>"