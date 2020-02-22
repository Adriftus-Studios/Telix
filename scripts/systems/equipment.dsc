
view_equipment_command:
  type: command
  name: view_equipment
  description: view_equipment
  usage: /view_equipment
  tab complete:
  - foreach <server.list_material_types> as:mat:
    - if <[mat].name.starts_with[<context.args.get[1]>]>:
      - define list:|:<[mat].name>
  - determine <[list]>
  script:
  - flag <player> context:<context.args.get[1]>/<context.args.get[2]>
  - inventory open d:view_equipment

view_equipment:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Stuff<&r> <&6>◆
  size: 54
  procedural items:
  - define mat:<material[<player.flag[context].split[/].get[1]>]>
  - define page:<player.flag[context].split[/].get[2]>
  - repeat 63:
    - define list:|:<item[<[mat]>].with[custom_model_data=<[value].add[<[page].mul[53].sub[53]>]>].with[lore=<[value].add[<[page].mul[53].sub[53]>]>]>
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
      - foreach <yaml[player.<player.uuid>].list_keys[equipment]> as:equipment:
        - define item:<yaml[player.<player.uuid>].read[equipment.<[equipment]>].as_item>
        - if <[item].material.name> != air:
          - if <[item].script.yaml_key[drops_on_death]||true>:
            - yaml id:player.<player.uuid> set equipment.<[equipment]>:<item[air]>
            - determine <context.drops.include[<[item]>]>
        - inject update_stats

hat_shadow:
  type: item
  material: diamond_pickaxe
  category: hat
  mechanisms:
    custom_model_data: -1
  display name: "No Hat Equipped"

shirt_shadow:
  type: item
  material: diamond_pickaxe
  category: shirt
  mechanisms:
    custom_model_data: -2
  display name: "No Shirt Equipped"

pants_shadow:
  type: item
  material: diamond_pickaxe
  category: pants
  mechanisms:
    custom_model_data: -3
  display name: "No Pants Equipped"

shoes_shadow:
  type: item
  material: diamond_pickaxe
  category: shoes
  mechanisms:
    custom_model_data: -4
  display name: "No Shoes Equipped"

cape_shadow:
  type: item
  material: diamond_pickaxe
  category: cape
  mechanisms:
    custom_model_data: -5
  display name: "No Cape Equipped"

gloves_shadow:
  type: item
  material: diamond_pickaxe
  category: gloves
  mechanisms:
    custom_model_data: -6
  display name: "No Gloves Equipped"

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
    on player clicks item in equipment_character with item:
      - if <player.open_inventory.script_name> == "equipment_character":
        - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
        - foreach <list[hat|gloves|shirt|shoes|pants|cape]>:
          - if <player.open_inventory.slot[<[slotmap].map_find_key[<[value]>]>].script.name.ends_with[_shadow]>:
            - inventory set d:<player.open_inventory> slot:<[slotmap].map_find_key[<[value]>]> o:<item[air]>
        - if <list[hat|gloves|shirt|shoes|pants|cape].contains[<context.item.script.yaml_key[category]>]>:
          - if <player.open_inventory.slot[<[slotmap].map_find_key[<context.item.script.yaml_key[category]>]>].material.name> == air:
            - inventory set d:<player.open_inventory> o:<item[air]> slot:<[slotmap].map_find_key[<context.item.script.yaml_key[category]>]>
        - if !<context.is_shift_click>:
          - if <context.raw_slot> < 55:
            - if <[slotmap].map_get[<context.slot>]||null> == null:
              - determine passively cancelled
              - stop
            - if <context.cursor_item.material.name> != air:
              - if <[slotmap].map_get[<context.slot>].starts_with[<context.cursor_item.script.yaml_key[category]>]||false> == false:
                - determine passively cancelled
                - stop
              - if <context.item.script.yaml_key[category].starts_with[<context.cursor_item.script.yaml_key[category]>]||false> != false:
                - determine passively cancelled
                - stop
            - wait 1t
            - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<player.open_inventory.slot[<context.slot>]>
        - else:
          - if <context.raw_slot> > 54:
            - determine passively cancelled
            - define found:false
            - foreach <[slotmap]> as:slot:
              - if !<[found]>:
                - if <[slot].contains[/<context.item.script.yaml_key[category]>]>:
                  - if <context.inventory.slot[<[slot].split[/].get[1]>]> == <item[air]>:
                    - inventory adjust slot:<context.slot> quantity:<player.inventory.slot[<context.slot>].quantity.-[1]>
                    - inventory set d:<player.open_inventory> o:<context.item.with[quantity=1]> slot:<[slot].split[/].get[1]>
                    - wait 1t
                    - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<[slot].split[/].get[1]>]>:<player.open_inventory.slot[<[slot].split[/].get[1]>]>
                    - define found:true
          - else:
            - if <[slotmap].map_get[<context.slot>]||null> == null:
              - determine passively cancelled
              - stop
            - wait 1t
            - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<context.inventory.slot[<context.slot>]>
        - wait 1t
        - foreach <list[hat|gloves|shirt|shoes|pants|cape]>:
          - if <player.open_inventory.slot[<[slotmap].map_find_key[<[value]>]>].material.name> = air:
            - inventory set d:<player.open_inventory> slot:<[slotmap].map_find_key[<[value]>]> o:<item[<[value]>_shadow]>
          - if <yaml[player.<player.uuid>].list_keys[equipment.<[value]>].script.name.ends_with[_shadow]>:
            - yaml id:player.<player.uuid> set equipment.<[value]>:!
        - inject update_stats

invisible_placeholder:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -1
  display name: <&7>

equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  - foreach <list[necklace|earrings|hat|ring1|ring2|gloves|shirt|cape|trinket1|trinket2|pants|shoes]>:
    - if <yaml[player.<player.uuid>].read[equipment.<[value]>].material.name> != air:
      - define items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||<item[<[value]>_shadow]||<item[air]>>>
    - else:
      - define items:|:<item[<[value]>_shadow]||<item[air]>>
  - determine <[items]>
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

test_hat:
  type: item
  material: gold_ingot
  category: pants
  equipment_rating: 5
  weight: 15
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
  weight: 10
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
