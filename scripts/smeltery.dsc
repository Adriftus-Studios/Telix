
smeltery_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Smeltery<&r> <&6>◆
  size: 54
  procedural items:
    - narrate <player.flag[context]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

smeltery_events:
  type: world
  events:
    on player breaks furnace:
      - if <inventory[smeltery_<context.location.simple>]||null> != null:
        - define slotmap:<list[11/in1|12/in2|14/fuel1|16/out1|17/out2|20/in3|21/in4|23/fuel2|25/out3|26/out4|29/in5|30/in6|32/fuel3|34/out5|35/out6]>
        - narrate 1
        - note remove as:smeltery_<context.location.simple>
    on player opens inventory:
    on player clicks furnace:
      - if <context.click_type> == RIGHT_CLICK_BLOCK:
        - if <context.location.material.name> == furnace:
          - if <context.location.up[1].material.name> == cobblestone_wall:
            - if <context.location.down[1].material.name> == lava || <context.location.down[1].material.name> == fire:
              - determine passively cancelled
              - if <inventory[smeltery_<context.location.simple>]||null> != null:
                - inventory open d:<inventory[smeltery_<context.location.simple>]>
                - flag <player> context:smeltery_<context.location.simple>
              - else:
                - note <inventory[smeltery_inventory]> as:smeltery_<context.location.simple>
                - inventory open d:<inventory[smeltery_<context.location.simple>]>
                - flag <player> context:smeltery_<context.location.simple>
    on player drags in smeltery_inventory:
      - foreach <context.raw_slots> as:slot:
        - if <[slot]> < 55:
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
              