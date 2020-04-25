
furnace_inventory:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Furnace<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
    gui_top: <item[gui_furnace_top]>
    gui_bottom: <item[gui_furnace_bottom]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [furnace_timer] [w_filler] [w_filler] [w_filler] [w_filler]"

furnace_timer:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -5
  display name: <&7>Not Smelting

custom_furnace:
  custom_recipes:
    '0':
      input:
      - custom_cobblestone|custom_cobblestone|custom_cobblestone
      - custom_cobblestone|air|custom_cobblestone
      - custom_cobblestone|custom_cobblestone|custom_cobblestone
      output_quantity: 1
      type: shaped
  material: furnace
  display name: <&7>Furnace
  weight: '1'
  type: item

furnace_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_notables[locations].filter[notable_name.starts_with[active_furnace_]]> as:active_location:
        - define inventory:<inventory[furnace_<[active_location].simple>]>
        - if <[inventory]> == null:
          - note remove as:<[active_location].notable_name>
          - foreach next
        - if <[inventory].script_name> == furnace_INVENTORY:
          - define slotmap:<list[12/in|25/out|30/fuel]>
          - if <[inventory].slot[50].script.name> == furnace_TIMER:
            - define clock:<[inventory].slot[50]>
          - define contents:<[inventory].slot[12]||null>
          - if <[contents]> == null:
            - note remove as:<[active_location].notable_name>
            - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer]>
            - foreach next
          # find what items are needed for crafting
          - define crafting:air
          - foreach <yaml[server.furnace_recipes].list_keys[]> as:recipe:
            - if <[crafting]> == air:
              - if <[contents].script.name||<[contents].material.name>> == <yaml[server.furnace_recipes].read[<[recipe]>.input]>:
                - define crafting:<[recipe]>
                - foreach stop
          - if <[crafting]||air> == air:
            - note remove as:<[active_location].notable_name>
            - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer]>
            - foreach next
          # find if resulting items can fit in output slots
          - if <[crafting]||null> != null && <[crafting]> != air:
            - define amount_needed:<yaml[server.furnace_recipes].read[<[crafting]>.output_quantity]>
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
              - note remove as:<[active_location].notable_name>
              - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer]>
              - foreach next
            # countdown smelting timer
            - define time:<[clock].nbt[time].sub[1]||<yaml[server.furnace_recipes].read[<[crafting]>.cook_time]>>
            - if <[time].ends_with[s]>:
              - define time:<[time].replace[s].with[]>
            - if <[time].ends_with[m]>:
              - define time:<[time].replace[m].with[].mul[60]>
            - if <[time]> > 0:
              - if <[clock]||null> == null:
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
              - else:
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
            - else:
              # craft item and remove required ingredients
              - define amount_needed:<yaml[server.furnace_recipes].read[<[crafting]>.output_quantity]>
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
              - foreach <yaml[server.furnace_recipes].read[<[crafting]>.input].as_list> as:input:
                - announce <[input]>
                - inventory remove d:<[inventory]> o:<[inventory].slot[<[inventory].find.scriptname[<[input].split[/].get[1]||<[input]>>]>].with[quantity=<[input].split[/].get[2]||1>]||<[inventory].slot[<[inventory].find.material[<[input].split[/].get[1]||<[input]>>]>].with[quantity=<[input].split[/].get[2]||1>]>>
              - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer]>
          - else:
            - inventory set d:<[inventory]> slot:50 o:<item[furnace_timer]>
    on player places furnace:
      - if <context.item_in_hand.script.name||null> == custom_furnace:
        - note <inventory[furnace_inventory]> as:furnace_<context.location.simple>
    on player breaks furnace:
      - if <inventory[furnace_<context.location.simple>]||null> != null:
        - define slotmap:<list[12/in|25/out|30/fuel]>
        - foreach <[slotmap]> as:slot:
          - drop <inventory[furnace_<context.location.simple>].slot[<[slot].split[/].get[1]>]> <context.location>
        - if <player.gamemode> == survival:
          - drop <item[custom_furnace]> <context.location>
        - note remove as:furnace_<context.location.simple>
        - determine NOTHING
    on entity explodes:
      - foreach <context.blocks> as:block:
        - if <inventory[furnace_<[block].simple>]||null> != null:
          - define slotmap:<list[12/in|25/out|30/fuel]>
          - foreach <[slotmap]> as:slot:
            - drop <inventory[furnace_<[block].simple>].slot[<[slot].split[/].get[1]>]> <[block].simple>
          - if <player.gamemode> == survival:
            - drop <item[custom_furnace]> <[block].simple>
          - note remove as:furnace_<[block].simple>
          - define list:|:<[block]>
      - foreach <[list]||<list[]>> as:loc:
        - modifyblock <[loc]> air
        - drop <item[custom_furnace]> <[loc]>
      - determine <context.blocks.exclude[<[list]||<list[]>>]>
    on player clicks furnace:
      - if <context.click_type> == RIGHT_CLICK_BLOCK && !<player.is_sneaking>:
        - if <inventory[furnace_<context.location.simple>]||null> == null:
          - note <inventory[furnace_inventory]> as:furnace_<context.location.simple>
        - note <context.location> as:active_furnace_<context.location.simple>
        - determine passively cancelled
        - inventory open d:<inventory[furnace_<context.location.simple>]>
    on player drags in furnace_inventory:
      - define slotmap:<list[12/in|25/out|30/fuel]>
      - foreach <context.raw_slots> as:slot:
        - if <[slotmap].map_get[<[slot]>].starts_with[out]||false>:
          - determine cancelled
    on player clicks in furnace_inventory:
      - note <context.inventory.notable_name.replace[furnace_].with[].as_location> as:active_furnace_<context.inventory.notable_name.replace[furnace_].with[].as_location.simple>
      - define slotmap:<list[12/in|25/out|30/fuel]>
      - if <context.raw_slot> < 55:
        - if <[slotmap].map_get[<context.raw_slot>]||null> == null:
          - determine passively cancelled
          - stop
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
              
