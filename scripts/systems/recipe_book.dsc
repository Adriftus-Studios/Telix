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
  - foreach <yaml[server.override_recipes].list_keys[]> as:type2:
    - if <[type1]> == all || <[type1]> == <[type2]>:
      - foreach <yaml[server.override_recipes].list_keys[<[type]>]> as:item:
        - define items:|:<[item]>/<[type]>
  - define items:<[items].deduplicate.alphabetical>
  - repeat 45:
    - narrate <item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item>
    - define list:|:<item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item.with[nbt=type/<[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[2]>]>]>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[w_filler] [w_filler] [w_filler] [previous_page_button] [closeitem] [next_page_button] [w_filler] [w_filler] [w_filler]"

recipe_book_events:
  type: world
  events:
    on player opens recipe_book_inventory:
      - narrate <context.inventory>
    on player clicks in recipe_book_inventory:
      - narrate <context.raw_slot>
      - narrate <context.item.nbt[type]>