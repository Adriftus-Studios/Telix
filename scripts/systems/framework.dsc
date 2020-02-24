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

reload_scripts:
    type: world
    reload:
        - yaml create id:server.skills_by_level
        - yaml create id:server.equipment
        - yaml create id:server.ore_rates
        - yaml create id:server.smeltery_recipes
        - foreach <server.list_scripts>:
            - if <[value].name.starts_with[ability_]>:
                - if <[value].yaml_key[ability_tree]||null> == null:
                    - announce to_ops "<[value].name> is not properly defined. (<[value].filename>)"
                - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[points_to_unlock]>:|:<[value].yaml_key[name]>
            - if <[value].yaml_key[ore]||null> != null:
                - yaml id:server.ore_rates set <[value].yaml_key[ore.block]>.<[value].yaml_key[ore.biome]>.<[value].yaml_key[ore.chance]>:<[value].name>
            - if <[value].yaml_key[type]> == item:
                - if <[value].yaml_key[category]||null> != null:
                    - yaml id:server.equipment set <[value].yaml_key[category]>:|:<[value]>
                - if <[value].yaml_key[recipes]||null> != null:
                  - foreach <[value].list_keys[recipes]> as:recipe:
                    - if <[value].yaml_key[recipes.<[recipe]>.type]> == smeltery:
                      - yaml id:server.smeltery_recipes set <[value].name>.cook_time:<[value].yaml_key[recipes.<[recipe]>.cook_time]>
                      - yaml id:server.smeltery_recipes set <[value].name>.input:<[value].yaml_key[recipes.<[recipe]>.input]>
                      - yaml id:server.smeltery_recipes set <[value].name>.output_quantity:<[value].yaml_key[recipes.<[recipe]>.output_quantity]>
    events:
        on server start:
        - inject locally reload
        on script reload:
        - inject locally reload

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

system_override:
  type: world
  events:
    on player breaks block priority:-10:
      - if <player.gamemode> == SURVIVAL:
        - foreach <context.location.drops[<player.item_in_hand>]> as:drop:
          - define drops:|:<item[custom_<[drop]>]>
        - determine <[drops]>
    on player respawns:
      - inject system_equipment_set
    on player clicks in inventory:
      - if <player.open_inventory> == <player.inventory>:
        - if <context.raw_slot> < 6:
          - define slotmap:<list[1/null|2/recipe_book_inventory|3/citadels|4/guilds|5/settings]>
          - if <inventory[<[slotmap].map_get[<context.raw_slot>]>]||null> != null:
            - inventory open d:<inventory[<[slotmap].map_get[<context.raw_slot>]>]>
      - if <context.item.script.yaml_key[GUI_Inventory]||null> != null:
        - determine passively cancelled
        - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
    on player chats:
      - if <player.has_permission[*]>:
        - if <player.flag[parsed_chat]>:
          - determine <context.message.parsed>

player_reset_command:
  type: command
  name: player_reset
  description: player_reset
  usage: /player_reset
  script:
  - kick <player> reason:Standby<&sp>while<&sp>we<&sp>reset<&sp>your<&sp>player<&sp>data.
  - yaml id:player.<player.uuid> unload

test_command:
  type: command
  name: test
  description: test
  usage: /test
  script:
  - define amount_needed:63
  - define has:32
  - define remaining:0
  - define remaining:<[amount_needed].sub[<[has]>]>
  - define add:<[amount_needed].sub[<[remaining]>]>
  - narrate needed:<[amount_needed]>
  - narrate has:<[has]>
  - narrate remaining:<[remaining]>
  - define amount_needed:<[remaining]>

build_item_command:
  type: command
  name: build_item
  description: build_item
  usage: /build_item
  script:
    - define item:<player.item_in_hand>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

star_item_command:
  type: command
  name: star_item
  description: star_item
  usage: /star_item
  script:
    - define item:<player.item_in_hand>
    - if <[item].nbt[used_sockets]||null> == null:
      - adjust def:item nbt:stars/0
    - adjust def:item nbt:stars/<[item].nbt[stars].add[1]>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

socket_item_command:
  type: command
  name: socket_item
  description: socket_item
  usage: /socket_item
  script:
    - define item:<player.item_in_hand>
    - if <[item].nbt[used_sockets]||null> == null:
      - adjust def:item nbt:used_sockets/0
    - adjust def:item nbt:used_sockets/<[item].nbt[used_sockets].add[1]>
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>

build_item:
  type: task
  script:
    - if <[item].script.yaml_key[category]||null> != null:
      - if <[item].script.yaml_key[max_stars]||null> != null:
        - if <[item].nbt[stars]||null> == null:
          - adjust def:item nbt:stars/0
        - define line:<&7>
        - repeat <[item].script.yaml_key[max_stars]>:
          - if <[value]> <= <[item].nbt[stars]>:
            - define line:<[line]><&6><&chr[2B50]>
          - else:
            - define line:<[line]><&7><&chr[2B50]>
        - define lore:|:<[line]>
      - define lore:|:<[item].script.yaml_key[lore]>
      - if <[item].script.yaml_key[sockets]||null> != null:
        - if <[item].nbt[used_sockets]||null> == null:
          - adjust def:item nbt:used_sockets/0
        - define line:<&7>
        - repeat <[item].script.yaml_key[sockets]>:
          - if <[value]> <= <[item].nbt[used_sockets]>:
            - define line:<[line]><&9>[<&chr[25CF]>]
          - else:
            - define line:<[line]><&7>[<&sp>]
        - define lore:|:<[line]>
      - define lore:|:<&9>
      - if <[item].script.yaml_key[weight]||null> != null:
        - define lore:|:<&9>Weight:<&sp><[item].script.yaml_key[weight]>
      - define lore:|:<&9>
      - define stat_names:<list[thirst/Thirst|constitution/Constitution|melee_damage/Damage|drop_rate_multiplier/Drop<&sp>Rate|health/Health|weight/Weights|experience_multiplier/Experience|power/Power|speed/Movement<&sp>Speed|food/Food]>
      - define lore:|:<&9>When<&sp>Equipped:<&co>
      - foreach <[item].script.list_keys[equipment_modifiers]> as:modifier:
        - define value:<[item].nbt[base_stats.<[modifier]>]||<[item].script.yaml_key[equipment_modifiers.<[modifier]>]>>
        - if <[item].nbt[base_stats.<[modifier]>]||null> == null:
          - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]||null> != null:
            - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]||null> != null:
              - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]>]>
        - adjust def:item nbt:base_stats.<[modifier]>/<[value]>
        - define stats:|:<[modifier]>/<[value]>
        - define modifiers:|:<[modifier]>
        - define lore:|:<&9>+<[value]><&sp><[stat_names].map_get[<[modifier]>]>
      - adjust def:item lore:<[lore]>
      - adjust def:item nbt:built/true