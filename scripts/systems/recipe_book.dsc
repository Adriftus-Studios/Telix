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
    - foreach <yaml[server.override_recipes].list_keys[]||<list[]>> as:type2:
      - foreach <yaml[server.override_recipes].list_keys[<[type2]>]||<list[]>> as:item:
        - define items:|:<[item]>/<[type2]>
  - else:
    - if <[type1]> == crafting:
      - foreach <yaml[server.override_recipes].list_keys[shapeless]||<list[]>> as:item:
        - define items:|:<[item]>/crafting
      - foreach <yaml[server.override_recipes].list_keys[shaped]||<list[]>> as:item:
        - define items:|:<[item]>/crafting
    - else:
      - foreach <yaml[server.override_recipes].list_keys[<[type1]>]||<list[]>> as:item:
        - define items:|:<[item]>/<[type1]>
  - define items:<[items].deduplicate.alphabetical>
  - narrate <[items].size>
  - repeat 45:
    - define list:|:<item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item.with[nbt=type/<[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[2]>]>]>
  - define list:|:<item[gui_close_btn].with[nbt=page/<[page]>|type/<[type1]>]>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[furnace_icon] [blast_furnace_icon] [smeltery_icon] [previous_page_button] [] [next_page_button] [alchemy_icon] [altar_icon] [crafting_icon]"

recipe_book_events:
  type: world
  events:
    on player opens recipe_book_inventory:
      - narrate <context.inventory>
    on player clicks in recipe_book_inventory:
      - narrate <context.raw_slot>
      - if <context.raw_slot> < 55:
        - determine passively cancelled
        - narrate <player.open_inventory.slot[50]>
        - narrate <player.open_inventory.slot[50].nbt[page]>
        - narrate <player.open_inventory.slot[50].nbt[type]>
        - define page:<player.open_inventory.slot[50].nbt[page]>
        - define type:<player.open_inventory.slot[50].nbt[type]>
        - if <context.item.script.name> == next_page_button:
          - flag <player> context:<[type]>/<[page].add[1]>
        - if <context.item.script.name> == previous_page_button:
          - flag <player> context:<[type]>/<[page].sub[1]>
        - if <context.item.script.name> == altar_icon:
          - flag <player> context:altar/1
        - if <context.item.script.name> == smeltery_icon:
          - flag <player> context:smeltery/1
        - if <context.item.script.name> == alchemy_icon:
          - flag <player> context:alchemy/1
        - if <context.item.script.name> == crafting_icon:
          - flag <player> context:crafting/1
        - if <context.item.script.name> == furnace_icon:
          - flag <player> context:furnace/1
        - if <context.item.script.name> == blast_furnace_icon:
          - flag <player> context:blast_furnace/1
    on player closes recipe_book_inventory:
      - flag <player> context:!
      
altar_icon:
  type: item
  material: beacon
  display name: <&6>Altar Recipes

smeltery_icon:
  type: item
  material: blast_furnace
  display name: <&6>Smeltery Recipes

alchemy_icon:
  type: item
  material: brewing_stand
  display name: <&6>Alchemy Station Recipes

crafting_icon:
  type: item
  material: crafting_table
  display name: <&6>Crafting Recipes

furnace_icon:
  type: item
  material: furnace
  display name: <&6>Furnace Recipes

blast_furnace_icon:
  type: item
  material: blast_furnace
  display name: <&6>Blast Furnace Recipes
