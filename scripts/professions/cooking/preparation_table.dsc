preparation_table_inventory:
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

preparation_table_timer:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -5
  display name: <&7>Not Preparing

custom_preparation_table:
  type: item
  material: beehive
  display name: <&b>Preparation Table
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_oak_planks|custom_oak_planks|custom_oak_planks
      - custom_iron_bars|custom_crafting_table|custom_iron_bars
      - custom_iron_bars|custom_steel_ingot|custom_iron_bars

custom_food_test_recipe:
  material: cooked_beef
  display name: <&7>Custom food
  weight: '1'
  type: Item
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_beef/1
      side_ingredients: custom_cooked_porkchop/1
      serving_dish: custom_oak_log/1
      cook_time: 5m

preparation_table_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_notables[inventories].filter[script_name.contains_text[preparation_table_inventory]]> as:inventory:
        - if <[inventory].script_name> == preparation_table_inventory:
          #- define slotmap:<list[12/side_in|20/side_in|21/main_in|22/side_in|30/serving_dish|25/out]>
          - define slotmap:<list[12/in|20/in|21/in|22/in|30/in|25/out]>
          - if <[inventory].slot[50].script.name> == preparation_table_timer:
            - define clock:<[inventory].slot[50]>
            # get the contents of all input slots
          #CHECK OVER THIS
          - foreach <[slotmap]> as:slot:
            - if <[slot].split[/].get[2].starts_with[in]>:
              - define item:<[inventory].slot[<[slot].split[/].get[1]>].script.name||<item[air]>>
              - if <[contents].map_get[<[item]>]||null> != null:
                - if <[item]||null> != null && <[item].material.name||air> != air:
                  - define entry:<[item]>/<[contents].map_get[<[item]>].add[<[inventory].slot[<[slot].split[/].get[1]>].quantity>]>
                  - define contents:<[contents].exclude[<[item]>/<[contents].map_get[<[item]>]>]>
                  - define contents:|:<[entry]>
              - else:
                - define contents:|:<[item]>/<[inventory].slot[<[slot].split[/].get[1]>].quantity>
          - define contents:<[contents].exclude[air/0]>
          - if <[contents].is_empty>:
            - foreach next
          # find what items are needed for crafting
          - define crafting:air
          - foreach <yaml[server.cooking_recipes].list_keys[]> as:recipe:
            - define found:0
            - if <[crafting]> == air:
              - foreach <yaml[server.cooking_recipes].read[<[recipe]>.input]> as:input:
                - if <[input].split[/].get[2]> <= <[contents].map_get[<[input].split[/].get[1]>]||0>:
                  - define ingredients:|:<[input]>
                  - define found:++
            - if <[found]> == <yaml[server.cooking_recipes].read[<[recipe]>.input].as_list.size>:
              - define crafting:<[recipe]>
              - foreach stop
          - if <[crafting]||null> == null:
            - foreach next
          # find if resulting items can fit in output slots
          - if <[crafting]||null> != null && <[crafting]> != air:
            - define amount_needed:<yaml[server.cooking_recipes].read[<[crafting]>.output_quantity]>
            - foreach <[slotmap]> as:slot:
              - if <[amount_needed]> > 0:
                - if <[slot].split[/].get[2].starts_with[out]> && <[inventory].slot[<[slot].split[/].get[1]>].quantity> != 64:
                  - if <[inventory].slot[<[slot].split[/].get[1]>].script.name||air> == <[crafting]> || <[inventory].slot[<[slot].split[/].get[1]>].material.name> == air:
                    - define has:<[inventory].slot[<[slot].split[/].get[1]>].quantity>
                    - if <[amount_needed].add[<[has]>]> > 64:
                      - define add:<element[64].sub[<[has]>]>
                      - define remaining:<[amount_needed].sub[<[add]>]>
                    - else:
                      - define remaining:0
                    - define amount_needed:<[remaining]>
            - if <[amount_needed]> != 0:
              - stop
            # countdown preparation timer
            - define time:<[clock].nbt[time].sub[1]||<yaml[server.cooking_recipes].read[<[crafting]>.cook_time]>>
            - if <[time]> > 0:
              - if <[clock]||null> == null:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer].with[display_name=<&7>Preparing<&sp><[crafting].as_script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer].with[display_name=<&7>Preparing<&sp><[crafting].as_script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
              - else:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer].with[display_name=<&7>Preparing<&sp><[crafting].as_script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer].with[display_name=<&7>Preparing<&sp><[crafting].as_script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
            - else:
              #CHECK OVER THIS
              # craft item and remove required ingredients
              - define amount_needed:<yaml[server.cooking_recipes].read[<[crafting]>.output_quantity]>
              - foreach <[slotmap]> as:slot:
                - if <[amount_needed]> > 0:
                  - if <[slot].split[/].get[2].starts_with[out]> && <[inventory].slot[<[slot].split[/].get[1]>].quantity> != 64:
                    - if <[inventory].slot[<[slot].split[/].get[1]>].script.name||air> == <[crafting]> || <[inventory].slot[<[slot].split[/].get[1]>].material.name> == air:
                      - define has:<[inventory].slot[<[slot].split[/].get[1]>].quantity>
                      - if <[amount_needed].add[<[has]>]> > 64:
                        - define add:<element[64].sub[<[has]>]>
                        - define remaining:<[amount_needed].sub[<[add]>]>
                      - else:
                        - define add:<[amount_needed]>
                        - define remaining:0
                      - wait 1t
                      - inventory set d:<[inventory]> slot:<[slot].split[/].get[1]> o:<item[<[crafting]>].with[quantity=<[add].add[<[has]>]>]>
                      - define amount_needed:<[remaining]>
              - foreach <yaml[server.cooking_recipes].read[<[crafting]>.input]> as:input:
                - inventory remove d:<[inventory]> o:<[inventory].slot[<[inventory].find.scriptname[<[input].split[/].get[1]>]>].with[quantity=<[input].split[/].get[2]>]>
              - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer]>
          - else:
            - inventory set d:<[inventory]> slot:50 o:<item[preparation_table_timer]>
    on player places beehive:
      - if <context.item_in_hand.script.name||null> == custom_preparation_table:
        - note <inventory[preparation_table_inventory]> as:preparation_table_<context.location.simple>
    on player breaks beehive:
      - if <inventory[preparation_table_<context.location.simple>]||null> != null:
        - define slotmap:<list[12/in|20/in|21/in|22/in|30/in|25/out]>
        - foreach <[slotmap]> as:slot:
          - drop <inventory[preparation_table_<context.location.simple>].slot[<[slot].split[/].get[1]>]> <context.location>
        - if <player.gamemode> == survival:
          - drop <item[custom_preparation_table]> <context.location>
        - note remove as:preparation_table_<context.location.simple>
        - determine NOTHING
    on player clicks beehive:
      - if <context.click_type> == RIGHT_CLICK_BLOCK:
        - if !<player.is_sneaking>:
          - if <inventory[preparation_table_<context.location.simple>]||null> != null:
            - determine passively cancelled
            - inventory open d:<inventory[preparation_table_<context.location.simple>]>
    on player drags in preparation_table_inventory:
      - define slotmap:<list[12/in|20/in|21/in|22/in|30/in|25/out]>
      - foreach <context.raw_slots> as:slot:
        - if <[slotmap].map_get[<[slot]>].starts_with[out]>:
          - determine passively cancelled
          - stop
    on player clicks in preparation_table_inventory:
      - define slotmap:<list[12/in|20/in|21/in|22/in|30/in|25/out]>
      - if <context.raw_slot> < 55:
        - if <[slotmap].map_get[<context.raw_slot>]||null> == null:
          - determine passively cancelled
          - stop
        - if <[slotmap].map_get[<context.raw_slot>]> == out:
          - if <context.inventory.slot[<context.raw_slot>].material.name> != air:
            - if <player.item_on_cursor.material.name> == air:
              - narrate test
              - run playerLevel_GiveXP def:<yaml[server.cooking_recipes].read[<context.inventory.slot[<context.raw_slot>].script.name>.xp_given]>
      - if !<context.is_shift_click>:
        - if <context.raw_slot> < 55:
          - if <[slotmap].map_get[<context.raw_slot>].starts_with[out]>:
            - if <context.cursor_item.material.name> != air:
              - determine passively cancelled
              - stop
      - else:
        - if <context.raw_slot> > 54:
          - determine passively cancelled
          - define found:false
          - foreach <[slotmap]> as:slot:
            - if !<[found]>:
              - if <context.inventory.slot[<[slot].split[/].get[1]>]> == <item[air]>:
                - if <[slot].split[/].get[2].starts_with[in]>:
                  - inventory adjust slot:<context.slot> quantity:0
                  - inventory set d:<player.open_inventory> o:<context.item> slot:<[slot].split[/].get[1]>
                  - wait 1t
                  - define found:true
              
