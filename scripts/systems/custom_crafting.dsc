custom_crafting_test_item:
  type: item
  display name: <&a>Crafting Test Item
  material: iron_sword
  custom_recipes:
    1:
      type: shaped
      recipe:
        - "[] [custom_iron_ingot] []"
        - "[] [custom_stick] []"
        - "[] [] []"
    2:
      type: shapeless
      recipe: custom_iron_ingot|custom_iron_ingot|custom_stick

custom_crafting_build_crafting_matrix:
  type: world
  build_stuff:
    - yaml create id:custom_recipes_shaped
    - yaml create id:custom_recipes_shapeless
    - foreach <server.list_scripts.filter[container_type.is[==].to[ITEM]]> as:this_script:
      - if <[this_script].yaml_key[custom_recipes]||null> != null:
        - inject locally process_recipes
  process_recipes:
    - foreach <[this_script].list_keys[custom_recipes]> as:recipe_number:
      - if <[this_script].yaml_key[custom_recipes.<[recipe_number]>.type]> == shaped:
        - inject locally process_shaped_recipe
      - else if <[this_script].yaml_key[custom_recipes.<[recipe_number]>.type]> == shapeless:
        - inject locally process_shapeless_recipe
  process_shaped_recipe:
    - define this_slot:1
    - foreach <[this_script].yaml_key[custom_recipes.<[recipe_number]>.recipe]> as:recipe_line:
      - define <[this_slot]>:<[recipe_line].after[<&lb>].before[<&rb>]>
      - define <[this_slot].+[1]>:<[recipe_line].after[<&lb>].after[<&lb>].before[<&rb>]>
      - define <[this_slot].+[2]>:<[recipe_line].after[<&lb>].after[<&lb>].after[<&lb>].before[<&rb>]>
      - define this_slot:+:3
    - repeat 9 as:num:
      - if <[<[num]>].is[==].to[]>:
        - define <[num]>:air
    - yaml id:custom_recipes_shaped set <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>:<[this_script].name>
  process_shapeless_recipe:
    - yaml id:custom_recipes_shapeless set <[this_script].yaml_key[custom_recipes.<[recipe_number]>.recipe].as_list.alphabetical.separated_by[.]>:<[this_script].name>
  events:
    on server start:
      - inject locally build_stuff
    on script reload:
      - inject locally build_stuff

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
      - if !<script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].contains[<context.raw_slot>]||false> && <script[custom_crafting_inventory].yaml_key[output_slot]> != <context.raw_slot> && <context.raw_slot> < 55:
        - determine cancelled
      - else if <script[custom_crafting_inventory].yaml_key[output_slot]> == <context.raw_slot> && <context.inventory.slot[<context.raw_slot>].material.name> == air:
        - determine cancelled

    on player clicks in custom_crafting_inventory priority:-1000:
      - if <script[custom_crafting_inventory].yaml_key[output_slot]> == <context.raw_slot> && <context.inventory.slot[<context.raw_slot>].material.name> != air:
        - define got_item:true
      - wait 1t
      - if <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].contains[<context.raw_slot>]||false>:
        - inject custom_crafting_determineOutput
      - else if <[got_item]||false>:
        - if <context.cursor_item.material.name||air> != air:
          - if <context.cursor_item.script.name> == <context.inventory.slot[<context.raw_slot>].material.name> && <context.cursor_item.max_stack_size> > <context.cursor_item.quantity>:
            # Increment Cursor Item
            - adjust <player> cursor_item:<context.cursor_item.with[quantity=<context.cursor_item.quantity.+[1]>]>
            # Remove Clicked Item in Output
            - inventory set d:<context.inventory> slot:<context.slot> o:air
            # Cancel
            - determine cancelled
        - inject custom_crafting_takeIngredients
        - inject custom_crafting_determineOutput

custom_crafting_takeIngredients:
  type: task
  script:
    - foreach <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots]> as:slot:
      - inventory set d:crafting.<player.uuid> slot:<[slot]> o:<context.inventory.slot[<[slot]>].with[quantity=<context.inventory.slot[<[slot]>].quantity.-[1]>]>

custom_crafting_determineOutput:
  type: task
  script:
    - foreach <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots]>:
      - define <[loop_index]>:<context.inventory.slot[<[value]>].script.name||<context.inventory.slot[<[value]>].material.name>>
      - define items:|:<context.inventory.slot[<[value]>].script.name||<context.inventory.slot[<[value]>].material.name>>
    - announce <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>
    - define output:<yaml[custom_recipes_shaped].read[<[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>]||<yaml[custom_recipes_shaped].read[<[items].alphabetical.separated_by[.]>]||null>>
    - announce "Definitions<&co> <queue.definitions>"
    - if <[output]> != null:
      - inventory set d:crafting.<player.uuid> slot:<script[custom_crafting_inventory].yaml_key[output_slot]> o:<item[<[output]>]>
    - else:
      - inventory set d:crafting.<player.uuid> slot:<script[custom_crafting_inventory].yaml_key[output_slot]> o:air

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