
view_equipment_command:
  type: command
  name: view_equipment
  description: view_equipment
  usage: /view_equipment
  permission: view_equipment
  tab complete:
  - if <player.permission[*]>:
    - foreach <server.list_material_types> as:mat:
      - if <[mat].name.starts_with[<context.args.get[1]>]>:
        - define list:|:<[mat].name>
    - determine <[list]>
  script:
  - if <player.permission[*]>:
    - flag <player> context:<context.args.get[1]>/<context.args.get[2]>
    - inventory open d:view_equipment

view_equipment:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Stuff<&r> <&6>◆
  size: 54
  procedural items:
  - define mat:<material[<player.flag[context].split[/].get[1]>]||air>
  - define page:<player.flag[context].split[/].get[2]>
  - flag <player> context:!
  - repeat 63:
    - define list:|:<item[<[mat]>].with[custom_model_data=<[value].add[<[page].mul[53].sub[53]>]>].with[lore=<[value].add[<[page].mul[53].sub[53]>]>]||<item[air]>>
  - determine <[list]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"

equipment_death_handler:
  type: world
  debug: false
  events:
    on player death:
      - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
      - define inv:<inventory[equipment_<player.uuid>]>
      - define drops:<context.drops||<list[]>>
      - foreach <[slotmap]>:
        - define item:<[inv].slot[<[value].split[/].get[1]>]>
        - if !<[item].script.name.ends_with[_shadow]||false>:
          - define drops:|:<[item]>
          - inventory set d:<[inv]> slot:<[value].split[/].get[1]> o:<item[<[value].split[/].get[2]>_shadow]||<item[air]>>
      - determine <[drops]>
      - inject update_stats

hat_shadow:
  type: item
  material: diamond_pickaxe
  category: hat
  weight: 0
  mechanisms:
    custom_model_data: -1
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Hat Equipped"

shirt_shadow:
  type: item
  material: diamond_pickaxe
  category: shirt
  weight: 0
  mechanisms:
    custom_model_data: -2
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Shirt Equipped"

pants_shadow:
  type: item
  material: diamond_pickaxe
  category: pants
  weight: 0
  mechanisms:
    custom_model_data: -3
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Pants Equipped"

shoes_shadow:
  type: item
  material: diamond_pickaxe
  category: shoes
  weight: 0
  mechanisms:
    custom_model_data: -4
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Shoes Equipped"

cape_shadow:
  type: item
  material: diamond_pickaxe
  category: cape
  weight: 0
  mechanisms:
    custom_model_data: -5
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Cape Equipped"

gloves_shadow:
  type: item
  material: diamond_pickaxe
  category: gloves
  weight: 0
  mechanisms:
    custom_model_data: -6
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE
  display name: "No Gloves Equipped"

equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  - foreach <list[necklace|earrings|hat|ring1|ring2|gloves|shirt|cape|trinket1|trinket2|pants|shoes]>:
    - if <yaml[player.<player.uuid>].read[equipment.<[value]>].material.name||<item[air].material.name>> != air:
      - define items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||<item[<[value]>_shadow]||<item[air]>>>
    - else:
      - define items:|:<item[<[value]>_shadow]||<item[air]>>
  #- determine <[items]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_equipment_top]>
    gui_bottom: <item[gui_equipment_bottom]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [] [] [w_filler] [w_filler] [] [] [] [w_filler]"
  - "[gui_top] [] [] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[gui_bottom] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

equipment_inventory_handler:
  type: world
  debug: false
  events:
    on player drags item in equipment_character:
      - if <player.open_inventory.script_name> == "equipment_character":
        - foreach <context.raw_slots> as:slot:
          - if <[slot]> < 55:
            - determine passively cancelled
    on player opens equipment_character:
      - wait 1t
      - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
      - foreach <list[hat|gloves|shirt|shoes|pants|cape]>:
        - if <player.open_inventory.slot[<[slotmap].map_find_key[<[value]>]>].material.name> = air:
          - inventory set d:<player.open_inventory> slot:<[slotmap].map_find_key[<[value]>]> o:<item[<[value]>_shadow]>
    on player item takes damage:
      - if <context.slot> == 38:
        - determine 0
        - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
        - foreach <[slotmap]>:
          - define item:<inventory[equipment_<player.uuid>].slot[<[value].split[/].get[1]>]||<item[air]>>
          - define slot:<[value].split[/].get[1]>
          - if <[item].script.yaml_key[fake_durability]||null> == null:
            - foreach next
          - define amount:-1
          - inject fake_durability_modify
          - if !<[item].enchantments.contains_any[DURABILITY]>:
            - inventory set slot:<[slot]> d:<inventory[equipment_<player.uuid>]> o:<[new_item]>
          - else:
            - if <util.random.int[0].to[100]> < <util.random.int[100].to[100]./[<[item].enchantments.level[DURABILITY].+[1]>]>:
              - inventory set slot:<[slot]> d:<inventory[equipment_<player.uuid>]> o:<[new_item]>
        - run update_stats def:<player>
    on player clicks item in equipment_character with item:
      - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
      - if <player.open_inventory.notable_name||null> == null:
        - inventory close
      - if <context.item.script.name.ends_with[_shadow]||false>:
        - if <context.cursor_item.script.name||null> == null:
          - determine passively cancelled
          - stop
      - if !<context.is_shift_click>:
        - if <context.raw_slot> < 55:
          - if !<[slotmap].parse[split[/].get[1]].contains[<context.raw_slot>]>:
            - determine passively cancelled
            - stop
          - if <context.cursor_item.material.name||air> != air:
            - if <context.cursor_item.nbt[built]||null> == null:
              - determine passively cancelled
              - stop
            - if <context.cursor_item.script.yaml_key[category]||null> == null:
              - determine passively cancelled
              - stop
          - if <context.cursor_item.material.name> == air:
            - if <context.item.script.name||null> != null:
              - if <context.item.script.name.ends_with[_shadow]>:
                - determine passively cancelled
                - stop
              - else:
                - determine passively cancelled
                - wait 1t
                - inventory set d:<player.open_inventory> slot:<context.raw_slot> o:<item[<[slotmap].map_get[<context.raw_slot>]>_shadow]||<item[air]>>
                - adjust <player> item_on_cursor:<context.item>
          - if <context.cursor_item.script.yaml_key[category]||null> != null:
            - if <context.item.script.name||null> != null:
              - if <[slotmap].map_get[<context.raw_slot>].contains_text[<context.cursor_item.script.yaml_key[category]>]>:
                - if <context.item.script.name.ends_with[_shadow]>:
                  - determine passively cancelled
                  - if <context.cursor_item.quantity> > 1:
                    - stop
                  - wait 1t
                  - define item:<player.item_on_cursor>
                  - if !<[item].has_nbt[built]>:
                    - inject built_item
                  - inventory set d:<player.open_inventory> slot:<context.raw_slot> o:<[item].with[quantity=1]>
                  - adjust <player> item_on_cursor:<item[air]>
                - else:
                  - if <context.cursor_item.quantity> > 1:
                    - determine passively cancelled
                    - stop
                  - else:
                    - define item:<context.cursor_item>
                    - define item2:<context.item>
                    - determine passively cancelled
                    - wait 1t
                    - adjust <player> item_on_cursor:<[item2]>
                    - if !<[item].has_nbt[built]>:
                      - inject built_item
                    - inventory set d:<player.open_inventory> slot:<context.raw_slot> o:<[item]>
              - else:
                - determine passively cancelled
                - stop
            - else:
              - determine passively cancelled
              - stop
      - else:
        - if <context.raw_slot> > 54:
          - if <context.item.nbt[built]||null> == null:
            - determine passively cancelled
            - stop
          - if <context.item.script.yaml_key[category]||null> == null:
            - determine passively cancelled
            - stop
          - determine passively cancelled
          - define found:false
          - if <context.item.script.yaml_key[category]||null> == null:
            - stop
          - foreach <[slotmap]> as:slot:
            - if !<[found]>:
              - if <[slot].contains[/<context.item.script.yaml_key[category]>]>:
                - if <context.inventory.slot[<[slot].split[/].get[1]>]> == <item[air]> || <context.inventory.slot[<[slot].split[/].get[1]>].script.name.ends_with[_shadow]>:
                  - wait 1t
                  - inventory adjust slot:<context.slot> quantity:<player.inventory.slot[<context.slot>].quantity.-[1]>
                  - define item:<context.item>
                  - inject build_item
                  - inventory set d:<player.open_inventory> o:<[item].with[quantity=1]> slot:<[slot].split[/].get[1]>
                  - define found:true
        - else:
          - if <[slotmap].map_get[<context.slot>]||null> == null:
            - determine passively cancelled
            - stop
      - foreach <list[hat|gloves|shirt|shoes|pants|cape]>:
        - if <context.item.script.yaml_key[category]||null> != <[value]>:
          - if <player.open_inventory.slot[<[slotmap].map_find_key[<[value]>]>].material.name> == air:
            - inventory set d:<player.open_inventory> slot:<[slotmap].map_find_key[<[value]>]> o:<item[<[value]>_shadow]>
      - run update_stats def:<player[<player.open_inventory.notable_name.split[_].get[2]>]||<player>>

invisible_placeholder:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -1
  display name: <&7>

get_hazard_protection_level:
  type: procedure
  definitions: player
  script:
    - define slotmap:<list[16/hat|25/shirt|34/pants|43/shoes]>
    - foreach <[slotmap]>:
      - define item:<inventory[equipment_<player.uuid>].slot[<[value].split[/].get[1]>]||<item[air]>>
      - define list:|:<[item].script.yaml_key[hazard_protection]||0>
    - define list:<[list].deduplicate>
    - determine <[list].lowest>

test_hat:
  type: item
  material: gold_ingot
  category: pants
  weight: 150
  equipment_rating: 5
  max_stars: 5
  sockets: 1
  equipment_modifiers:
    health:
      max: 100
      min: 10
    speed:
      max: 100
      min: 10
    weight:
      max: 100
      min: 10
    power:
      max: 100
      min: 10
    food:
      max: 100
      min: 10
    thirst:
      max: 100
      min: 10
    constitution:
      max: 100
      min: 10
    melee_damage:
      max: 100
      min: 10
    experience_multiplier:
      max: 100
      min: 10
    drop_rate_multiplier:
      max: 100
      min: 10
  display name: "<&c>Test Hat"
  lore:
    - "Something something Hat,"
    - "Something rare something lore"
  drops_on_death: true

test_ring:
  type: item
  material: gold_ingot
  category: ring
  equipment_rating: 10
  weight: 1000
  max_stars: 10
  sockets: 3
  equipment_modifiers:
    health: 100
    speed: 100
    weight: 100
    power: 100
    food: 100
    thirst: 100
    constitution: 100
    melee_damage: 100
    experience_multiplier: 100
    drop_rate_multiplier: 100
  display name: "<&c>Test Ring"
  lore:
    - "Something something ring,"
    - "Something rare something lore"
  drops_on_death: true
