recipe_book_inventory:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn].with[nbt=category/all]>
  slots:
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

rb_top:
  type: item
  material: gold_nugget
  display name: <&c>
  mechanisms:
    custom_model_data: 20

rb_bottom:
  type: item
  material: gold_nugget
  display name: <&c>
  mechanisms:
    custom_model_data: 19

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
  - "[custom_smeltery] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
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
  - "[custom_alchemy_station] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
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

recipe_book_note:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Ores<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

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
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_preparation_table:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Preparation<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_preparation_table_top]>
    gui_bottom: <item[gui_preparation_table_bottom]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [preparation_table_timer] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_used_for:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

recipe_book_events:
  type: world
  events:
    on player crafts item:
    - if <context.inventory.script_name||null> == recipe_book_crafting:
      - determine cancelled
    on player opens recipe_book_inventory:
    - define type:<player.flag[context].split[/].get[1]||all>
    - flag <player> context:!
    - if <[type]> == all:
      - foreach <yaml[server.recipe_book].list_keys[categories].alphabetical> as:cat:
        - inventory add d:<context.inventory> o:<item[stone].with[display_name=<&6><[cat].substring[1,1].to_uppercase><[cat].substring[2]>;nbt=category/<[cat]>]>
    - else:
      - if <yaml[server.recipe_book].list_keys[categories.<[type]>]||null> != null:
        - foreach <yaml[server.recipe_book].list_keys[categories.<[type]>].alphabetical> as:cat:
          - inventory add d:<context.inventory> o:<item[stone].with[display_name=<&6><[cat].substring[1,1].to_uppercase><[cat].substring[2]>;nbt=category/<[type]>.<[cat]>]>
      - else:
        - define items:<yaml[server.recipe_book].read[categories.<[type]>].alphabetical.parse[as_item]>
        - repeat 45:
          - inventory add d:<context.inventory> o:<[items].get[<[value]>].with[flags=HIDE_ATTRIBUTES]||<item[air]>>
    on player clicks in recipe_book_*:
      - if <context.raw_slot> <= <player.open_inventory.size>:
        - determine passively cancelled
      - if <context.raw_slot> != -998 && <context.raw_slot> <= <player.open_inventory.size> && <context.item.material.name> != air:
        - narrate <context.raw_slot>
        - if <player.open_inventory.script_name> == recipe_book_inventory:
          - if <context.item.nbt[category]||null> != null:
            - flag <player> context:<context.item.nbt[category]>
            - inventory open d:recipe_book_inventory
            - stop
        - if <context.click> == LEFT:
          - if <player.open_inventory.script_name> == recipe_book_inventory:
            - if <context.raw_slot> < 46:
              - run show_recipes def:<context.item>
          - else if <player.open_inventory.script_name> == recipe_book_chooser:
            - if <context.item.nbt[type]||null> != null:
              - run show_recipe def:<context.item.script.name>|<context.item.nbt[type]>
          - else:
            - if <context.item.script.name.starts_with[custom_]||false>:
              - run show_recipes def:<context.item>
        - if <context.click> == RIGHT:
          - run show_used_for_recipes def:<context.item.script.name>
      
show_used_for_recipes:
  type: task
  definitions: item
  script:
    - if <yaml[server.recipe_book].read[used_for.<[item]>]||null> != null:
      - define inv:<inventory[recipe_book_used_for]>
      - inventory open d:<[inv]>
      - define items:<yaml[server.recipe_book].read[used_for.<[item]>].as_list.parse[as_item]>
      - repeat 45:
        - inventory set d:<[inv]> slot:<[value]> o:<[items].get[<[value]>]||<item[air]>>

show_recipes:
  type: task
  definitions: item
  script:
    - define list:<list[]>
    - foreach <yaml[server.recipe_book].list_keys[].exclude[used_for].exclude[mob_info].exclude[categories]> as:type:
      - if <yaml[server.recipe_book].read[<[type]>.<[item].script.name>]||null> != null:
        - define list:|:<[item].with[lore=<[type]>;nbt=type/<[type]>]>
    - if <[list].size> == 0:
      - stop
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
    - if <[type]> == cooking:
      - define inv:<inventory[recipe_book_preparation_table]>
      - define slotmap:<list[12/in|20/in|21/in|22/in|30/in|25/out]>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:25 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[cooking.<[item]>.output_quantity]>]>
      - inventory set d:<[inv]> slot:21 o:<item[<yaml[server.recipe_book].read[cooking.<[item]>.main_ingredient].split[/].get[1]>].with[quantity=<yaml[server.recipe_book].read[cooking.<[item]>.main_ingredient].split[/].get[2]>]||<item[air]>>
      - inventory set d:<[inv]> slot:30 o:<item[<yaml[server.recipe_book].read[cooking.<[item]>.serving_dish].split[/].get[1]>].with[quantity=<yaml[server.recipe_book].read[cooking.<[item]>.serving_dish].split[/].get[2]>]||<item[air]>>
      - inventory set d:<[inv]> slot:20 o:<item[<yaml[server.recipe_book].read[cooking.<[item]>.side_ingredients].split[|].get[1].split[/].get[1]>].with[quantity=<yaml[server.recipe_book].read[cooking.<[item]>.side_ingredients].split[|].get[1].split[/].get[2]>]||<item[air]>>
      - inventory set d:<[inv]> slot:20 o:<item[<yaml[server.recipe_book].read[cooking.<[item]>.side_ingredients].split[|].get[2].split[/].get[1]>].with[quantity=<yaml[server.recipe_book].read[cooking.<[item]>.side_ingredients].split[|].get[2].split[/].get[2]>]||<item[air]>>
    - if <[type]> == notes:
      - define inv:<inventory[recipe_book_note]>
      - inventory open d:<[inv]>
      - define note:<yaml[server.recipe_book].read[notes.<[item]>].parsed>
      - foreach <[note].split[<&sp>]>:
        - define line:|:<[value]>
        - if <[line].length> > 30:
          - define lore:|:<[line].separated_by[<&sp>]>
          - define line:!
      - define lore:|:<[line].separated_by[<&sp>]>
      - inventory set d:<[inv]> slot:14 o:<item[paper].with[lore=<[lore]>]>
    - if <[type]> == mob_drops:
      - define inv:<inventory[recipe_book_mob_drops]>
      - inventory open d:<[inv]>
      - foreach <yaml[server.recipe_book].read[mob_drops.<[item]>.dropped_by].as_list> as:mob:
        - define lore:|:<&r><[mob].replace[entity_].with[].substring[1,1].to_uppercase><[mob].replace[entity_].with[].replace[_].with[<&sp>].substring[2]>
      - define egg:<item[<yaml[server.recipe_book].read[mob_drops.<[item]>.dropped_by].as_list.get[1].as_entity.script.yaml_key[entity_type]||<yaml[server.recipe_book].read[mob_drops.<[item]>.dropped_by].as_list.get[1]>>_spawn_egg]>
      - inventory set d:<[inv]> slot:12 o:<item[zombie_spawn_egg].with[display_name=<&7>Dropped<&sp>by<&co>;lore=<[lore]>]>
      - inventory set d:<[inv]> slot:14 o:<item[gold_nugget].with[display_name=Amount<&sp>dropped;lore=<&r>Max<&sp>Amount:<&sp><yaml[server.recipe_book].read[mob_drops.<[item]>.max_quantity]>|<&r>Min<&sp>Amount:<&sp><yaml[server.recipe_book].read[mob_drops.<[item]>.min_quantity]>]>
      - inventory set d:<[inv]> slot:16 o:<item[gold_nugget].with[display_name=Chance:<&sp>1<&sp>out<&sp>of<&sp><yaml[server.recipe_book].read[mob_drops.<[item]>.chance]>]>
    - if <[type]> == ore_spawn:
      - define inv:<inventory[recipe_book_ores]>
      - inventory open d:<[inv]>
      - foreach <yaml[server.recipe_book].read[ore_spawn.<[item]>.biome].as_list> as:biome:
        - define biome_lore:|:<&r><[biome].substring[1,1].to_uppercase><[biome].replace[_].with[<&sp>].substring[2]>
      - inventory set d:<[inv]> slot:11 o:<item[stone].with[display_name=<&r><&6>Biomes<&co>;lore=<[biome_lore]>]>
      - foreach <yaml[server.recipe_book].read[ore_spawn.<[item]>.block].as_list> as:block:
        - define lore:|:<&r><[block].substring[1,1].to_uppercase><[block].replace[_].with[<&sp>].substring[2]>
      - define block:<item[<yaml[server.recipe_book].read[ore_spawn.<[item]>.block].as_list.get[1]>]>
      - inventory set d:<[inv]> slot:13 o:<[block].with[display_name=<&r><&6>Blocks<&co>;lore=<[lore]>]>
      - inventory set d:<[inv]> slot:15 o:<item[stone].with[display_name=<&r><&6>Chance:<&sp>1<&sp>in<&sp><yaml[server.recipe_book].read[ore_spawn.<[item]>.chance]>]>
      - define tool:<item[<yaml[server.recipe_book].read[ore_spawn.<[item]>.tool]>]||<item[iron_axe]>>
      - inventory set d:<[inv]> slot:17 o:<[tool].with[display_name=<&r><&6>Tool<&sp>Required:<&sp><[tool].display||<&6>Any>;flags=HIDE_ATTRIBUTES]>
    - if <[type]> == furnace:
      - define inv:<inventory[recipe_book_furnace]>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:1 o:<item[<yaml[server.recipe_book].read[<[type]>.<[item]>.input]>].with[flags=HIDE_ATTRIBUTES]>
      - inventory set d:<[inv]> slot:3 o:<item[<[item]>].with[flags=HIDE_ATTRIBUTES]>
    - if <[type]> == shaped || <[type]> == shapeless:
      - define inv:<inventory[recipe_book_crafting]>
      - inventory open d:<[inv]>
      - repeat 9:
        - if <[value]> <= <yaml[server.recipe_book].read[<[type]>.<[item]>.input].as_list.size>
          - inventory set d:<[inv]> slot:<[value].add[1]> o:<item[<yaml[server.recipe_book].read[<[type]>.<[item]>.input].as_list.get[<[value]>]>].with[flags=HIDE_ATTRIBUTES]>
      - inventory set d:<[inv]> slot:1 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[<[type]>.<[item]>.output_quantity]>;flags=HIDE_ATTRIBUTES]>
    - if <[type]> == altar:
      - define inv:<inventory[recipe_book_altar]>
      - define slotmap:<list[3/in|5/in|7/in|21/in|25/in|39/in|41/in|43/in|23/out]>
      - define input:<yaml[server.recipe_book].read[altar.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - foreach <list[3|5|7|21|25|39|41|43]> as:in:
        - if <[loop_index]> <= <[input].size>:
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[quantity=<[input].get[<[loop_index]>].split[/].get[2]>;flags=HIDE_ATTRIBUTES]||<item[air]>>
      - inventory set d:<[inv]> slot:1 o:<item[altar_tier_<yaml[server.recipe_book].read[altar.<[item]>.tier]>]>
      - inventory set d:<[inv]> slot:23 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[altar.<[item]>.output_quantity]>].with[flags=HIDE_ATTRIBUTES]>
      - inventory adjust d:<[inv]> slot:27 display_name:<&7>Imbuing<&sp><item[<[item]>].script.yaml_key[display<&sp>name].parsed>
      - if <yaml[server.recipe_book].read[altar.<[item]>.cook_time].as_duration.in_seconds> >= 60:
        - inventory adjust d:<[inv]> slot:27 lore:<&f><yaml[server.recipe_book].read[altar.<[item]>.cook_time].as_duration.in_minutes.round_up><&sp>Minutes
      - else:
        - inventory adjust d:<[inv]> slot:27 lore:<&f><yaml[server.recipe_book].read[altar.<[item]>.cook_time].as_duration.in_seconds.round_up><&sp>Seconds
    - if <[type]> == alchemy:
      - define inv:<inventory[recipe_book_alchemy]>
      - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
      - define input:<yaml[server.recipe_book].read[alchemy.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - foreach <list[12|16|30|34]> as:in:
        - if <[loop_index]> <= <[input].size>:
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[flags=HIDE_ATTRIBUTES;quantity=<[input].get[<[loop_index]>].split[/].get[2]>]||<item[air]>>
      - inventory sets d:<[inv]> slot:23 o:<item[<[item]>].with[flags=HIDE_ATTRIBUTES;quantity=<yaml[server.recipe_book].read[alchemy.<[item]>.output_quantity]>]>
      - inventory adjust d:<[inv]> slot:41 display_name:<&7>Brewing<&sp><item[<[item]>].script.yaml_key[display<&sp>name].parsed>
      - if <yaml[server.recipe_book].read[alchemy.<[item]>.cook_time].as_duration.in_seconds> >= 60:
        - inventory adjust d:<[inv]> slot:41 lore:<&f><yaml[server.recipe_book].read[alchemy.<[item]>.cook_time].as_duration.in_minutes.round_up><&sp>Minutes
      - else:
        - inventory adjust d:<[inv]> slot:41 lore:<&f><yaml[server.recipe_book].read[alchemy.<[item]>.cook_time].as_duration.in_seconds.round_up><&sp>Seconds
    - if <[type]> == smeltery:
      - define inv:<inventory[recipe_book_smeltery]>
      - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
      - define input:<yaml[server.recipe_book].read[smeltery.<[item]>.input].as_list>
      - inventory open d:<[inv]>
      - inventory set d:<[inv]> slot:16 o:<item[<[item]>].with[quantity=<yaml[server.recipe_book].read[smeltery.<[item]>.output_quantity]>].with[flags=HIDE_ATTRIBUTES]>
      - foreach <list[11|12|20|21|29|30]> as:in:
        - if <[loop_index]> <= <[input].size>
          - inventory set d:<[inv]> slot:<[in]> o:<item[<[input].get[<[loop_index]>].split[/].get[1]>].with[flags=HIDE_ATTRIBUTES;quantity=<[input].get[<[loop_index]>].split[/].get[2]>]||<item[air]>>
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
