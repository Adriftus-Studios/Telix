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
  material: snow
  display name: <&c>Stats
  GUI_Inventory: stats_character
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
  definitions:
    filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
    closeitem: <item[guiclose]>
  slots:
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [ring_filler] [amulet_filler] [] [] [] [hat_filler] [] [filler]"
  - "[filler] [ring_filler] [amulet_filler] [] [] [cape_filler] [shirt_filler] [gloves_filler] [filler]"
  - "[filler] [ring_filler] [pendent_filler] [] [] [] [pants_filler] [] [filler]"
  - "[filler] [earring_filler] [face_accessory_filler] [] [] [] [shoes_filler] [] [filler]"
  - "[filler] [filler] [filler] [filler] [guiclose] [filler] [filler] [filler] [filler]"

face_accessory_filler:
  type: item
  material: snow
  category: face_accessory
  display name: "<&c>No Face Accessory Equipted"
  drops_on_death: false

earring_filler:
  type: item
  material: snow
  category: earrings
  display name: "<&c>No Earrings Equipted"
  drops_on_death: false

ring_filler:
  type: item
  material: snow
  category: ring
  display name: "<&c>No Ring Equipted"
  drops_on_death: false

amulet_filler:
  type: item
  material: snow
  category: amulet
  display name: "<&c>No Amulet Equipted"
  drops_on_death: false

pendent_filler:
  type: item
  material: snow
  category: pendent
  display name: "<&c>No Pendent Equipted"
  drops_on_death: false

shoes_filler:
  type: item
  material: snow
  category: shoes
  display name: "<&c>No Shoes Equipted"
  drops_on_death: false

pants_filler:
  type: item
  material: snow
  category: pants
  display name: "<&c>No Pants Equipted"
  drops_on_death: false

shirt_filler:
  type: item
  material: snow
  category: shirt
  display name: "<&c>No Shirt Equipted"
  drops_on_death: false

gloves_filler:
  type: item
  material: snow
  category: gloves
  display name: "<&c>No Gloves Equipted"
  drops_on_death: false

cape_filler:
  type: item
  material: snow
  category: cape
  display name: "<&c>No Cape Equipted"
  drops_on_death: false

hat_filler:
  type: item
  material: snow
  category: hat
  display name: "<&c>No Hat Equipted"
  drops_on_death: false

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot].with[custom_model_data=0]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot].with[custom_model_data=1]> boots:<item[equipment_boots_slot]>

system_equipment_override:
  type: world
  events:
    on player clicks equipment_*_slot in inventory:
      - narrate <context.item.script.name.after[_].before[_]>
      - determine passively cancelled
      - wait 1t
      - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
