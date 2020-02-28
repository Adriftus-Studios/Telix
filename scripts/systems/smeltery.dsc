
smeltery_inventory:
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

smeltery_timer:
  type: item
  material: clock
  display name: <&7>Not Smelting

test_smeltery_recipe:
  type: item
  material: iron_ingot
  display name: <&7>Steel Ingot
  recipes:
    '1':
      cook_time: 10s
      input: coal/5|iron_ingot/2
      recipe_id: test_smeltery_recipe
      output_quantity: 2
      type: smeltery
      experience: 0

smeltery_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_notables[inventories]> as:inventory:
        - if <[inventory].script_name> == SMELTERY_INVENTORY:
          - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
          - if <[inventory].slot[50].script.name> == SMELTERY_TIMER:
            - define clock:<[inventory].slot[50]>
            # get the contents of all input slots
          - foreach <[slotmap]> as:slot:
            - if <[slot].split[/].get[2].starts_with[in]>:
              - define item:<[inventory].slot[<[slot].split[/].get[1]>].script.name||<[inventory].slot[<[slot].split[/].get[1]>].material.name>>
              - if <[contents].map_get[<[item]>]||null> != null:
                - if <[item]||null> != null:
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
          - foreach <yaml[server.smeltery_recipes].list_keys[]> as:recipe:
            - define found:0
            - if <[crafting]> == air:
              - foreach <yaml[server.smeltery_recipes].read[<[recipe]>.input]> as:input:
                - if <[input].split[/].get[2]> <= <[contents].map_get[<[input].split[/].get[1]>]||0>:
                  - define ingredients:|:<[input]>
                  - define found:++
            - if <[found]> == <yaml[server.smeltery_recipes].read[<[recipe]>.input].as_list.size>:
              - define crafting:<[recipe]>
          # find if resulting items can fit in output slots
          - if <[crafting]||null> != null && <[crafting]> != air:
            - define amount_needed:<yaml[server.smeltery_recipes].read[<[crafting]>.output_quantity]>
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
            # countdown smelting timer
            - define time:<[clock].nbt[time].sub[1]||<yaml[server.smeltery_recipes].read[<[crafting]>.cook_time]>>
            - if <[time]> > 0:
              - if <[clock]||null> == null:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time].div[60]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
              - else:
                - define crafting:<[clock].nbt[crafting]>
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time].div[60]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
                - narrate <item[smeltery_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
            - else:
              # craft item and remove required ingredients
              - define amount_needed:<yaml[server.smeltery_recipes].read[<[crafting]>.output_quantity]>
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
              - foreach <yaml[server.smeltery_recipes].read[<[crafting]>.input]> as:input:
                - inventory remove d:<[inventory]> o:<item[<[input].split[/].get[1]>].with[quantity=<[input].split[/].get[2]>]>
              - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer]>
          - else:
            - inventory set d:<[inventory]> slot:50 o:<item[smeltery_timer]>
    on player breaks furnace:
      - if <inventory[smeltery_<context.location.simple>]||null> != null:
        - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
        - foreach <[slotmap]> as:slot:
          - drop <inventory[smeltery_<context.location.simple>].slot[<[slot].split[/].get[1]>]> <context.location>
        - note remove as:smeltery_<context.location.simple>
    on player clicks furnace:
      - if <context.click_type> == RIGHT_CLICK_BLOCK:
        - if !<player.is_sneaking>:
          - if <context.location.up[1].material.name> == cobblestone_wall:
            - if <context.location.down[1].material.name> == lava || <context.location.down[1].material.name> == fire:
              - determine passively cancelled
              - if <inventory[smeltery_<context.location.simple>]||null> == null:
                - note <inventory[smeltery_inventory]> as:smeltery_<context.location.simple>
              - inventory open d:<inventory[smeltery_<context.location.simple>]>
    on player drags in smeltery_inventory:
      - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
      - foreach <context.raw_slots> as:slot:
        - if <[slotmap].map_get[<[raw_slot]>].starts_with[out]>:
          - determine passively cancelled
          - stop
    on player clicks in smeltery_inventory:
      - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
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
              