equipment_head_slot:
  type: item
  material: rabbit_hide
  display name: <&6>Cosmetics
  GUI_Inventory: abilities_characterAbilityTrees
  drops_on_death: false
  weight: 0
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&e>Click to open your cosmetics menu."

equipment_chest_slot:
  type: item
  material: golden_chestplate
  display name: <&7>Equipment
  GUI_Inventory: equipment_character
  drops_on_death: false
  weight: 0
  lore:
  - "<&e>Click to open your equipment window."
  mechanisms:
    unbreakable: true
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE

equipment_leg_slot:
  type: item
  material: iron_nugget
  display name: <&c>Stats
  GUI_Inventory: stats_character
  mechanisms:
    custom_model_data: -2
  drops_on_death: false
  weight: 0
  lore:
  - "<&a>Level<&co><&e> <yaml[player.<player.uuid>].read[stats.level]>"
  - "<&c>Max Health<&co><&e> <yaml[player.<player.uuid>].read[stats.health.max]>"
  - "<&4>Max Food<&co><&e> <yaml[player.<player.uuid>].read[stats.food.max]>"
  - "<&2>Max Thirst<&co><&e> <yaml[player.<player.uuid>].read[stats.thirst.max]>"
  - "<&6>Constitution<&co><&e> <yaml[player.<player.uuid>].read[stats.constitution]>"
  - "<&d>Speed<&co><&e> <yaml[player.<player.uuid>].read[stats.speed]>%"
  - "<&b>--------------------------"
  - "<&b>Click to open your stats menu."

equipment_boots_slot:
  type: item
  material: iron_nugget
  mechanisms:
    custom_model_data: -1
  GUI_Inventory: abilities_characterAbilityTrees
  display name: <&c>Skills/Abilities
  drops_on_death: false
  weight: 0
  lore:
  - "<&e>Click to open your skills and abilities menu."

equipment_inventory_handler:
  type: world
  debug: false
  events:
    on player drags item in equipment_character:
      - if <player.open_inventory.script_name> == "equipment_character":
        - determine passively cancelled
    on player clicks item in equipment_character with item:
      - define slotmap:<list[11/pendant|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|32/pants|43/shoes]>
      - if !<context.is_shift_click>:
        - if <player.open_inventory.script_name> != "equipment_character":
          - stop
        - narrate 1
        - if <[slotmap].map_get[<context.slot>]||null> == null:
          - determine passively cancelled
          - stop
        - narrate 2
        - if <context.cursor_item.material.name> != air:
          - if <[slotmap].map_get[<context.slot>].starts_with[<context.cursor_item.script.yaml_key[category]>]||false> == false:
            - determine passively cancelled
            - stop
          - if <context.item.script.yaml_key[category].starts_with[<context.cursor_item.script.yaml_key[category]>]||false> != false:
            - determine passively cancelled
            - stop
        - narrate 3
        - wait 1t
        - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<player.open_inventory.slot[<context.slot>]>
      - else:
        - if <player.open_inventory.script_name> != "equipment_character":
          - determine passively cancelled
          - define found:false
          - foreach <[slotmap]> as:slot:
            - if !<[found]>:
              - if <[slot].contains[/<context.item.script.yaml_key[category]>]>:
                - if <context.inventory.slot[<[slot].split[/].get[1]>]> == <item[air]>:
                  - inventory adjust slot:<context.slot> quantity:<player.open_inventory.slot[<context.slot>].quantity.-[1]>
                  - inventory set d:<context.inventory> o:<context.item.with[quantity=1]> slot:<[slot].split[/].get[1]>
                  - wait 1t
                  - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<[slot].split[/].get[1]>]>:<context.inventory.slot[<[slot].split[/].get[1]>]>
                  - define found:true
        - else:
          - if <[slotmap].map_get[<context.slot>]||null> == null:
            - determine passively cancelled
            - stop
          - wait 1t
          - narrate <context.inventory.slot[<context.slot>]>
          - narrate <context.item.script.yaml_key[category]>
          - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<context.inventory.slot[<context.slot>]>

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

rare_ring:
  type: item
  material: gold_ingot
  category: ring
  equipment_rating: 0
  display name: "<&c>Rare Ring"
  drops_on_death: true

basic_ring:
  type: item
  material: snow
  category: ring
  equipment_rating: 0
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

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

system_equipment_override:
  type: world
  events:
    on player respawns:
      - inject system_equipment_set
    on player clicks equipment_*_slot in inventory:
      - narrate <context.item.script.name.after[_].before[_]>
      - determine passively cancelled
      - wait 1t
      - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
