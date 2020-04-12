
alchemy_station_inventory:
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

alchemy_station_timer:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -5
  display name: <&7>Not Brewing

custom_alchemy_station:
  type: item
  material: brewing_stand
  display name: <&b>Alchemy Station
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_magma_cream|air
      - custom_blaze_rod|custom_brewing_stand|custom_blaze_rod
      - custom_iron_ingot|custom_iron_block|custom_iron_ingot

alchemy_station_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_notables[inventories].filter[script_name.contains_text[alchemy_station_inventory]]> as:inventory:
        - if <[inventory].script_name> == alchemy_station_inventory:
          - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
          - if <[inventory].slot[41].script.name> == alchemy_station_timer:
            - define clock:<[inventory].slot[41]>
            # get the contents of all input slots
          - if <[inventory].slot[12|16|23|30|34].deduplicate.exclude[<item[air]>].size> == 0:
            - note remove as:<[inventory].notable_name>
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
          - foreach <yaml[server.alchemy_recipes].list_keys[]> as:recipe:
            - define found:0
            - if <[crafting]> == air:
              - foreach <yaml[server.alchemy_recipes].read[<[recipe]>.input]> as:input:
                - if <[input].split[/].get[2]> <= <[contents].map_get[<[input].split[/].get[1]>]||0>:
                  - define ingredients:|:<[input]>
                  - define found:++
            - if <[found]> == <yaml[server.alchemy_recipes].read[<[recipe]>.input].as_list.size>:
              - define crafting:<[recipe]>
              - foreach stop
          - if <[crafting]||null> == null:
            - stop
          # find if resulting items can fit in output slots
          - if <[crafting]||null> != null && <[crafting]> != air:
            - define amount_needed:<yaml[server.alchemy_recipes].read[<[crafting]>.output_quantity]>
            - foreach <[slotmap]> as:slot:
              - if <[amount_needed]> > 0:
                - if <[slot].split[/].get[2].starts_with[out]> && <[inventory].slot[<[slot].split[/].get[1]>].quantity> != 64:
                  - if <[inventory].slot[<[slot].split[/].get[1]>].script.name||air> == <[crafting]> || <[inventory].slot[<[slot].split[/].get[1]>].material.name> == air:
                    - define has:<[inventory].slot[<[slot].split[/].get[1]>].quantity>
                    - if <[amount_needed].add[<[has]>]> > 64:
                      - define add:<el@64.sub[<[has]>]>
                      - define remaining:<[amount_needed].sub[<[add]>]>
                    - else:
                      - define remaining:0
                    - define amount_needed:<[remaining]>
            - if <[amount_needed]> != 0:
              - stop
            # countdown brewing timer
            - define time:<[clock].nbt[time].sub[1]||<yaml[server.alchemy_recipes].read[<[crafting]>.cook_time]>>
            - if <[time]> > 0:
              - if <[clock]||null> == null:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer].with[display_name=<&7>Brewing<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer].with[display_name=<&7>Brewing<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
              - else:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer].with[display_name=<&7>Brewing<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer].with[display_name=<&7>Brewing<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
            - else:
              # craft item and remove required ingredients
              - define amount_needed:<yaml[server.alchemy_recipes].read[<[crafting]>.output_quantity]>
              - foreach <[slotmap]> as:slot:
                - if <[amount_needed]> > 0:
                  - if <[slot].split[/].get[2].starts_with[out]> && <[inventory].slot[<[slot].split[/].get[1]>].quantity> != 64:
                    - if <[inventory].slot[<[slot].split[/].get[1]>].script.name||air> == <[crafting]> || <[inventory].slot[<[slot].split[/].get[1]>].material.name> == air:
                      - define has:<[inventory].slot[<[slot].split[/].get[1]>].quantity>
                      - if <[amount_needed].add[<[has]>]> > 64:
                        - define add:<el@64.sub[<[has]>]>
                        - define remaining:<[amount_needed].sub[<[add]>]>
                      - else:
                        - define add:<[amount_needed]>
                        - define remaining:0
                      - wait 1t
                      - inventory set d:<[inventory]> slot:<[slot].split[/].get[1]> o:<item[<[crafting]>].with[quantity=<[add].add[<[has]>]>]>
                      - define amount_needed:<[remaining]>
              - foreach <yaml[server.alchemy_recipes].read[<[crafting]>.input]> as:input:
                - inventory remove d:<[inventory]> o:<[inventory].slot[<[inventory].find.scriptname[<[input].split[/].get[1]>]>].with[quantity=<[input].split[/].get[2]>]>
              - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer]>
          - else:
            - inventory set d:<[inventory]> slot:41 o:<item[alchemy_station_timer]>
    on player places brewing_stand:
      - if <context.item_in_hand.script.name||null> == custom_alchemy_station:
        - note <inventory[alchemy_station_inventory]> as:alchemy_station_<context.location.simple>
    on player breaks brewing_stand:
      - if <inventory[alchemy_station_<context.location.simple>]||null> != null:
        - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
        - foreach <[slotmap]> as:slot:
          - drop <inventory[alchemy_station_<context.location.simple>].slot[<[slot].split[/].get[1]>]> <context.location>
        - if <player.gamemode> == survival:
          - drop <item[custom_alchemy_station]> <context.location>
        - note remove as:alchemy_station_<context.location.simple>
        - determine NOTHING
    on entity explodes:
      - foreach <context.blocks> as:block:
        - if <inventory[alchemy_station_<[block].simple>]||null> != null:
          - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
          - foreach <[slotmap]> as:slot:
            - drop <inventory[alchemy_station_<[block].simple>].slot[<[slot].split[/].get[1]>]> <[block].simple>
          - if <player.gamemode> == survival:
            - drop <item[custom_alchemy_station]> <[block].simple>
          - note remove as:alchemy_station_<[block].simple>
          - define list:|:<[block]>
      - foreach <[list]||<list[]>> as:loc:
        - modifyblock <[loc]> air
        - drop <item[custom_alchemy_station]> <[loc]>
      - determine <context.blocks.exclude[<[list]||<list[]>>]>
    on player clicks brewing_stand:
      - if <context.click_type> == RIGHT_CLICK_BLOCK:
        - if !<player.is_sneaking>:
          - if <inventory[alchemy_station_<context.location.simple>]||null> != null:
            - determine passively cancelled
            - inventory open d:<inventory[alchemy_station_<context.location.simple>]>
    on player drags in alchemy_station_inventory:
      - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
      - foreach <context.raw_slots> as:slot:
        - if <[slotmap].map_get[<[slot]>].starts_with[out]>:
          - determine passively cancelled
          - stop
    on player clicks in alchemy_station_inventory:
      - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
      - if <context.raw_slot> < 46:
        - if <[slotmap].map_get[<context.raw_slot>]||null> == null:
          - determine passively cancelled
          - stop
      - if !<context.is_shift_click>:
        - if <context.raw_slot> < 46:
          - if <[slotmap].map_get[<context.raw_slot>].starts_with[out]>:
            - if <context.cursor_item.material.name> != air:
              - determine passively cancelled
              - stop
      - else:
        - if <context.raw_slot> > 45:
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
              