equipment_head_slot:
  type: item
  material: rabbit_hide
  display name: <&6>Cosmetics
  drops_on_death: false
  lore:
  - "<&e>Click to open your cosmetics menu."

equipment_chest_slot:
  type: item
  material: golden_chestplate
  display name: <&7>Equipment
  drops_on_death: false
  lore:
  - "<&e>Click to open your equipment window."
  mechanisms:
    unbreakable: true
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS|HIDE_UNBREAKABLE

equipment_leg_slot:
  type: item
  material: snow
  display name: <&c>Stats
  drops_on_death: false
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
  display name: <&c>Skills/Abilities
  drops_on_death: false
  lore:
  - "<&e>Click to open your skills and abilities menu."

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
      - inventory open d:player_screen_<context.item.script.name.after[_].before[_]>
