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
  material: snow
  display name: <&c>Stats
  GUI_Inventory: stats_character
  mechanisms:
    custom_model_data: 5
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
    on player closes equipment_character:
    - foreach <context.inventory.list_contents> as:item:
      - if <[item].script.yaml_key[category]||null> != null:
        - if !<[item].script.name.ends_with[_filler]>:
          - yaml id:player.<player.uuid> set equipment.<[item].script.yaml_key[category]>:<[item]>
    on player opens equipment_character:
    - foreach <context.inventory.list_contents> as:item:
      - if <[item].script.yaml_key[category]||null> != null:
        - inventory set d:<context.inventory> o:<yaml[player.<player.uuid>].read[equipment.<[item].script.yaml_key[category]>].as_item> slot:<context.inventory.find[item]>
    on player clicks *_equipment_filler in equipment_character with item:
    - wait 1t
    - determine passively cancelled
    - if <context.item.script.yaml_key[category]> == <context.cursor_item.script.yaml_key[category]>:
      - adjust <player> item_on_cursor:<item[air]>
      - yaml id:player.<player.uuid> set equipment.<context.item.script.yaml_key[category]>:<context.cursor_item>
    on player clicks in equipment_character:
    - narrate <context.slot>
    - wait 1t
    - determine passively cancelled
    - if !<context.item.script.name.ends_with[_filler]>:
      - inventory set d:<context.clicked_inventory> o:<item[<context.item.script.yaml_key[category]>_equipment_filler]> slot:<context.slot>
      - yaml id:player.<player.uuid> set equipment.<context.item.script.yaml_key[category]>:null

equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
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

basic_hat:
  type: item
  material: diamond_helmet
  category: hat
  equipment_rating: 5
  display name: "<&c>Basic Hat"
  drops_on_death: true

pendant_equipment_filler:
  type: item
  material: snow
  category: pendant
  equipment_rating: 0
  display name: "<&c>No Pendant Equipped"
  drops_on_death: false

charm_equipment_filler:
  type: item
  material: snow
  category: charm
  equipment_rating: 0
  display name: "<&c>No Charm Equipped"
  drops_on_death: false

trinket_equipment_filler:
  type: item
  material: snow
  category: charm
  equipment_rating: 0
  display name: "<&c>No Trinket Equipped"
  drops_on_death: false

face_accessory_equipment_filler:
  type: item
  material: snow
  category: face_accessory
  equipment_rating: 0
  display name: "<&c>No Face Accessory Equipped"
  drops_on_death: false

earring_equipment_filler:
  type: item
  material: snow
  category: earrings
  equipment_rating: 0
  display name: "<&c>No Earrings Equipped"
  drops_on_death: false

ring_equipment_filler:
  type: item
  material: snow
  category: ring
  equipment_rating: 0
  display name: "<&c>No Ring Equipped"
  drops_on_death: false

amulet_equipment_filler:
  type: item
  material: snow
  category: amulet
  equipment_rating: 0
  display name: "<&c>No Amulet Equipped"
  drops_on_death: false

shoes_equipment_filler:
  type: item
  material: snow
  category: shoes
  equipment_rating: 0
  display name: "<&c>No Shoes Equipped"
  drops_on_death: false

pants_equipment_filler:
  type: item
  material: snow
  category: pants
  equipment_rating: 0
  display name: "<&c>No Pants Equipped"
  drops_on_death: false

shirt_equipment_filler:
  type: item
  material: snow
  category: shirt
  equipment_rating: 0
  display name: "<&c>No Shirt Equipped"
  drops_on_death: false

gloves_equipment_filler:
  type: item
  material: snow
  category: gloves
  equipment_rating: 0
  display name: "<&c>No Gloves Equipped"
  drops_on_death: false

cape_equipment_filler:
  type: item
  material: snow
  category: cape
  equipment_rating: 0
  display name: "<&c>No Cape Equipped"
  drops_on_death: false

hat_equipment_filler:
  type: item
  material: snow
  category: hat
  equipment_rating: 0
  display name: "<&c>No Hat Equipped"
  drops_on_death: false

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
