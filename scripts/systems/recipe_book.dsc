recipe_book_inventory:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  procedural items:
  - define type1:<player.flag[context].split[/].get[1]||all>
  - define page:<player.flag[context].split[/].get[2]||1>
  - flag <player> context:!
  - foreach <yaml[server.recipe_book].list_keys[]||<list[]>> as:type2:
    - foreach <yaml[server.recipe_book].list_keys[<[type2]>]||<list[]>> as:item:
      - define items:|:<[item]>
  - define items:<[items].deduplicate.alphabetical>
  - repeat 45:
    - if <[items].size> >= <[value].add[<[page].mul[44].sub[44]>]>:
      - define list:|:<item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item||<item[air]>>
    - else:
      - define list:|:<item[air]>
  - define list:|:<item[gui_close_btn].with[nbt=page/<[page]>|type/<[type1]>]>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[w_filler] [w_filler] [w_filler] [previous_page_button] [] [next_page_button] [w_filler] [w_filler] [w_filler]"

recipe_book_chooser:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Recipes<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_smeltery:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Smeltery<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
    gui_top: <item[gui_smeltery_top]>
    gui_bottom: <item[gui_smeltery_bottom]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[gui_top] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[gui_bottom] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [smeltery_timer] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_alchemy:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Alchemy<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_alchemy_station_top]>
    gui_bottom: <item[gui_alchemy_station_bottom]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[gui_top] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_bottom] [w_filler] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [alchemy_station_timer] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_crafting:
  type: inventory
  inventory: workbench
  title: <&6>◆<&a><&n><&l>Crafting<&r><&6>◆
  
recipe_book_furnace:
  type: inventory
  inventory: furnace
  title: <&6>◆ <&a><&n><&l>Furnace<&r> <&6>◆
  
recipe_book_altar:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Altar<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_altar_top]>
    gui_bottom: <item[gui_altar_bottom]>
  slots:
  - "[w_filler] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_top] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [altar_timer]"
  - "[gui_bottom] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [w_filler]"

recipe_book_ores:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Ores<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_mob_info:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Mob Info<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_mob_drops:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Mob Drops<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_events:
  type: world
  events:
    on player clicks in recipe_book_*:
      - determine passively cancelled
      - narrate <context.raw_slot>
      - if <context.raw_slot> != -998:
        - if <player.open_inventory.script_name> == recipe_book_inventory:
          - if <context.raw_slot> < 55:
            - define page:<player.open_inventory.slot[50].nbt[page]>
            - define type:<player.open_inventory.slot[50].nbt[type]>
            - if <context.item.script.name> == next_page_button:
              - flag <player> context:<[type]>/<[page].add[1]>
              - inventory open d:recipe_book_inventory
            - if <context.item.script.name> == previous_page_button:
              - flag <player> context:<[type]>/<[page].sub[1]>
              - inventory open d:recipe_book_inventory
            - if <context.item.script.name> == crafting_icon:
              - flag <player> context:crafting/1
              - inventory open d:recipe_book_inventory
            - if <context.raw_slot> < 46:
              - run show_recipes def:<context.item>
        - else if <player.open_inventory.script_name> == recipe_book_chooser:
          - if <context.item.nbt[type]||null> != null:
            - run show_recipe def:<context.item.script.name>|<context.item.nbt[type]>
        - else:
          - if <context.item.script.name.starts_with[custom_]||false>:
            - run show_recipes def:<context.item>
    on player closes recipe_book_*:
      - flag <player> context:!
      
show_recipes:
  type: task
  definitions: item
  script:
    - define list:<list[]>
    - foreach <yaml[server.recipe_book].list_keys[]> as:type:
      - if <yaml[server.recipe_book].read[<[type]>.<[item].script.name>]||null> != null:
        - define list:|:<[item].with[lore=<[type]>;nbt=type/<[type]>]>
        - narrate <[type]>
    - if <[list].size> == 1:
      - run show_recipe def:<[list].get[1]>|<[list].get[1].nbt[type]>
    - else:
      - define inv:<inventory[recipe_book_chooser]>
      - inventory open d:<[inv]>
      - foreach <[list]> as:item:
        - inventory add d:<[inv]> o:<[item]>

show_recipe:
  type: task
  definitions: item|type
  script:
    - if <[item].script.name||null> != null:
      - define item:<[item].script.name>
    - if <[type]> == mob_drops:
      - define inv:<inventory[recipe_book_mob_drops]>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:11 o:<item[<entity[<yaml[server.recipe_book].read[mob_drops.<[item]>.dropped_by]>].script.yaml_key[entity_type]||<el@zombie>>_spawn_egg].with[display_name=<&r>Dropped<&sp>by:<&sp><entity[<yaml[server.recipe_book].read[mob_drops.<[item]>.dropped_by]>].script.yaml_key[custom_name]>]>
      - inventory set d:<[inv]> slot:13 o:<item[gold_nugget].with[display_name=Amount<&sp>dropped;lore=<&r>Max<&sp>Amount:<&sp><yaml[server.recipe_book].read[mob_drops.<[item]>.max_quantity]>|<&r>Min<&sp>Amount:<&sp><yaml[server.recipe_book].read[mob_drops.<[item]>.min_quantity]>]>
    - if <[type]> == ore_spawn:
      - define inv:<inventory[recipe_book_ores]>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:12 o:<item[stone].with[display_name=<&r><&6>Biome:<&sp><yaml[server.recipe_book].read[ore_spawn.<[item]>.biome]>]>
      - inventory set d:<[inv]> slot:14 o:<item[<yaml[server.recipe_book].read[ore_spawn.<[item]>.block]>].with[display_name=<&r><&6>Block:<&sp><yaml[server.recipe_book].read[ore_spawn.<[item]>.block]>]>
      - inventory set d:<[inv]> slot:16 o:<item[stone].with[display_name=<&r><&6>Chance:<&sp>1<&sp>in<&sp><yaml[server.recipe_book].read[ore_spawn.<[item]>.chance]>]>
    - if <[type]> == furnace:
      - define inv:<inventory[recipe_book_furnace]>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:1 o:<item[<yaml[server.recipe_book].read[<[type]>.<[item]>.input]>]>
      - inventory set d:<[inv]> slot:3 o:<item[<[item]>]>
    - if <[type]> == shaped || <[type]> == shapeless:
      - define inv:<inventory[recipe_book_crafting]>
      - inventory open d:<[inv]>
      - repeat 9:
        - if <[value]> <= <yaml[server.recipe_book].read[<[type]>.<[item]>.input].as_list.size>
          - inventory set d:<[inv]> slot:<[value].add[1]> o:<item[<yaml[server.recipe_book].read[<[type]>.<[item]>.input].as_list.get[<[value]>]>]>
      - inventory set d:<[inv]> slot:1 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[<[type]>.<[item]>.output_quantity]>]>
    - if <[type]> == altar:
      - define inv:<inventory[recipe_book_altar]>
      - define slotmap:<list[3/in|5/in|7/in|21/in|25/in|39/in|41/in|43/in|23/out]>
      - define input:<yaml[server.recipe_book].read[altar.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - foreach <list[3|5|7|21|25|39|41|43]> as:in:
        - if <[loop_index]> <= <[input].size>:
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[quantity=<[input].get[<[loop_index]>].split[/].get[2]>]||<item[air]>>
      - inventory set d:<[inv]> slot:23 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[altar.<[item]>.output_quantity]>]>
    - if <[type]> == alchemy:
      - define inv:<inventory[recipe_book_alchemy]>
      - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
      - define input:<yaml[server.recipe_book].read[alchemy.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - foreach <list[12|16|30|34]> as:in:
        - if <[loop_index]> <= <[input].size>:
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[quantity=<[input].get[<[loop_index]>].split[/].get[2]>]||<item[air]>>
      - inventory sets d:<[inv]> slot:23 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[alchemy.<[item]>.output_quantity]>]>
    - if <[type]> == smeltery:
      - define inv:<inventory[recipe_book_smeltery]>
      - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
      - define input:<yaml[server.recipe_book].read[smeltery.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:16 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[smeltery.<[item]>.output_quantity]>]>
      - foreach <list[11|12|20|21|29|30]> as:in:
        - if <[loop_index]> <= <[input].size>
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[quantity=<[input].get[<[loop_index]>].split[/].get[2]>]||<item[air]>>
      - inventory adjust d:<[inv]> slot:50 display_name:<&7>Cooking<&sp><item[<[item]>].script.yaml_key[display<&sp>name].parsed>
      - if <yaml[server.recipe_book].read[smeltery.<[item]>.cook_time].as_duration.in_seconds> >= 60:
        - inventory adjust d:<[inv]> slot:50 lore:<&f><yaml[server.recipe_book].read[smeltery.<[item]>.cook_time].as_duration.in_minutes.round_up><&sp>Minutes
      - else:
        - inventory adjust d:<[inv]> slot:50 lore:<&f><yaml[server.recipe_book].read[smeltery.<[item]>.cook_time].as_duration.in_seconds.round_up><&sp>Seconds

crafting_icon:
  type: item
  material: crafting_table
  display name: <&6>Crafting Recipes

mob_drops_icon:
  type: item
  material: spawn_egg
  display name: <&6>Mob Drops

crafting_icon:
  type: item
  material: iron_ore
  display name: <&6>Ore Drops
