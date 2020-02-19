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
        - narrate <context.slot>:<context.raw_slot>
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
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

build_item:
  type: task
  script:
    - if <[item].script.yaml_key[max_stars]||null> != null:
      - define i:0
      - define line:<&7>
      - while <[i]> < <[item].script.yaml_key[max_stars]>:
        - if <[i]> < <[item].nbt[stars]>:
          - define line:<[line]><&7><&chr[9956]>
        - else:
          - define line:<[line]><&6><&chr[9956]>
        - define i:++
      - define lore:|:<[line]>
    - define lore:|:<[item].lore>
    - define lore:|:<&9>
    - if <[item].script.yaml_key[weight]||null> != null:
      - define lore:|:<&9>Weight: <[item].script.yaml_key[weight]>
    - define lore:|:<&9>
    - define stat_names:<list[thirst/Thirst|constitution/Constitution|melee_damage/Damage|drop_rate_multiplier/Drop<&sp>Rate|health/Health|weight/Weights|experience_multiplier/Experience|power/Power|speed/Movement<&sp>Speed|food/Food]>
    - define lore:|:<&9>When<&sp>Worn:<&co>
    - foreach <[item].script.list_keys[equipment_modifiers]> as:modifier:
      - define value:<[item].script.yaml_key[equipment_modifiers.<[modifier]>]>
      - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]||null> != null:
        - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]||null> != null:
          - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]>]>
      - adjust def:item nbt:<[item].nbt.include[<[modifier]>/<[value]>]>
      - define lore:|:<&9>+<[value]><&sp><[stat_names].map_get[<[modifier]>]>
    - adjust def:item lore:<[lore]>

    