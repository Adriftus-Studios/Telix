equipment_head_slot:
  type: item
  material: rabbit_hide
  display name: <&6>Cosmetics
  GUI_Inventory: abilities_characterAbilityTrees
  drops_on_death: false
  weight: 0
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
  material: gold_nugget
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

equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  - define items
  - foreach <list[hat|shirt|pants|shoes|air|gloves|cape|pendent|charm|amulet|ring|earrings|face_accessory]>:
    - if <[value].ends_with[air]>:
      - define items:|:<[air]>
    - else:
      - define items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||equipment_filler_<[value]>>
  - determine <[items]>
  definitions:
    w_filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [earring_equipment_filler] [charm_equipment_filler] [] [] [] [hat_equipment_filler] [] [w_filler]"
  - "[w_filler] [ring_equipment_filler] [amulet_equipment_filler] [] [] [cape_equipment_filler] [shirt_equipment_filler] [gloves_equipment_filler] [w_filler]"
  - "[w_filler] [face_accessory_equipment_filler] [pendent_equipment_filler] [] [] [] [pants_equipment_filler] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [shoes_equipment_filler] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

equipment_inventory_handler:
  type: world
  debug: true
  events:
    on player clicks in equipment_character:
    - if <context.clicked_inventory.script_name> == "EQUIPMENT_CHARACTER":
      - determine passively cancelled
      - if <context.item.script.yaml_key[category]||null> != null:
        - if <context.item.script.name.ends_with[_filler]>:
          - narrate 2
    - else:
      - if <context.item.script.yaml_key[category]||null> != null:
        - determine passively cancelled
        - narrate 3

basic_hat:
  type: item
  material: diamond_helmet
  category: hat
  equipment_rating: 5
  display name: "<&c>Basic Hat"
  drops_on_death: true

charm_equipment_filler:
  type: item
  material: snow
  category: charm
  equipment_rating: 0
  display name: "<&c>No Charm Equipted"
  drops_on_death: false

face_accessory_equipment_filler:
  type: item
  material: snow
  category: face_accessory
  equipment_rating: 0
  display name: "<&c>No Face Accessory Equipted"
  drops_on_death: false

earring_equipment_filler:
  type: item
  material: snow
  category: earrings
  equipment_rating: 0
  display name: "<&c>No Earrings Equipted"
  drops_on_death: false

ring_equipment_filler:
  type: item
  material: snow
  category: ring
  equipment_rating: 0
  display name: "<&c>No Ring Equipted"
  drops_on_death: false

amulet_equipment_filler:
  type: item
  material: snow
  category: amulet
  equipment_rating: 0
  display name: "<&c>No Amulet Equipted"
  drops_on_death: false

pendent_equipment_filler:
  type: item
  material: snow
  category: pendent
  equipment_rating: 0
  display name: "<&c>No Pendent Equipted"
  drops_on_death: false

shoes_equipment_filler:
  type: item
  material: snow
  category: shoes
  equipment_rating: 0
  display name: "<&c>No Shoes Equipted"
  drops_on_death: false

pants_equipment_filler:
  type: item
  material: snow
  category: pants
  equipment_rating: 0
  display name: "<&c>No Pants Equipted"
  drops_on_death: false

shirt_equipment_filler:
  type: item
  material: snow
  category: shirt
  equipment_rating: 0
  display name: "<&c>No Shirt Equipted"
  drops_on_death: false

gloves_equipment_filler:
  type: item
  material: snow
  category: gloves
  equipment_rating: 0
  display name: "<&c>No Gloves Equipted"
  drops_on_death: false

cape_equipment_filler:
  type: item
  material: snow
  category: cape
  equipment_rating: 0
  display name: "<&c>No Cape Equipted"
  drops_on_death: false

hat_equipment_filler:
  type: item
  material: snow
  category: hat
  equipment_rating: 0
  display name: "<&c>No Hat Equipted"
  drops_on_death: false

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

system_equipment_override:
  type: world
  events:
    on player clicks equipment_*_slot in inventory:
      - narrate <context.item.script.name.after[_].before[_]>
      - determine passively cancelled
      - wait 1t
      - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
