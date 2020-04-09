
altar_inventory:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Altar<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_altar_top]>
    gui_bottom: <item[gui_altar_bottom]>
  slots:
  - "[w_filler] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_top] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [altar_timer]"
  - "[gui_bottom] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [] [w_filler] [] [w_filler] [] [w_filler] [w_filler]"

altar_timer:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -5
  display name: <&7>Not Imbuing

altar_entity:
  type: entity
  entity_type: armor_stand
  gravity: false
  visible: false
  invulnerable: false
  custom:
    interactable: false

altar_tier_1:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1
  display name: <&b>Altar I

altar_tier_2:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1
  display name: <&b>Altar II

altar_tier_3:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1
  display name: <&b>Altar III

altar_tier_4:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1
  display name: <&b>Altar IV

altar_tier_5:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1
  display name: <&b>Altar V

altar_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_notables[inventories].filter[script_name.contains_text[altar_inventory]]> as:inventory:
        - if <[inventory].script_name> == altar_inventory:
          - define slotmap:<list[3/in|5/in|7/in|21/in|25/in|39/in|41/in|43/in|23/out]>
          - if <[inventory].slot[27].script.name> == altar_timer:
            - define clock:<[inventory].slot[27]>
          - define tier:<[inventory].slot[1].nbt[tier]||0>
          - if <[tier]> == 0:
            - foreach next
          - if <[inventory].slot[3|5|7|21|23|25|39|41|43].deduplicate.exclude[<item[air]>].size> == 0:
            - note remove  as:<[inventory]>
            # get the contents of all input slots
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
          - foreach <yaml[server.altar_recipes].list_keys[]> as:recipe:
            - define found:0
            - if <[crafting]> == air:
              - foreach <yaml[server.altar_recipes].read[<[recipe]>.input]> as:input:
                - if <[input].split[/].get[2]> <= <[contents].map_get[<[input].split[/].get[1]>]||0>:
                  - define ingredients:|:<[input]>
                  - define found:++
            - if <[found]> == <yaml[server.altar_recipes].read[<[recipe]>.input].as_list.size> && <yaml[server.altar_recipes].read[<[recipe]>.tier]> <= <[tier]>:
              - define crafting:<[recipe]>
              - foreach stop
          - if <[crafting]||null> == null:
            - foreach next
          # find if resulting items can fit in output slots
          - if <[crafting]||null> != null && <[crafting]> != air:
            - define amount_needed:<yaml[server.altar_recipes].read[<[crafting]>.output_quantity]>
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
              - foreach next
            # countdown brewing timer
            - define time:<[clock].nbt[time].sub[1]||<yaml[server.altar_recipes].read[<[crafting]>.cook_time]>>
            - if <[time]> > 0:
              - if <[clock]||null> == null:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:27 o:<item[altar_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:27 o:<item[altar_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
              - else:
                - if <[time].ends_with[s]>:
                  - define time:<[time].replace[s].with[]>
                - if <[time].ends_with[m]>:
                  - define time:<[time].replace[m].with[].mul[60]>
                - if <[time]> > 60:
                  - inventory set d:<[inventory]> slot:27 o:<item[altar_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time].div[60].round_up>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].div[60].round_up><&sp>Minutes]>
                - else:
                  - inventory set d:<[inventory]> slot:27 o:<item[altar_timer].with[display_name=<&7>Cooking<&sp><item[<[crafting]>].script.yaml_key[display<&sp>name].parsed>;quantity=<[time]>;nbt=time/<[time]>;nbt=crafting/<[crafting]>;lore=<&f><[time].round_up><&sp>Seconds]>
            - else:
              # craft item and remove required ingredients
              - define amount_needed:<yaml[server.altar_recipes].read[<[crafting]>.output_quantity]>
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
              - foreach <yaml[server.altar_recipes].read[<[crafting]>.input]> as:input:
                - inventory remove d:<[inventory]> o:<[inventory].slot[<[inventory].find.scriptname[<[input].split[/].get[1]>]>].with[quantity=<[input].split[/].get[2]>]||<[inventory].slot[<[inventory].find.material[<[input].split[/].get[1]>]>].with[quantity=<[input].split[/].get[2]>]>>
              - inventory set d:<[inventory]> slot:27 o:<item[altar_timer]>
          - else:
            - inventory set d:<[inventory]> slot:27 o:<item[altar_timer]>
    on player places sponge:
      - if <context.item_in_hand.script.name.starts_with[altar_tier_]>:
        - note <context.location> as:altar_<context.location.simple>_<context.item_in_hand.script.name.replace[altar_tier_].with[]>
        - spawn altar_entity <context.location.below[1].with_yaw[<player.location.yaw.add[180]>]> save:altar
        - define altar:<entry[altar].spawned_entity>
        - adjust <[altar]> equipment:<item[air]>|<item[air]>|<item[air]>|<context.item_in_hand>
    on player breaks barrier:
      - if <context.location.notable_name.starts_with[altar_]>:
        - define tier:<context.location.notable_name.split[_].get[<context.location.notable_name.split[_].size>]>
        - note remove as:<context.location.notable_name>
        - determine NOTHING
        - if <player.gamemode> == SURVIVAL:
          - drop <item[altar_<[tier]>]> <context.location>
    on player clicks barrier:
      - if <context.location.notable_name.starts_with[altar_]>:
        - define loc:<context.location.notable_name.split[_].get[2]>
        - define tier:<context.location.notable_name.split[_].get[<context.location.notable_name.split[_].size>]>
        - if !<server.list_notables[inventories].contains[altar_<player.uuid>_<[tier]>]>:
          - note <inventory[altar_inventory]> as:altar_<player.uuid>_<[tier]>
        - inventory set d:<inventory[altar_<player.uuid>_<[tier]>]> slot:1 o:<item[altar_tier_<[tier]>].with[nbt=tier/<[tier]>]>
        - inventory open d:<inventory[altar_<player.uuid>_<[tier]>]>
    on player drags in altar_inventory:
      - define slotmap:<list[3/in|5/in|7/in|21/in|25/in|39/in|41/in|43/in|23/out]>
      - foreach <context.raw_slots> as:slot:
        - if <[slotmap].map_get[<[slot]>].starts_with[out]>:
          - determine passively cancelled
          - stop
    on player clicks in altar_inventory:
      - define slotmap:<list[3/in|5/in|7/in|21/in|25/in|39/in|41/in|43/in|23/out]>
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
              