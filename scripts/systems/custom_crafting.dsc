custom_crafting_test_item2:
  type: item
  display name: <&a>Crafting Test Item 2
  material: iron_ingot
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - "regex:(.*)_log|custom_iron_nugget|custom_iron_nugget"
        - "custom_iron_nugget|custom_iron_ingot|custom_iron_nugget"
        - "custom_iron_nugget|custom_iron_nugget|custom_iron_nugget"
    2:
      type: shapeless
      output_quantity: 1
      input: custom_iron_ingot|custom_iron_ingot|custom_iron_nugget|custom_iron_nugget

custom_crafting_test_item:
  type: item
  display name: <&a>Crafting Test Item
  material: iron_sword
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - "air|custom_iron_ingot|"
        - "air|custom_stick|air"
        - "air|air|air"
    2:
      type: shapeless
      output_quantity: 1
      input: custom_iron_ingot|custom_iron_ingot|custom_stick

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
    - define this_slot:0
    - foreach <[this_script].yaml_key[custom_recipes.<[recipe_number]>.input]> as:recipe_line:
      - foreach <[recipe_line].as_list> as:this_input:
        - define this_slot:++
        - define <[this_slot]>:<[this_input]>
        - if <[this_input].starts_with[regex<&co>]>:
          - define regex_used:true
    - repeat 9 as:num:
      - if <[<[num]>].is[==].to[]>:
        - define <[num]>:air
    - if <[regex_used]||false>:
      - repeat 9 as:input_slot:
        - if <[<[input_slot]>].starts_with[regex<&co>]>:
          - define <[<[input_slot]>]>.list:<server.list_scripts.filter[container_type.is[==].to[item]].parse[script.name].filter[matches[<[<[input_slot]>].after[<&co>]>]].escaped>
      - run custom_crafting_recursive_shaped_recipe def:<[1]>|<[2]>|<[3]>|<[4]>|<[5]>|<[6]>|<[7]>|<[8]>|<[9]>
    - else:
      - yaml id:custom_recipes_shaped set <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.item:<[this_script].name>
      - yaml id:custom_recipes_shaped set <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.output_quantity:<[this_script].yaml_key[custom_recipes.<[recipe_number]>.output_quantity]||1>
  process_shapeless_recipe:
    - yaml id:custom_recipes_shapeless set <[this_script].yaml_key[custom_recipes.<[recipe_number]>.input].as_list.pad_right[9].with[air].alphabetical.separated_by[.]>.item:<[this_script].name>
    - yaml id:custom_recipes_shapeless set <[this_script].yaml_key[custom_recipes.<[recipe_number]>.input].as_list.pad_right[9].with[air].alphabetical.separated_by[.]>.output_quantity:<[this_script].yaml_key[custom_recipes.<[recipe_number]>.output_quantity]||1>
  events:
    on server start:
      - inject locally build_stuff
    on script reload:
      - inject locally build_stuff

custom_crafting_recursive_shaped_recipe:
  type: task
  definitions: 1,2,3,4,5,6,7,8,9
  script:
    - repeat 9:
      - if <[<[value]>].unescaped.before[@]||null> == li:
        - foreach <[<[value]>].unescaped.as_list> as:this_slot:
          - define <[value]>:<[this_slot]>
          - run custom_crafting_recursive_shaped_recipe def:<[1]>|<[2]>|<[3]>|<[4]>|<[5]>|<[6]>|<[7]>|<[8]>|<[9]>
        - define regexed:true
    - if !<[regexed]||false>:
        - yaml id:custom_recipes_shaped set <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.item:<[this_script].name>
        - yaml id:custom_recipes_shaped set <[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.output_quantity:<[this_script].yaml_key[custom_recipes.<[recipe_number]>.output_quantity]||1>

custom_crafting_inventory:
  type: inventory
  mapped_crafting_slots: 12|13|14|21|22|23|30|31|32
  output_slot: 26
  definitions:
    filler: <item[gui_invisible_item]>
    GUITop: <item[gui_custom_crafting_top]>
    GUIBottom: <item[gui_custom_crafting_bottom]>
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
      - if !<script[custom_crafting_inventory].yaml_key[mapped_crafting_slots].as_list.contains[<context.raw_slot>]||false> && <script[custom_crafting_inventory].yaml_key[output_slot]> != <context.raw_slot> && <context.raw_slot> < 55:
        - determine cancelled
      - else if <script[custom_crafting_inventory].yaml_key[output_slot]> == <context.raw_slot> && <context.inventory.slot[<context.raw_slot>].material.name> == air:
        - determine cancelled

    on player drags in custom_crafting_inventory:
      - if <context.raw_slots.contains[<script[custom_crafting_inventory].yaml_key[output_slot]>]>:
        - determine cancelled
      - else if <context.raw_slots.contains_any[<script[custom_crafting_inventory].yaml_key[mapped_crafting_slots]>]>:
        - wait 1t
        - inject custom_crafting_determineOutput

    on player clicks in custom_crafting_inventory priority:-1000:
      - inject custom_crafting_handleInput

    on player closes custom_crafting_inventory:
      - foreach <script[custom_crafting_inventory].yaml_key[mapped_crafting_slots]>:
        - if <context.inventory.slot[<[value]>].material.name> != air:
          - define list:|:<context.inventory.slot[<[value]>]>
      - note remove as:crafting.<player.uuid>
      - if <[list]||null> != null:
        - give <[list]>
        - wait 1t
        - inventory update

custom_crafting_handleInput:
  type: task
  script:
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
    - define output:<yaml[custom_recipes_shaped].read[<[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.item]||<yaml[custom_recipes_shapeless].read[<[items].alphabetical.separated_by[.]>.item]||null>>
    - define output_quantity:<yaml[custom_recipes_shaped].read[<[1]>.<[2]>.<[3]>.<[4]>.<[5]>.<[6]>.<[7]>.<[8]>.<[9]>.output_quantity]||<yaml[custom_recipes_shapeless].read[<[items].alphabetical.separated_by[.]>.output_quantity]||null>>
    - if <[output]> != null:
      - inventory set d:crafting.<player.uuid> slot:<script[custom_crafting_inventory].yaml_key[output_slot]> o:<[output].as_item.with[quantity=<[output_quantity]>]>
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