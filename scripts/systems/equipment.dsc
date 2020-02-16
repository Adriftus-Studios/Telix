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
    custom_model_data: 0
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
  material: snow
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
    on player clicks item in equipment_character with item:
    - if <context.clicked_inventory.script_name> == "equipment_character":
      - define slotmap:<list[11/pendant|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|32/pants|43/shoes]>
      - if <context.cursor_item||null> != null:
        - if <context.cursor_item.script.yaml_key[category]||null> != null:
          - if <[slotmap].map_get[<context.slot>].starts_with[<context.cursor_item.script.yaml_key[category]>]>:
            - narrate 1
            - if !<context.item.script.name.ends_with[gui_invisible_item]>:
              - narrate 2
              - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:<context.cursor_item>
            - else:
              - narrate 4
          - else:
            - narrate 3
            - determine passively cancelled
        - else:
          - narrate <context.item.script.name>
          - yaml id:player.<player.uuid> set equipment.<[slotmap].map_get[<context.slot>]>:null

equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  - foreach <list[pendant|earrings|hat|ring1|ring2|gloves|shirt|cape|trinket1|trinket2|pants|shoes]>:
    - define items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||<item[gui_invisible_item]>>
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
  material: snow
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
