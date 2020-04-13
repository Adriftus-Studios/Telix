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
    on player clicks in custom_crafting_inventory:
      - if <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].contains[<context.raw_slot>]||true> && <script[custom_crafting_inventory].yaml_key[output_slot]> != <context.raw_slot>:
        - determine cancelled
    on player clicks in custom_crafting_inventory priority:-1000:
      - if <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].contains[<context.raw_slot>]||false>:
        - inject custom_crafting_determineOutput
      - else if <script[custom_crafting_inventory].yaml_key[output_slot]> == <context.raw_slot> && <context.inventory.slot[<context.raw_slot>].material.name> != air:
        - if <context.cursor_item.material.name||air> != air:
          - if <context.cursor_item.script.name> == <context.inventory.slot[<context.raw_slot>].material.name> && <context.cursor_item.max_stack_size> > <context.cursor_item.quantity>:
            # Increment Cursor Item
            - adjust <player> cursor_item:<context.cursor_item.with[quantity=<context.cursor_item.quantity.+[1]>]>
            # Remove Clicked Item in Output
            - inventory set d:<context.inventory> slot:<context.slot> o:air
            # Cancel
            - determine cancelled
        - inject custom_crafting_takeIngredients

custom_crafting_takeIngredients:
  type: task
  script:
    - foreach <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots]> as:slot:
      - inventory adjust slot:<context.slot> quantity:<context.inventory.slot[<context.slot>].quantity.-[1]>
      

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