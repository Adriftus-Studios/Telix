
alchemy_station_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Smeltery<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_alchemy_station_top]>
    gui_bottom: <item[gui_alchemy_station_bottom]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [alchemy_station_timer] [w_filler] [w_filler] [w_filler] [w_filler]"

alchemy_station_timer:
  type: item
  material: clock
  display name: <&7>Not Brewing

alchemy_station:
  type: item
  material: brewing_station
  display name: <&b>Alchemy Station
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_magma_cream|air
      - custom_blaze_rod|custom_brewing_station|custom_blaze_rod
      - custom_iron_ingot|custom_iron_block|custom_iron_ingot

alchemy_station_events:
  type: world
  debug: false
  events:
    on player places brewing_stand:
      - if <context.item_in_hand.script.name||null> == alchemy_station:
        - inventory open d:<inventory[alchemy_station_<context.location.simple>]>
    on player breaks brewing_stand:
      - if <inventory[alchemy_station_<context.location.simple>]||null> != null:
        - define slotmap:<list[12/in|16/in|30/in|34/in|23/out]>
        - foreach <[slotmap]> as:slot:
          - drop <inventory[alchemy_station_<context.location.simple>].slot[<[slot].split[/].get[1]>]> <context.location>
        - drop <item[alchemy_station]> <context.location>
        - note remove as:smeltery_<context.location.simple>
        - determine NOTHING
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
      - narrate <context.raw_slot>
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
              