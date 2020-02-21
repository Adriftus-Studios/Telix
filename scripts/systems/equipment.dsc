
view_equipment_command:
  type: command
  name: view_equipment
  description: view_equipment
  usage: /view_equipment
  script:
  - narrate <context.args>

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

equipment_inventory_handler:
  type: world
  debug: false
  events:
    on player drags item in equipment_character:
      - if <player.open_inventory.script_name> == "equipment_character":
        - if <context.raw_slot> < 55:
          - determine passively cancelled
    on player clicks item in equipment_character with item:
      - if <player.open_inventory.script_name> == "equipment_character":
        - define slotmap:<list[11/pendant|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|32/pants|43/shoes]>
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
            - inject update_stats
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
                    - inject update_stats
                    - define found:true
          - else:
            - if <[slotmap].map_get[<context.slot>]||null> == null:
              - determine passively cancelled
              - stop
            - wait 1t
            - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<context.inventory.slot[<context.slot>]>
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
  - foreach <list[pendant|earrings|hat|ring1|ring2|gloves|shirt|cape|trinket1|trinket2|pants|shoes]>:
    - define items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||<item[air]>>
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

basic_pendant:
  type: item
  material: snow
  category: pendant
  equipment_rating: 0
  display name: "<&c>Basic Pendant"
  drops_on_death: true

basic_trinket:
  type: item
  material: snow
  category: trinket
  equipment_rating: 0
  display name: "<&c>Basic Trinket"
  drops_on_death: true

basic_earrings:
  type: item
  material: snow
  category: earrings
  equipment_rating: 0
  display name: "<&c>Basic Earrings"
  drops_on_death: true

test_hat:
  type: item
  material: gold_ingot
  category: hat
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

basic_ring:
  type: item
  material: snow
  category: ring
  equipment_rating: 0
  weight: 10
  equipment_modifiers:
    speed: 100
  display name: "<&c>Basic Ring"
  drops_on_death: true

basic_shoes:
  type: item
  material: snow
  category: shoes
  equipment_rating: 0
  display name: "<&c>Basic Shoes"
  drops_on_death: true

basic_pants:
  type: item
  material: snow
  category: pants
  equipment_rating: 0
  display name: "<&c>Basic Pants"
  drops_on_death: true

basic_shirt:
  type: item
  material: snow
  category: shirt
  equipment_rating: 0
  display name: "<&c>Basic Shirt"
  drops_on_death: true

basic_gloves:
  type: item
  material: snow
  category: gloves
  equipment_rating: 0
  display name: "<&c>Basic Gloves"
  drops_on_death: true

basic_cape:
  type: item
  material: snow
  category: cape
  equipment_rating: 0
  display name: "<&c>Basic Cape"
  drops_on_death: true

basic_hat:
  type: item
  material: snow
  category: hat
  equipment_rating: 0
  display name: "<&c>Basic Hat"
  drops_on_death: true
