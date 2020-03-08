recipe_book_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  procedural items:
  - define type:<player.flag[context].split[/].get[1]||all>
  - define page:<player.flag[context].split[/].get[2]||1>
  - flag <player> context:!
  - foreach <yaml[server.override_recipes].list_keys[]> as:type:
    - define items:|:<yaml[server.override_recipes].list_keys[<[type]>]>
  - define items:<[items].deduplicate.alphabetical>
  - narrate <[items]>
  - repeat 45:
    - define list:|:<item[<[items].get[<[page].mul[44].sub[44]>]>]>
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