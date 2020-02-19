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
    nbt_attributes: generic.armor/chest/0/0
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

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

system_override:
  type: world
  events:
    on player respawns:
      - inject system_equipment_set
    on player clicks in inventory:
      - narrate <context.slot>:<context.raw_slot>
      - narrate <player.open_inventory>
      - narrate <player.inventory>
      - if <context.item.script.yaml_key[GUI_Inventory]||null> != null:
        - determine passively cancelled
        - wait 1t
        - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
