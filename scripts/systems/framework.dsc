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
  GUI_Inventory: equipment_<player.uuid>
  drops_on_death: false
  weight: 0
  lore:
  - "<&e>Click to open your equipment window."
  mechanisms:
    nbt_attributes: generic.armor/chest/0/0
    flags: HIDE_ATTRIBUTES|HIDE_ENCHANTS

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

delwarp_command:
  type: command
  name: delwarp
  permission: delwarp
  script:
    - if <server.list_notables[locations].contains[warp_<context.args.get[1]>]>:
      - note remove as:warp_<context.args.get[1]>

warp_command:
  type: command
  name: warp
  permission: warp
  tab complete:
    - if <context.args.size> == 0:
      - determine <server.list_notables[locations].parse[notable_name].filter[starts_with[warp_]].parse[replace[warp_].with[]]||<list[]>>
    - else if <context.args.size> == 1:
      - determine <server.list_notables[locations].parse[notable_name].filter[starts_with[warp_]].parse[replace[warp_].with[]].filter[starts_with[<context.args.get[1]>]]||<list[]>>
    - else:
      - determine <server.list_online_players.parse[name]>
  script:
    - if <server.list_notables[locations].contains[<location[warp_<context.args.get[1]>]>]>:
      - if <player.has_permission[warp.<context.args.get[1]>]>:
        - teleport <location[warp_<context.args.get[1]>]>

setwarp_command:
  type: command
  name: setwarp
  permission: setwarp
  script:
    - note <player.location> as:warp_<context.args.get[1]>

spawn_command:
  type: command
  name: spawn
  permission: spawn
  tab complete:
    - determine <server.list_online_players.parse[name].filter[starts_with[<context.args.get[1]||>]]>
  script:
    - if <location[spawn]||null> != null:
      - teleport <server.match_player[<context.args.get[1]||null>]||<player>> <location[spawn]>

setspawn_command:
  type: command
  name: setspawn
  permission: setspawn
  script:
    - note <player.location> as:spawn

smelted_into:
  # used for mob drops for burning mobs
  type: yaml data
  items:
    porkchop: cooked_porkchop

reload_scripts:
    type: world
    reload:
      - yaml create id:server.executable_scripts
      - yaml create id:server.skills_by_level
      - yaml create id:server.equipment
      - yaml create id:server.ore_rates
      - yaml create id:server.drop_rates
      - yaml create id:server.smeltery_recipes
      - yaml create id:server.alchemy_recipes
      - yaml create id:server.altar_recipes
      - yaml create id:server.cooking_recipes
      - yaml create id:server.recipe_book
      - yaml create id:server.recipe_fixer
      - yaml create id:server.mob_spawns
      - yaml create id:server.mobs
      - yaml load:data/skill_trees.yml id:server.skill_trees
      - adjust server reset_recipes
      - foreach <server.list_scripts>:
          - if <[value].yaml_key[script]||<[value].yaml_key[events]||null>> != null:
            - yaml id:server.executable_scripts set scripts:|:<[value].name>
          - if <[value].name.starts_with[ability_]>:
              - if <[value].yaml_key[ability_tree]||null> == null:
                  - announce to_ops "<[value].name> is not properly defined. (<[value].filename>)"
              - else:
                  - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[points_to_unlock]>:|:<[value].yaml_key[name]>
          - if <[value].yaml_key[type]> == item:
              - if <[value].yaml_key[recipe_book_note]||null> != null:
                - yaml id:server.recipe_book set notes.<[value].name>:<[value].yaml_key[recipe_book_note]>
              - if <[value].yaml_key[ore]||null> != null:
                - foreach <[value].list_keys[ore]> as:ore:
                  - foreach <[value].yaml_key[ore.<[ore]>.biome].as_list> as:biome:
                    - foreach <[value].yaml_key[ore.<[ore]>.block].as_list> as:block:
                      - yaml id:server.ore_rates set <[block]>.<[biome]>.<[value].yaml_key[ore.<[ore]>.chance]>:|:<[value].name>
                  - yaml id:server.recipe_book set ore_spawn.<[value].name>.block:<[value].yaml_key[ore.<[ore]>.block]||all>
                  - yaml id:server.recipe_book set ore_spawn.<[value].name>.biome:<[value].yaml_key[ore.<[ore]>.biome]||all>
                  - yaml id:server.recipe_book set ore_spawn.<[value].name>.chance:<[value].yaml_key[ore.<[ore]>.chance]||20>
                  - yaml id:server.recipe_book set ore_spawn.<[value].name>.tool:<[value].yaml_key[ore.<[ore]>.tool]||all>
              - if <[value].yaml_key[mob_drops]||null> != null:
                - foreach <[value].list_keys[mob_drops]> as:num:
                  - foreach <[value].yaml_key[mob_drops.<[num]>.dropped_by].as_list> as:mob:
                    - yaml id:server.drop_rates set <[mob]>.<[value].name>.<[value].yaml_key[mob_drops.<[num]>.chance]>:<[value].yaml_key[mob_drops.<[num]>.min_quantity]>/<[value].yaml_key[mob_drops.<[num]>.max_quantity]>
                  - yaml id:server.recipe_book set mob_drops.<[value].name>.dropped_by:<[value].yaml_key[mob_drops.<[num]>.dropped_by]>
                  - yaml id:server.recipe_book set mob_drops.<[value].name>.chance:<[value].yaml_key[mob_drops.<[num]>.chance]>
                  - yaml id:server.recipe_book set mob_drops.<[value].name>.min_quantity:<[value].yaml_key[mob_drops.<[num]>.min_quantity]>
                  - yaml id:server.recipe_book set mob_drops.<[value].name>.max_quantity:<[value].yaml_key[mob_drops.<[num]>.max_quantity]>
                  - yaml id:server.recipe_book set mob_info.<[value].yaml_key[mob_drops.<[num]>.dropped_by]>.drops:|:<[value].name>
              - if <[value].yaml_key[category]||null> != null:
                  - yaml id:server.equipment set <[value].yaml_key[category]>:|:<[value]>
              - if <[value].yaml_key[recipes]||null> != null:
                - if <[value].yaml_key[recipe_book_category]||null> != null:
                  - foreach <[value].yaml_key[recipe_book_category].as_list> as:cat:
                    - yaml id:server.recipe_book set categories.<[cat]>:|:<[value].name>
                - else:
                  - yaml id:server.recipe_book set categories.other:|:<[value].name>
                - foreach <[value].list_keys[recipes]> as:recipe:
                  - if <server.list_material_types.parse[name].contains[<[value].name.replace[custom_].with[]>]>:
                    - if <server.list_recipe_ids.contains[minecraft:<[value].name.replace[custom_].with[]>]>:
                      - yaml id:server.recipe_fixer set recipes:|:<[value].name>
                      - if <[value].yaml_key[recipes.<[recipe]>.type]> != furnace && <[value].name> != custom_iron_ingot && <[value].name> != custom_gold_ingot:
                        - adjust server remove_recipes:minecraft:<[value].name.replace[custom_].with[]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == shaped:
                    - yaml id:server.recipe_fixer set restricted.shaped.<[value].yaml_key[recipes.<[recipe]>.input].as_list.separated_by[_].replace[|].with[_]>:|:<[value].name><&co><[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == shapeless:
                    - yaml id:server.recipe_fixer set restricted.shapeless.<[value].yaml_key[recipes.<[recipe]>.input].as_list.alphabetical.separated_by[_]>:|:<[value].name><&co><[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == furnace:
                    - yaml id:server.recipe_fixer set restricted.furnace.<[value].yaml_key[recipes.<[recipe]>.input]>:<[value].name><&co><[value].yaml_key[recipes.<[recipe]>.output_quantity]||1><&co><[value].yaml_key[recipes.<[recipe]>.cook_time]>
                  - if !<[value].yaml_key[recipes.<[recipe]>.hide_in_recipebook]||false>:
                    - foreach <[value].list_keys[recipes.<[recipe]>]> as:key:
                      - yaml id:server.recipe_book set <[value].yaml_key[recipes.<[recipe]>.type]>.<[value].name>.<[key]>:<[value].yaml_key[recipes.<[recipe]>.<[key]>]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == smeltery:
                    - yaml id:server.smeltery_recipes set <[value].name>.cook_time:<[value].yaml_key[recipes.<[recipe]>.cook_time]>
                    - yaml id:server.smeltery_recipes set <[value].name>.input:<[value].yaml_key[recipes.<[recipe]>.input]>
                    - yaml id:server.smeltery_recipes set <[value].name>.output_quantity:<[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == alchemy:
                    - yaml id:server.alchemy_recipes set <[value].name>.cook_time:<[value].yaml_key[recipes.<[recipe]>.cook_time]>
                    - yaml id:server.alchemy_recipes set <[value].name>.input:<[value].yaml_key[recipes.<[recipe]>.input]>
                    - yaml id:server.alchemy_recipes set <[value].name>.output_quantity:<[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == altar:
                    - yaml id:server.altar_recipes set <[value].name>.cook_time:<[value].yaml_key[recipes.<[recipe]>.cook_time]>
                    - yaml id:server.altar_recipes set <[value].name>.input:<[value].yaml_key[recipes.<[recipe]>.input]>
                    - yaml id:server.altar_recipes set <[value].name>.output_quantity:<[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                    - yaml id:server.altar_recipes set <[value].name>.required_tier:<[value].yaml_key[recipes.<[recipe]>.tier]||5>
                  - if <[value].yaml_key[recipes.<[recipe]>.type]> == cooking:
                    - yaml id:server.cooking_recipes set <[value].name>.cook_time:<[value].yaml_key[recipes.<[recipe]>.cook_time]>
                    - yaml id:server.cooking_recipes set <[value].name>.input:|:<[value].yaml_key[recipes.<[recipe]>.main_ingredient]||<list[]>>
                    - yaml id:server.cooking_recipes set <[value].name>.input:|:<[value].yaml_key[recipes.<[recipe]>.side_ingredients]||<list[]>>
                    - yaml id:server.cooking_recipes set <[value].name>.input:|:<[value].yaml_key[recipes.<[recipe]>.serving_dish]||<list[]>>
                    - yaml id:server.cooking_recipes set <[value].name>.output_quantity:<[value].yaml_key[recipes.<[recipe]>.output_quantity]>
                    - yaml id:server.cooking_recipes set <[value].name>.xp_given:<[value].yaml_key[recipes.<[recipe]>.xp_given]||1>
                  - if <list[altar|alchemy|smeltery].contains[<[value].yaml_key[recipes.<[recipe]>.type]>]>:
                    - foreach <[value].yaml_key[recipes.<[recipe]>.input].as_list.parse[split[/].get[1]]> as:entry:
                      - yaml id:server.recipe_book set used_for.<[entry]>:->:<[value].name>
                  - else:
                    - foreach <[value].yaml_key[recipes.<[recipe]>.input]||<list[]>> as:entry:
                      - foreach <[entry].as_list> as:entry:
                        - yaml id:server.recipe_book set used_for.<[entry]>:->:<[value].name>
                - yaml id:server.recipe_fixer set restricted.<[value].name>:<yaml[server.recipe_fixer].read[restricted.<[value].name>].as_list.deduplicate.exclude[air]||<list[]>>
          - if <[value].yaml_key[type]> == entity:
            - yaml id:server.mobs set <[value].name>.has_bossbar:<[value].yaml_key[custom.has_bossbar]||false>
            - if <[value].yaml_key[custom.spawning_conditions]||null> != null:
              - foreach <list[<[value].yaml_key[custom.spawning_conditions.world]>]> as:world:
                - foreach <list[<[value].yaml_key[custom.spawning_conditions.biome]>]> as:biome:
                  - yaml id:server.mob_spawns set <[world]>.<[biome]>.<[value].name>.every:<[value].yaml_key[custom.spawning_conditions.every]||1m>
              - yaml id:server.mobs set <[value].name>.every:<[value].yaml_key[custom.spawning_conditions.every]||1m>
              - yaml id:server.mobs set <[value].name>.max_y:<[value].yaml_key[custom.spawning_conditions.max_y]||255>
              - yaml id:server.mobs set <[value].name>.min_y:<[value].yaml_key[custom.spawning_conditions.min_y]||0>
              - yaml id:server.mobs set <[value].name>.max_quantity:<[value].yaml_key[custom.spawning_conditions.max_quantity]||1>
              - yaml id:server.mobs set <[value].name>.min_quantity:<[value].yaml_key[custom.spawning_conditions.min_quantity]||1>
              - yaml id:server.mobs set <[value].name>.water:<[value].yaml_key[custom.spawning_conditions.water]||false>
              - yaml id:server.mobs set <[value].name>.air:<[value].yaml_key[custom.spawning_conditions.air]||false>
              - yaml id:server.mobs set <[value].name>.max_distance:<[value].yaml_key[custom.spawning_conditions.max_distance]||50>
              - yaml id:server.mobs set <[value].name>.min_distance:<[value].yaml_key[custom.spawning_conditions.min_distance]||10>
              - yaml id:server.mobs set <[value].name>.time:<[value].yaml_key[custom.spawning_conditions.time]||all>
              - yaml id:server.mobs set <[value].name>.spawn_script:<[value].yaml_key[custom.spawning_conditions.spawn_script]||none>
              - yaml id:server.mobs set <[value].name>.aggressive_on_spawn:<[value].yaml_key[custom.spawning_conditions.aggressive_on_spawn]||false>
              - yaml id:server.mobs set <[value].name>.per_world_limit:<[value].yaml_key[custom.spawning_conditions.per_world_limit]||100>
              - yaml id:server.mobs set <[value].name>.above_ground:<[value].yaml_key[custom.spawning_conditions.above_ground]||true>
              - yaml id:server.mobs set <[value].name>.chance:<[value].yaml_key[custom.spawning_conditions.chance]||1>
              - yaml id:server.mobs set <[value].name>.worlds:<[value].yaml_key[custom.spawning_conditions.world]||tor_mainland>
              - yaml id:server.recipe_book set mob_info.<[value].name>.every:<[value].yaml_key[custom.spawning_conditions.every]||1m>
              - yaml id:server.recipe_book set mob_info.<[value].name>.max_y:<[value].yaml_key[custom.spawning_conditions.max_y]||255>
              - yaml id:server.recipe_book set mob_info.<[value].name>.min_y:<[value].yaml_key[custom.spawning_conditions.min_y]||0>
              - yaml id:server.recipe_book set mob_info.<[value].name>.water:<[value].yaml_key[custom.spawning_conditions.water]||false>
              - yaml id:server.recipe_book set mob_info.<[value].name>.air:<[value].yaml_key[custom.spawning_conditions.air]||false>
              - yaml id:server.recipe_book set mob_info.<[value].name>.time:<[value].yaml_key[custom.spawning_conditions.time]||all>
              - yaml id:server.recipe_book set mob_info.<[value].name>.aggressive_on_spawn:<[value].yaml_key[custom.spawning_conditions.aggressive_on_spawn]||false>
              - yaml id:server.recipe_book set mob_info.<[value].name>.above_ground:<[value].yaml_key[custom.spawning_conditions.above_ground]||true>
              - yaml id:server.recipe_book set mob_info.<[value].name>.entity_type:<[value].yaml_key[entity_type]>
            - yaml id:server.mobs set <[value].name>.xp:<[value].yaml_key[custom.xp_dropped]||1>
            - if <[value].yaml_key[custom.ability_usage]||null> != null:
              - yaml id:server.mobs set <[value].name>.abilities:<[value].yaml_key[custom.ability_usage]>
      - foreach <yaml[server.recipe_book].list_keys[used_for]> as:item:
        - yaml id:server.recipe_book set used_for.<[item]>:<yaml[server.recipe_book].read[used_for.<[item]>].as_list.deduplicate.exclude[air].exclude[<[item]>]>
      - yaml id:server.recipe_fixer savefile:recipe_fixer.yml
      - yaml id:server.recipe_fixer set recipes:<yaml[server.recipe_fixer].read[recipes].as_list.deduplicate>
      - stop
      - foreach <server.list_recipe_ids[FURNACE]> as:recipe:
        - define output:<[recipe].replace[minecraft:].with[].replace[furnace_recipe_].with[].replace[_1].with[]>
        - yaml id:server.smeltery_recipes set <[output]>.cook_time:10s
        - yaml id:server.smeltery_recipes set <[output]>.input:<server.recipe_items[<[recipe]>].as_list.get[1]>
        - yaml id:server.smeltery_recipes set <[output]>.output_quantity:1
    events:
      on server start:
        - createworld tor_mainland environment:normal
        - createworld boss_world environment:normal worldtype:flat
        - inject locally reload
      on script reload:
        - inject locally reload
        
ott_command:
  type: command
  name: ott
  description: One-Time-Teleport, available for 2 hours after the player first joins the server.
  usage: /ott [player]
  script:
    - if <context.args.size> >= 1:
      - if <context.args.get[1]> == accept:
        - if <player.flag[ott_request]||null> != null:
          - if <player.flag[ott_request].as_player.is_online>:
            - teleport <player.flag[ott_request].as_player> <player.location>
            - flag <player.flag[ott_request].as_player> ott:!
            - flag <player> ott_request:!
            - yaml id:player.<player.flag[ott_request].as_player.uuid> set teleports_used.ott:++
          - else:
            - narrate "<&c>This player is no longer online."
        - else:
          - narrate "<&c>You have no pending teleport requests."
      - else if <server.match_player[<context.args.get[1]>]||null> != null:
        - if <player.flag[ott]||null> != null:
          - flag <server.match_player[<context.args.get[1]>]> ott_request:<player>
          - narrate "<&6>You have requested to teleport to <context.args.get[1]>."
          - narrate player:<server.match_player[<context.args.get[1]>]> "<&b><player.name> <&6>has requested to teleport to you. Click <&click[/ott accept]><&a><&l>ACCEPT<&end_click> <&r><&6> to accept the request."
        - else:
          - narrate "<&c>You can only use this command once, within 2 hours of when you first joined."
      - else:
        - narrate "<&c>Player not found."
    - else:
      - narrate "<&a>|----------------| <&b>One Time Teleport<&a> |-------------------|"
      - narrate "<&6>One-Time-Teleport is a perk given to players when they first join, and lasts for 2 hours."
      - narrate "<&6>It allows you to teleport to a player of your choice within those 2 hours. When you teleport, you won't be able to use OTT again."
      - narrate "<&a>|----------------------------------------------------|"

rp_command:
  type: command
  name: rp
  description: Immediately sets your current Resource Pack to the servers resources.
  usage: /rp
  aliases: resourcepack
  script:
  # The resource pack line.
    - define rp_url <server.flag[resourcepackurl]||https://download.nodecdn.net/containers/nodecraft/minepack/84f6509bd461ef7d8888c475abd1a69c.zip>
    - if <context.args.size> >= 1:
      - narrate "<&c>Simply type <&a>/rp<&c>"
    - else:
      - adjust <player> resource_pack:<[rp_url]>

player_setup:
  type: task
  script:
    - yaml create id:player.<player.uuid>
    - if <inventory[equipment_<player.uuid>]||null> == null:
      - note <inventory[equipment_character]> as:equipment_<player.uuid>
    - yaml id:player.<player.uuid> set teleports_used.ott:0
    - yaml id:player.<player.uuid> set values.kills:0
    - yaml id:player.<player.uuid> set values.deaths:0
    - yaml id:player.<player.uuid> set values.damage_to_players:0
    - yaml id:player.<player.uuid> set pvp.damage_notifier:bossbar
    - yaml id:player.<player.uuid> set pvp.effect_notifier:chat
    - yaml id:player.<player.uuid> set pvp.damage_flash:both
    - yaml id:player.<player.uuid> set pvp.power_flash:both
    - yaml id:player.<player.uuid> set social.facebook:None
    - yaml id:player.<player.uuid> set social.instagram:None
    - yaml id:player.<player.uuid> set social.twitter:None
    - yaml id:player.<player.uuid> set social.twitch:None
    - yaml id:player.<player.uuid> set social.discord:None
    - yaml id:player.<player.uuid> set stats.health.current:20
    - yaml id:player.<player.uuid> set stats.health.max:20
    - yaml id:player.<player.uuid> set stats.power.current:20
    - yaml id:player.<player.uuid> set stats.power.max:20
    - yaml id:player.<player.uuid> set stats.food.max:100
    - yaml id:player.<player.uuid> set stats.food.current:100
    - yaml id:player.<player.uuid> set stats.thirst.max:100
    - yaml id:player.<player.uuid> set stats.thirst.current:100
    - yaml id:player.<player.uuid> set stats.weight.current:0
    - yaml id:player.<player.uuid> set stats.weight.max:320
    - yaml id:player.<player.uuid> set stats.constitution:0
    - yaml id:player.<player.uuid> set stats.melee_damage:100
    - yaml id:player.<player.uuid> set stats.speed:100
    - yaml id:player.<player.uuid> set stats.temperature:100
    # DO NOT CHANCE THESE VALUES
    - yaml id:player.<player.uuid> set stats.xp:0
    - yaml id:player.<player.uuid> set stats.level:1
    - yaml id:player.<player.uuid> set stats.stat_points:10
    - yaml id:player.<player.uuid> set stats.experience_multiplier:100
    - yaml id:player.<player.uuid> set stats.drop_rate_multiplier:100
    - yaml id:player.<player.uuid> set stats.equipment_rating:0
    - yaml id:player.<player.uuid> set stats.encumberance:0
    - yaml id:player.<player.uuid> set lessons.current:10
    - yaml id:player.<player.uuid> set lessons.lifetime:0
    - foreach <script[abilitytrees].list_keys[trees]>:
      - if <server.has_flag[testing_mode]>:
        - yaml id:player.<player.uuid> set skills.<[value]>.current:1000
      - else:
        - yaml id:player.<player.uuid> set skills.<[value]>.current:1

equipt_command:
  type: command
  name: equipt
  permission: equipt
  script:
  - inject system_equipment_set

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

custom_item_override:
  type: world
  debug: false
  events:
    on player consumes item:
      - if <context.item.script.yaml_key[on_consume]||null> != null:
        - run <context.item.script.name> path:on_consume
    on player places block:
      - stop
      - if <context.item_in_hand.script.name||null> != null:
        - if <context.material.is_block>:
          - if <item[<context.item_in_hand.script.name.replace[custom_].with[]>]||null> == null:
            - yaml create id:<context.location.simple>
            - yaml savefile:DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/<context.item_in_hand.script.name>.yml id:<context.location.simple>
            - yaml unload id:<context.location.simple>
    on player breaks block:
      - stop
      - if <server.list_files[DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/].get[1]||null> != null:
        - define item:<item[<server.list_files[DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/].get[1].replace[.yml].with[]>]>
        - adjust server delete_file:DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/<server.list_files[DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/].get[1]>
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<proc[fake_durability_use].context[<player.item_in_hand>]>
        - if <[item].material> == <context.material>:
          - determine <[item]>
        - else:
          - determine NOTHING
    on entity death:
      - foreach <context.drops||<list[]>> as:item:
        - if <[item].material.name> != air && <[item].script.name||null> == null:
          - inject build_item
          - define drops:|:<item[custom_<[item].material.name>].with[quantity=<[item].quantity>]||<[item]>>
      - determine <[drops]||<list[]>>
    on item recipe formed:
      - if !<context.inventory.script_name.starts_with[recipe_book_]||false>:
        - if <yaml[server.recipe_fixer].read[restricted.shaped.<context.recipe.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item||null> != null:
          - define item:<yaml[server.recipe_fixer].read[restricted.shaped.<context.recipe.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shaped.<context.recipe.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].split[:].get[2]>]>
          - inject build_item
          - determine <[item]>
        - if <yaml[server.recipe_fixer].read[restricted.shapeless.<context.recipe.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item||null> != null:
          - define item:<yaml[server.recipe_fixer].read[restricted.shapeless.<context.recipe.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shapeless.<context.recipe.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].split[:].get[2]>]>
          - inject build_item
          - determine <[item]>
        - if <context.inventory.result.script.name||null> == null && <context.inventory.result||null> != null:
          - foreach <context.inventory.matrix> as:input_item:
            - if !<server.list_material_types.parse[name].contains[<[input_item].script.name.replace[custom_].with[]||null>]> && <[input_item].material.name> != air:
              - determine passively cancelled
    on furnace smelts item:
      - define item:<context.result_item>
      - if <yaml[server.recipe_fixer].read[restricted.furnace.<context.source_item.script.name>]||null> != null:
        - define item:<yaml[server.recipe_fixer].read[restricted.furnace.<context.source_item.script.name>].split[:].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.furnace.<context.source_item.script.name>].split[:].get[2]>]>
      #- announce <yaml[server.recipe_fixer].read[restricted.furnace.<context.source_item.script.name>].split[:].get[1]||null>
      #- announce <context.location.inventory.result.script.name||null>
      #- adjust <context.location.inventory> input:<item[<context.source_item.script.name||<context.source_item.material.name>>].with[quantity=<context.source_item.quantity.sub[1]>]>
      - inject build_item
      - determine <[item]>
    on player picks up item:
      - if <context.item.script.name||null> == null || !<context.item.nbt[built]||false>:
        - define item:<context.item>
        - inject build_item
        - determine ITEM:<[item]>
    on player clicks in inventory:
      - if !<context.inventory.script_name.starts_with[recipe_book_]||false>:
        - if <context.slot> != -998:
          - if !<context.cursor_item.has_nbt[built]> && <context.cursor_item.material.name> != air:
            - define item:<context.cursor_item>
            - inject build_item
            - wait 1t
            - if <player.open_inventory.matrix||null> == null:
              - if <context.raw_slot> > <player.open_inventory.size>:
                - inventory set d:<player.inventory> slot:<context.slot> o:<[item].with[quantity=<player.inventory.slot[<context.slot>].quantity>]>
              - else:
                - inventory set d:<player.open_inventory> slot:<context.raw_slot> o:<[item].with[quantity=<player.open_inventory.slot[<context.slot>].quantity>]>
            - else if <player.open_inventory.matrix.size> == 4:
              - inventory set d:<player.inventory> slot:<context.slot> o:<[item].with[quantity=<player.inventory.slot[<context.slot>].quantity>]>
            - else if <player.open_inventory.matrix.size> == 9:
              - if <context.raw_slot> > 10:
                - inventory set d:<player.inventory> slot:<context.slot> o:<[item].with[quantity=<player.inventory.slot[<context.slot>].quantity>]>
              - else:
                - inventory set d:<player.open_inventory> slot:<context.raw_slot> o:<[item].with[quantity=<player.open_inventory.slot[<context.slot>].quantity>]>
          - if <player.open_inventory.inventory_type> == workbench:
            - wait 1t
            - if <yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item||null> != null:
              - define item:<yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].split[:].get[2]>]>
              - inject build_item
              - adjust <player.open_inventory> result:<[item]>
            - if <yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item||null> != null:
              - define item:<yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].split[:].get[2]>]>
              - inject build_item
              - adjust <player.open_inventory> result:<[item]>
          - if <player.open_inventory.inventory_type> == furnace:
            # this might be needed later
            - define item:<yaml[server.recipe_fixer].read[restricted.furnace.<context.item.script.name.to_lowercase||null>]||<context.item>>
            #- narrate <[item]>
            - stop
            - adjust <player.open_inventory.location> furnace_cook_time:200
            - adjust <player.open_inventory.location> furnace_cook_time_total:400
    on player drags in inventory:
      - if <player.open_inventory.inventory_type> == workbench:
        - wait 1t
        - if <yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item||null> != null:
          - define item:<yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shaped.<player.open_inventory.matrix.parse[script.name.to_lowercase||air].separated_by[_]>].get[1].split[:].get[2]>]>
          - inject build_item
          - adjust <player.open_inventory> result:<[item]>
        - if <yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item||null> != null:
          - define item:<yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].as_item.with[quantity=<yaml[server.recipe_fixer].read[restricted.shapeless.<player.open_inventory.matrix.parse[script.name.to_lowercase].filter[is[!=].to[null]].separated_by[_]>].get[1].split[:].get[2]>]>
          - inject build_item
          - adjust <player.open_inventory> result:<[item]>
    on player places block:
      - if !<context.item_in_hand.script.yaml_key[placable]||true>:
        - determine cancelled
      - if <context.location.world.name> != tor_mainland && !<player.has_permission[place]>:
        - determine cancelled
    on player breaks block:
      - if <context.location.world.name> != tor_mainland && !<player.has_permission[break]>:
        - determine cancelled
    on entity damages entity:
      - if <context.entity.type> == player && <context.damager.type> == player:
        - if <context.entity.location.world.name> != tor_mainland:
          - determine passively cancelled
    on entity damaged by suffocation:
      - if <context.entity.location.world.name> != tor_mainland:
        - determine passively cancelled
    on entity damaged by fall:
      - if <context.entity.location.world.name> != tor_mainland:
        - determine passively cancelled

system_override:
  type: world
  debug: false
  events:
    on player chats:
      - define msg <context.message>
      - if <[msg].contains_text[<&lb>item<&rb>]>:
        - define msg <[msg].replace[<&lb>item<&rb>].with[<element[<player.item_in_hand.display>].on_hover[<player.item_in_hand>].type[SHOW_ITEM]>]>
      - determine <[msg]>
    on player kicked for flying:
      - if <player.has_permission[kicked_for_flying_bypass]>:
        - determine cancelled
    on entity spawns:
      - if <context.location.world.name> == spawn && <context.entity.script.name||null> == null:
        - determine cancelled
    on player right clicks entity BUKKIT_PRIORITY:LOWEST:
      - if <context.entity.script.yaml_key[custom.interactable]||false>:
        - determine cancelled
    on delta time secondly:
      - if !<server.list_online_players.filter[food_level.is[==].to[20]].is_empty>:
        - foreach <server.list_online_players.filter[food_level.is[==].to[20]]>:
          - adjust <[value]> food_level:19
    on player first login:
      - flag <player> ott:1 duration:2h
    on player joins:
      - define rp_url <server.flag[resourcepackurl]||https://download.nodecdn.net/containers/nodecraft/minepack/84f6509bd461ef7d8888c475abd1a69c.zip>
      - wait 60t
      - adjust <player> resource_pack:<[rp_url]>
      - stop
      - adjust <player> quietly_discover_recipe:<server.list_recipe_ids>
      - adjust <player> resend_discovered_recipes
    on resource pack status:
      - if <context.status> == FAILED_DOWNLOAD:
        - narrate "<&6>Please accept the resource pack."
        - narrate "<&6>While our server is playable without it, it makes more sense when you have the resource pack enabled."
        - narrate "<&6>If your download failed, click <element[<&l><&rb>HERE<&lb>].on_click[/rp]>"
      - else if <context.status> == DECLINED:
        - narrate "<&6>Please accept the resource pack."
        - narrate "<&6>While our server is playable without it, it makes more sense when you have the resource pack enabled."
        - if !<player.has_permission[bypass_resourcepack]>:
          - kick <player> "reason:<&c>The resource pack is needed in order to play.<&nl>Please enable resource packs in your server list by following these instructions<&nl><&nl><&a>Click on our server, and select <&b>Edit <&a>on the bottom of the screen.<&nl><&a>click <&b>Server Resource Packs<&co> <&a>option until <&b>enabled<&a> is displayed.<&nl><&a>Then get back in on the action!"
      - else if <context.status> == SUCCESSFULLY_LOADED:
        - narrate "<&6>Resource pack successfully loaded"
      - else if <context.status> == ACCEPTED:
        - narrate "<&6>Thank you for using our resource pack."
        - narrate "<&6>If you are enjoying the server then remember to vote with <&click[/vote]><&a><&l>/vote<&end_click><&6>!"
      - else:
        - narrate to_ops "<&c>Something borked with <&a><player><&c> loading the resource pack! <&4>STATUS<&co><&b> <context.status>"
    on shutdown:
      - foreach <yaml.list>:
        - if <[value].starts_with[player.]>:
          - yaml savefile:data/globalData/players/<server.flag[server.name]>/<[value].substring[8]>.yml id:<[value]>
    on player quit priority:2000 bukkit_priority:HIGHEST:
      - yaml id:player.<player.uuid> savefile:data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml
      - yaml id:player.<player.uuid> unload
    on player logs in priority:-2000 bukkit_priority:LOWEST:
      - if <server.has_file[data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml]>:
        - yaml load:data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml id:player.<player.uuid>
      - else:
        - yaml create id:player.<player.uuid>
    on player respawns:
      - flag <player> contaminated:!
      - if !<context.is_bed_spawn>:
        - determine <location[spawn]>
      - wait 1t
      - inject system_equipment_set
    on player drags in inventory:
      - if <player.open_inventory> == <player.inventory>:
        - foreach <context.raw_slots>:
          - if <[value]> < 6:
            - determine cancelled
    on player clicks in inventory:
      - if <player.open_inventory> == <player.inventory>:
        - if <context.slot> == 39:
          - determine passively cancelled
          - wait 1t
          - if <inventory[equipment_<player.uuid>]||null> == null:
            - note <inventory[equipment_character]> as:equipment_<player.uuid>
          - inventory open d:<inventory[equipment_<player.uuid>]>
        - if <context.raw_slot> < 6 && <context.raw_slot> > -1:
          - define slotmap:<list[1/in@workbench[holder=<player>]|2/recipe_book_inventory|3/guilds|4/citadels|5/settings]>
          - if <context.cursor_item.quantity> != 0:
            - determine passively cancelled
            - wait 1t
            - inventory open d:in@workbench[holder=<player>]
            - stop
          - determine passively cancelled
          - if <[slotmap].map_get[<context.raw_slot>]||null> == guilds:
            - if <player.has_flag[guild]>:
              - inventory open d:my_guild_gui
            - else:
              - narrate "<&b>Talk to the guild master at spawn to create a guild."
            - stop
          - if <inventory[<[slotmap].map_get[<context.raw_slot>]||null>]||null> != null:
            - inventory open d:<inventory[<[slotmap].map_get[<context.raw_slot>]>]>
      - if <context.item.script.yaml_key[GUI_Inventory]||null> != null:
        - determine passively cancelled
        - wait 1t
        - inventory open d:<context.item.script.yaml_key[GUI_Inventory].parsed>
    on player clicks block:
      - if <context.item.script.yaml_key[category]||null> == nodestone && <player.is_sneaking>:
        - define item:<context.item.with[nbt=saved_location/<player.location.center>]>
        - inject build_item
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<[item]>
        - determine passively cancelled

kill_queue_command:
  type: command
  name: kill_queue
  tab complete:
  - foreach <yaml[server.executable_scripts].read[scripts].filter[to_lowercase.starts_with[<context.args.get[1].to_lowercase||null>]]||<list[]>>:
    - define list:|:<[value]>
  - determine <[list]||<yaml[server.executable_scripts].read[scripts]>>
  permission: kill_queue
  script:
    - foreach <script[<context.args.get[1]>].list_queues>:
      - queue <[value]> stop

player_setup_command:
  type: command
  name: player_setup
  permission: player_setup
  tab complete:
  - determine <server.list_online_players.filter[name.to_lowercase.starts_with[<context.args.get[1].to_lowercase>]]>
  script:
  - adjust <queue> linked_player:<server.match_player[<context.args.get[1]>]||<player>>
  - inject player_setup

player_reset_command:
  type: command
  name: player_reset
  permission: player_reset
  script:
  - adjust <queue> linked_player:<server.match_player[<context.args.get[1]>]||<player>>
  - kick <player> reason:Standby<&sp>while<&sp>we<&sp>reset<&sp>your<&sp>player<&sp>data.
  - yaml id:player.<player.uuid> unload
  - adjust server delete_file:data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml

resend_recipes_command:
  type: command
  name: resend_recipes
  permission: resend_recipes
  script:
  - foreach <server.list_online_players> as:player:
    - adjust <[player]> quietly_discover_recipe:<server.list_recipe_ids>
    - adjust <[player]> resend_discovered_recipes

build_item_command:
  type: command
  name: build_item
  script:
    - define item:<player.item_in_hand>
    - if <[item].material.name> == air:
      - narrate "You're not holding anything."
      - stop
    - inject build_item
    - inventory set d:<player.inventory> o:<[item]> slot:<player.held_item_slot>
    - narrate "Done"

build_item:
  type: task
  definitions: item
  script:
  - if <[item].material.name||air> != air:
    - define old_item:<[item]>
    - if <[item].script||null> == null:
      - define item:<item[custom_<[item].material.name>]>
      - adjust def:item quantity:<[old_item].quantity>
      - if <[old_item].potion_base||null> != null:
        - define upgraded:true
        - if <[old_item].potion_base.split[,].get[2]> == 1:
          - define upgraded:false
        - adjust def:item potion_effects:<[old_item].potion_base.split[,].get[1]>,<[upgraded]>,<[old_item].potion_base.split[,].get[3]>
      - if <[old_item].custom_model_data||null> != null:
        - adjust def:item custom_model_data:<[old_item].custom_model_data>
      - if <[old_item].nbt||null> != null:
        - adjust def:item nbt:<[old_item].nbt>
      - if <[old_item].enchantments||null> != null:
        - adjust def:item enchantments:<[old_item].enchantments.with_levels>
      - if <[old_item].nbt_attributes||null> != null:
        - adjust def:item nbt_attributes:<[old_item].nbt_attributes>
      - if <[old_item].patterns||null> != null:
        - adjust def:item patterns:<[old_item].patterns>
      - if <[old_item].base_color||null> != null:
        - adjust def:item base_color:<[old_item].base_color>
      - if <[old_item].book||null> != null:
        - adjust def:item book:<[old_item].book>
      - if <[old_item].has_inventory>:
        - adjust def:item inventory:<[old_item].inventory>
      - if <[old_item].skin||null> != null:
        - adjust def:item skull_skin:<[old_item].skin.full>
        - if <[item].script.name> == custom_player_head:
          - adjust def:item display_name:<&r><&e><[old_item].skin.as_player.name>'s<&sp>Head
      - if <[old_item].display||null> != null:
        - adjust def:item display_name:<[old_item].display>
    - if <[item].script.yaml_key[category]||null> != null:
      - if <[item].script.yaml_key[category]> == ability:
        - define ability:<[old_item].nbt[skillname]>
        - define "lore:<&e>-------------------------"
        - define "lore:|:<&b><script[ability_<[ability]>].yaml_key[description]>"
        - if <script[ability_<[ability]>].yaml_key[ability_type]> == command:
          - define "lore:|:<&a>Usage<&co> <&e>/<script[ability_<[ability]>].yaml_key[command_usage]>"
        - else if <script[ability_<[ability]>].yaml_key[usage]||null> != null:
          - define "lore:|:<&a>Usage<&co> <&e><script[ability_<[ability]>].yaml_key[usage]>"
        - define "lore:|:<&c>Power Cost<&co> <script[ability_<[ability]>].yaml_key[power_cost]>"
        - define "lore:|:<&e>-------------------------"
      - if <[item].script.yaml_key[category]> == nodestone:
        - adjust def:item nbt:teleport_charges/<[item].nbt[teleport_charges]||<[item].script.yaml_key[teleport_charges]>>
        - define "lore:|:<&b><[item].nbt[teleport_charges]> Charges"
        - if <[item].nbt[saved_location]||null> != null:
          - define "lore:|:<&b>Saved Location: <[item].nbt[saved_location].as_location.x.round>X, <[item].nbt[saved_location].as_location.y.round>Y, <[item].nbt[saved_location].as_location.z.round>Z"
        - define "lore:|:<&b>"
        - define "lore:|:<&b>Shift Click while holding to store your current location"
        - define "lore:|:<&b>Activate a teleport ability with the nodestone in your"
        - define "lore:|:<&b>inventory to teleport to that location."
      - if <[item].script.yaml_key[category]> == fishing_rod:
        - define lore:|:<&6><&l><&m>-------------<&r><&6><&sp><&sp>Fishing<&sp>Rod<&sp><&sp><&l><&m>-------------
        - define lore:|:<[item].script.yaml_key[lore].as_list.parse[parsed]||<list[]>>
        - define lore:|:<&6>
        - define lore:|:<&6>Rarity<&b><&co><&6><&sp><[item].script.yaml_key[rod_rarity]>
        - define lore:|:<&6>
        - if <[item].script.yaml_key[rod_upgrade_slots]||null> != null:
          - if <[item].script.yaml_key[rod_upgrade_slots].mul[1]> == <[item].script.yaml_key[rod_upgrade_slots]>:
            - define lore:|:<&6><&l><&m>-------------<&r><&6><&sp><&sp><&sp>Upgrades<&sp><&sp><&sp><&sp><&l><&m>-------------
            - repeat <[item].script.yaml_key[rod_upgrade_slots]>:
              - define lore:|:<&b>Slot:<&sp>[<&sp>]
        - define lore:|:<&6><&l><&m>--------------<&r><&6><&sp><&sp><&sp><&sp><&sp>Bait<&sp><&sp><&sp><&sp><&sp><&sp><&l><&m>--------------
        - define lore:|:<&b>Right<&sp>click<&sp>to<&sp>remove<&sp>the<&sp>bait
        - define lore:|:<&6>Baited<&sp>with:<&sp><&7><[item].nbt[baited].as_script.yaml_key[display<&sp>name].parsed||<el@Nothing>>
      - else:
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
        - define lore:|:<[item].script.yaml_key[lore].as_list.parse[parsed]||<list[]>>
        - define stat_names:<list[boss_damage/Boss<&sp>Damage|ore_drops/Ore<&sp>Drops|thirst/Thirst|constitution/Constitution|melee_damage/Damage|drop_rate_multiplier/Drop<&sp>Rate|health/Health|weight/Weights|experience_multiplier/Experience|power/Power|speed/Movement<&sp>Speed|food/Food]>
        - if <[item].script.list_keys[equipment_modifiers]||null> != null || <[item].script.list_keys[damage_modifiers.damage_resistance]||null> != null || <[item].script.list_keys[damage_modifiers.damage_dealt]||null> != null:
          - define lore:|:<&f>
          - define lore:|:<&7>When<&sp>equipped<&co>
        - if <[item].script.list_keys[equipment_modifiers]||null> != null:
          - foreach <[item].script.list_keys[equipment_modifiers]> as:modifier:
            - define value:<[item].nbt[base_stats.<[modifier]>]||<[item].script.yaml_key[equipment_modifiers.<[modifier]>]>>
            - if <[item].nbt[base_stats.<[modifier]>]||null> == null:
              - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]||null> != null:
                - if <[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]||null> != null:
                  - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.max]>]>
                  - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.int[<[item].script.yaml_key[equipment_modifiers.<[modifier]>.min]>].to[<[value]>]>
            - adjust def:item nbt:base_stats.<[modifier]>/<[value]>
            - define stats:|:<[modifier]>/<[value]>
            - define modifiers:|:<[modifier]>
            - if <[value]> > 0:
              - if <list[speed|melee_damage|drop_rate_multiplier|ore_drops|experience_multiplier].contains[<[modifier]>]>:
                - define lore:|:<&9>+<[value]>%<&sp><[stat_names].map_get[<[modifier]>]>
              - else:
                - define lore:|:<&9>+<[value]><&sp><[stat_names].map_get[<[modifier]>]>
            - else:
              - if <list[speed|melee_damage|drop_rate_multiplier|ore_drops|experience_multiplier].contains[<[modifier]>]>:
                - define lore:|:<&c><[value]>%<&sp><[stat_names].map_get[<[modifier]>]>
              - else:
                - define lore:|:<&c><[value]><&sp><[stat_names].map_get[<[modifier]>]>
        - if <[item].script.list_keys[damage_modifiers.damage_resistance]||null> != null:
          - foreach <[item].script.list_keys[damage_modifiers.damage_resistance]> as:modifier:
            - define value:<[item].nbt[damage_modifiers.damage_resistance.<[modifier]>]||<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>]>>
            - if <[item].nbt[damage_modifiers.damage_resistance.<[modifier]>]||null> == null:
              - if <[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.max]||null> != null:
                - if <[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]||null> != null:
                  - narrate <[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]>
                  - narrate <[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.max]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]>].to[<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.max]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_resistance.<[modifier]>.min]>].to[<[value]>]>
            - adjust def:item nbt:base_stats.<[modifier]>/<[value]>
            - define stats:|:<[modifier]>/<[value]>
            - define modifiers:|:<[modifier]>
            - if <[value]> > 0:
              - define lore:|:<&9>+<[value].mul[100].round[1]>%<&sp><[modifier].to_titlecase><&sp>Damage<&sp>Resistance
            - else:
              - define lore:|:<&c><[value].mul[100].round[1]>%<&sp><[modifier].to_titlecase><&sp>Damage<&sp>Resistance
        - if <[item].script.list_keys[damage_modifiers.damage_dealt]||null> != null:
          - foreach <[item].script.list_keys[damage_modifiers.damage_dealt]> as:modifier:
            - define value:<[item].nbt[damage_modifiers.damage_dealt.<[modifier]>]||<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>]>>
            - if <[item].nbt[damage_modifiers.damage_dealt.<[modifier]>]||null> == null:
              - if <[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.max]||null> != null:
                - if <[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]||null> != null:
                  - narrate <[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]>
                  - narrate <[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.max]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]>].to[<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.max]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]>].to[<[value]>]>
                  - define value:<util.random.decimal[<[item].script.yaml_key[damage_modifiers.damage_dealt.<[modifier]>.min]>].to[<[value]>]>
            - adjust def:item nbt:base_stats.<[modifier]>/<[value]>
            - define stats:|:<[modifier]>/<[value]>
            - define modifiers:|:<[modifier]>
            - if <[value]> > 0:
              - define lore:|:<&9>+<[value].mul[100].round[1]>%<&sp><[modifier].to_titlecase><&sp>Damage<&sp>Dealt
            - else:
              - define lore:|:<&c><[value].mul[100].round[1]>%<&sp><[modifier].to_titlecase><&sp>Damage<&sp>Dealt
        - adjust def:item flags:HIDE_ATTRIBUTES
        - if <[item].script.yaml_key[armor]||null> != null:
          - adjust def:item nbt_attributes:generic.armor/chest/0/<[item].script.yaml_key[armor]>
          - adjust def:item lore:|:<&9>+<[item].script.yaml_key[armor]><&sp>Armor
      - if <[item].script.yaml_key[damage]||null> != null:
        - adjust def:item nbt_attributes:generic.attackDamage/hand/0/<[item].script.yaml_key[damage]>
      - if <[item].script.yaml_key[attack_speed]||null> != null:
        - adjust def:item nbt_attributes:generic.attackSpeed/hand/0/<[item].script.yaml_key[attack_speed]>
      - if <[item].script.yaml_key[fake_durability]||null> != null:
        - define lore:|:<&f>Durability:<&sp><[item].nbt[durability]||<[item].script.yaml_key[fake_durability]>><&sp>/<&sp><[item].script.yaml_key[fake_durability]>
      - if <[item].script.yaml_key[contaminated]||null> != null:
        - adjust def:item nbt:contaminated/<[item].script.yaml_key[contaminated]>
      - if <[item].script.yaml_key[category]||null> != ability:
        - define lore:|:<&8>
        - define lore:|:<&8>Item<&sp>Weight:<&sp><[item].script.yaml_key[weight]||1>
    - else:
      - define lore:|:<[item].script.yaml_key[lore].as_list.parse[parsed]||<list[]>>
    - define lore:<[lore].parse[parsed]>
    - adjust def:item nbt:built/true
    - adjust def:item lore:<[lore]>
