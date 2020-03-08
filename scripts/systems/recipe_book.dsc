recipe_book_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  procedural items:
  - define type1:<player.flag[context].split[/].get[1]||all>
  - define page:<player.flag[context].split[/].get[2]||1>
  - flag <player> context:!
  - if <[type1]> == all:
    - foreach <yaml[server.recipe_book].list_keys[]||<list[]>> as:type2:
      - foreach <yaml[server.recipe_book].list_keys[<[type2]>]||<list[]>> as:item:
        - define items:|:<[item]>/<[type2]>
  - else:
    - if <[type1]> == crafting:
      - foreach <yaml[server.recipe_book].list_keys[]||<list[]>> as:type2:
        - foreach <yaml[server.recipe_book].list_keys[<[type2]>]||<list[]>> as:item:
          - define items:|:<[item]>/<[type2]>
    - if <[type1]> == mob_drops:
      - narrate "Not done."
      - inventory close
    - if <[type1]> == ore_drops:
      - narrate "Not done."
      - inventory close
  - define items:<[items].deduplicate.alphabetical>
  - repeat 45:
    - define list:|:<item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item.with[nbt=type/<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[2]>;lore=<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[2]>]||<item[air]>>
  - define list:|:<item[gui_close_btn].with[nbt=page/<[page]>|type/<[type1]>]>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[w_filler] [w_filler] [w_filler] [previous_page_button] [] [next_page_button] [crafting_icon] [w_filler] [w_filler]"

recipe_book_smeltery:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Smeltery<&r> <&6>◆
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

recipe_book_events:
  type: world
  events:
    on player clicks in recipe_book_*:
      - determine passively cancelled
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
            - define item:<context.item.script.name>
            - define type:<context.item.nbt[type]>
            - narrate <[item]>
            - narrate <[type]>
            - foreach <yaml[server.recipe_book].list_keys[<[type]>.<[item]>]> as:key:
              - narrate <yaml[server.recipe_book].read[<[type]>.<[item]>.<[key]>]>
    on player closes recipe_book_*:
      - flag <player> context:!
      
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
