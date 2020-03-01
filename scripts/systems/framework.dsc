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
      - yaml create id:server.executable_scripts
      - yaml create id:server.skills_by_level
      - yaml create id:server.equipment
      - yaml create id:server.ore_rates
      - yaml create id:server.smeltery_recipes
      - yaml load:data/skill_trees.yml id:server.skill_trees
      - foreach <server.list_scripts>:
          - if <[value].yaml_key[script]||<[value].yaml_key[events]||null>> != null:
            - yaml id:server.executable_scripts set scripts:|:<[value].name>
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
          - narrate player:<server.match_player[<context.args.get[1]>]> "<&b><player.name> <&6>has requested to teleport to you. Click <&click[/ott accept]><&a>ACCEPT<&end_click> <&r><&6 to accept the request.>"
        - else:
          - narrate "<&c>You can only use this command once, within 2 hours of when you first joined."
      - else:
        - narrate "<&c>Player not found."
    - else:
      - narrate "<&a>|--------------------------| <&b>One Time Teleport<&a> |------------------------------|"
      - narrate "<&6>One-Time-Teleport is a perk given to players when they first join, and lasts for 2 hours."
      - narrate "<&6>It allows you to teleport to a player of your choice within those 2 hours. When you teleport, you won't be able to use OTT again."
      - narrate "<&a>|-----------------------------------------------------------------------------|"

rp_command:
  type: command
  name: rp
  description: Immediately sets your current Resource Pack to the servers resources.
  usage: /rp
  aliases: resourcepack
  script:
  # The resource pack line.
    - define rp_url https://download.nodecdn.net/containers/nodecraft/minepack/ae75998c4b6ccf5280b745b5da4a0c16.zip
    - if <context.args.size> >= 1:
      - narrate "<&c>Simply type <&a>/rp<&c>"
    - else:
      - adjust <player> resource_pack:<[rp_url]>


player_setup:
  type: task
  script:
    - yaml create id:player.<player.uuid>
    - yaml id:player.<player.uuid> set teleports_used.ott:0
    - yaml id:player.<player.uuid> set values.kills:0
    - yaml id:player.<player.uuid> set values.deaths:0
    - yaml id:player.<player.uuid> set values.damage_to_players:0
    - yaml id:player.<player.uuid> set stats.health.current:20
    - yaml id:player.<player.uuid> set stats.health.max:20
    - yaml id:player.<player.uuid> set stats.power.current:20
    - yaml id:player.<player.uuid> set stats.power.max:20
    - yaml id:player.<player.uuid> set stats.food.max:100
    - yaml id:player.<player.uuid> set stats.food.current:100
    - yaml id:player.<player.uuid> set stats.thirst.max:100
    - yaml id:player.<player.uuid> set stats.thirst.current:100
    - yaml id:player.<player.uuid> set stats.weight.current:0
    - yaml id:player.<player.uuid> set stats.weight.max:100
    - yaml id:player.<player.uuid> set stats.constitution:0
    - yaml id:player.<player.uuid> set stats.melee_damage:100
    - yaml id:player.<player.uuid> set stats.speed:100
    - yaml id:player.<player.uuid> set stats.temperature:100
    - yaml id:player.<player.uuid> set stats.xp:0
    - yaml id:player.<player.uuid> set stats.level:1
    - yaml id:player.<player.uuid> set stats.stat_points:1000
    - yaml id:player.<player.uuid> set stats.experience_multiplier:100
    - yaml id:player.<player.uuid> set stats.drop_rate_multiplier:100
    - yaml id:player.<player.uuid> set stats.equipment_rating:0
    - yaml id:player.<player.uuid> set lessons.current:1000
    - yaml id:player.<player.uuid> set lessons.lifetime:0
    - foreach <script[abilitytrees].list_keys[trees]>:
      - yaml id:player.<player.uuid> set skills.<[value]>.current:100

system_equipment_set:
  type: task
  script:
    - equip head:<item[equipment_head_slot]> chest:<item[equipment_chest_slot]> legs:<item[equipment_leg_slot]> boots:<item[equipment_boots_slot]>

system_override:
  type: world
  events:
    on item recipe formed:
      - if <context.item.script.name||null> == null:
        - determine <item[custom_<context.item.material>]>
    on player first login:
      - flag <player> ott:1 duration:2h
    on player joins:
      - define rp_url https://download.nodecdn.net/containers/nodecraft/minepack/ae75998c4b6ccf5280b745b5da4a0c16.zip
      - wait 60t
      - adjust <player> resource_pack:<[rp_url]>
    on resource pack status:
      - if <context.status> == FAILED_DOWNLOAD:
        - narrate "<&6>Please accept the resource pack."
        - narrate "<&6>While our server is playable without it, it makes more sense when you have the resource pack enabled."
        - narrate "<&6>If your download failed, click <&click[/rp]><&7>[HERE]<&end_click>"
      - else if <context.status> == DECLINED:
        - narrate "<&6>Please accept the resource pack."
        - narrate "<&6>While our server is playable without it, it makes more sense when you have the resource pack enabled."
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
    on player logs in priority:-2000 bukkit_priority:LOWEST:
      - if <server.has_file[data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml]>:
        - yaml load:data/globalData/players/<server.flag[server.name]>/<player.uuid>.yml id:player.<player.uuid>
      - else:
        - yaml create id:player.<player.uuid>
    on player breaks block priority:-10:
      - if <player.gamemode> == SURVIVAL:
        - foreach <context.location.drops[<player.item_in_hand>]> as:drop:
          - define drops:|:<item[custom_<[drop].material.name>]>
        - determine <[drops]>
    on player respawns:
      - inject system_equipment_set
    on player drags in inventory:
      - if <player.open_inventory> == <player.inventory>:
        - foreach <context.raw_slots>:
          - if <[value]> < 6:
            - determine cancelled
    on player clicks in inventory:
      - if <player.open_inventory> == <player.inventory>:
        - if <context.raw_slot> < 6:
          - determine passively cancelled
          - define slotmap:<list[1/crafting|2/recipe_book_inventory|3/citadels|4/guilds|5/settings]>
          - if <[slotmap].map_get[<context.raw_slot>]||null> == guilds:
            - if <yaml[player.<player.uuid>].read[guild]||null> != null:
              - inventory open d:my_guild_gui
            - else:
              - inventory open d:new_guild_gui
            - stop
          - if <inventory[<[slotmap].map_get[<context.raw_slot>]||null>]||null> != null:
            - inventory open d:<inventory[<[slotmap].map_get[<context.raw_slot>]>]>
      - if <context.item.script.yaml_key[GUI_Inventory]||null> != null:
        - determine passively cancelled
        - wait 1t
        - inventory open d:<context.item.script.yaml_key[GUI_Inventory]>
    on player chats:
      - if <player.has_permission[*]>:
        - if <player.flag[parsed_chat]||null> != null:
          - determine <context.message.parsed>

kill_queue_command:
  type: command
  name: kill_queue
  tab complete:
  - foreach <yaml[server.executable_scripts].read[scripts].filter[to_lowercase.starts_with[<context.args.get[1].to_lowercase>]]>:
    - define list:|:<[value]>
  - determine <[list]>
  script:
  - if <player.permission[*]>:
    - foreach <script[<context.args.get[1]>].list_queues>:
      - queue <[value]> stop

player_setup_command:
  type: command
  name: player_setup
  description: player_setup
  usage: /player_setup
  tab complete:
  - determine <server.list_online_players.filter[name.to_lowercase.starts_with[<context.args.get[1].to_lowercase>]]>
  script:
  - adjust <queue> linked_player:<server.match_player[<context.args.get[1]>]||<player>>
  - inject player_setup

player_reset_command:
  type: command
  name: player_reset
  description: player_reset
  usage: /player_reset
  script:
  - kick <player> reason:Standby<&sp>while<&sp>we<&sp>reset<&sp>your<&sp>player<&sp>data.
  - yaml id:player.<player.uuid> unload

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