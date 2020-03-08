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
    - foreach <yaml[server.override_recipes].list_keys[]> as:type2:
      - foreach <yaml[server.override_recipes].list_keys[<[type2]>]> as:item:
        - define items:|:<[item]>/<[type2]>
  - else:
    - foreach <yaml[server.override_recipes].list_keys[<[type2]>]> as:item:
      - define items:|:<[item]>/<[type2]>
  - define items:<[items].deduplicate.alphabetical>
  - narrate <[items].size>
  - repeat 45:
    - define list:|:<item[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[1]>].as_item.with[nbt=type/<[<[items].get[<[value].add[<[page].mul[44].sub[44]>]>].split[/].get[2]>]>]>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [smeltery_icon] [crafting_icon] [closeitem] [furnace_icon] [alchemy_icon] [altar_icon] []"

recipe_book_events:
  type: world
  events:
    on player opens recipe_book_inventory:
      - narrate <context.inventory>
    on player clicks in recipe_book_inventory:
      - determine passively cancelled
      - narrate <context.raw_slot>
    on player drops item:
      - narrate <player.open_inventory>
      
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
