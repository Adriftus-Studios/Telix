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
      - if <player.open_inventory> == <player.inventory>:
        # for more inventory buttons for 2x2 crafting grid
      - if <context.item.script.yaml_key[GUI_Inventory]||null> != null:
        - determine passively cancelled
        - wait 1t
        - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>

build_item_command:
  type: command
  name: build_item
  description: build_item
  usage: /build_item
  script:
    - define item:<player.item_in_hand>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:1

build_item:
  type: task
  script:
    - define lore:|:""
    - if <[item].script.yaml_key[weight]||null> != null:
      - define lore:|:"<&9>Weight:<&sp><[item].script.yaml_key[weight]>"
    - define lore:|:""
    - if <[item].script.yaml_key[equipment_modifiers.health]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.health]><&sp>Health"
    - if <[item].script.yaml_key[equipment_modifiers.speed]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.speed]><&sp>Movement<&sp>Speed"
    - if <[item].script.yaml_key[equipment_modifiers.weight]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.weight]><&sp>Carry<&sp>Weight"
    - if <[item].script.yaml_key[equipment_modifiers.power]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.power]><&sp>Power"
    - if <[item].script.yaml_key[equipment_modifiers.food]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.Food]><&sp>Max<&sp>Food"
    - if <[item].script.yaml_key[equipment_modifiers.thirst]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.thirst]><&sp>Max<&sp>Thirst"
    - if <[item].script.yaml_key[equipment_modifiers.constitution]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.constitution]><&sp>Constitution"
    - if <[item].script.yaml_key[equipment_modifiers.melee_damage]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.melee_damage]>%<&sp>Damage"
    - if <[item].script.yaml_key[equipment_modifiers.experience_multiplier]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.experience_multiplier]>%<&sp>Experience"
    - if <[item].script.yaml_key[equipment_modifiers.drop_rate_multiplier]||null> != null:
      - define lore:|:"<&9>+<[item].script.yaml_key[equipment_modifiers.drop_rate_multiplier]>%<&sp>Drop<&sp>Rate"
    - adjust <[item]> lore:<[lore]>
    - narrate <[lore]>
    - define item:<[item]>