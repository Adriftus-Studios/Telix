stats_setup:
  type: task
  script:
    - yaml id:player.<player.uuid> set stats.health.current:20
    - yaml id:player.<player.uuid> set stats.health.max:20
    - yaml id:player.<player.uuid> set stats.power.current:20
    - yaml id:player.<player.uuid> set stats.power.max:20
    - yaml id:player.<player.uuid> set stats.food.max:100
    - yaml id:player.<player.uuid> set stats.food.current:100
    - yaml id:player.<player.uuid> set stats.thirst.max:100
    - yaml id:player.<player.uuid> set stats.thirst.current:100
    - yaml id:player.<player.uuid> set stats.constitution:0
    - yaml id:player.<player.uuid> set stats.weight.current:0
    - yaml id:player.<player.uuid> set stats.weight.max:100
    - yaml id:player.<player.uuid> set stats.melee_damage:100
    - yaml id:player.<player.uuid> set stats.speed:100
    - yaml id:player.<player.uuid> set stats.temperature:100
    - yaml id:player.<player.uuid> set stats.basespeed:0.22
    - yaml id:player.<player.uuid> set stats.xp:0
    - yaml id:player.<player.uuid> set stats.level:0
    - yaml id:player.<player.uuid> set stats.experience_increase:0
    - yaml id:player.<player.uuid> set stats.drop_rate_increase:0
    - yaml id:player.<player.uuid> set lessons.current:0
    - yaml id:player.<player.uuid> set lessons.lifetime:0

stats_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Stats Menu<&r> <&6>◆
  size: 45
  definitions:
    filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  procedural items:
  - foreach <server.list_scripts.filter[yaml_key[type].is[==].to[item]].filter[name.ends_with[_stats_icon]]>:
    - define item:<item[<[value].name>]>
    - adjust def:item lore:"Current Level: <yaml[player.<player.uuid>].read[stats.<context.item.script.yaml_key[assigned_stat]>]>"
    - define list:|:item
  - determine <[list]>
  slots:
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [] [] [] [] [] [] [] [filler]"
  - "[filler] [] [] [] [] [] [] [] [filler]"
  - "[filler] [] [] [] [] [] [] [] [filler]"
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

stats_inventory_handler:
  type: world
  debug: true
  events:
    on player clicks in stats_character:
    - narrate <context.clicked_inventory.script_name>
    - determine passively cancelled
    - if <context.item.script.yaml_key[assigned_stat]||null> != null:
      - if <yaml[player.<player.uuid>].read[lessons.current]> > 0:
        - yaml id:player.<player.uuid> set stats.<context.item.script.yaml_key[assigned_stat]>:+:<context.item.script.yaml_key[assigned_stat_increment]>
        - yaml id:player.<player.uuid> set lessons.current:--

health_stats_icon:
  type: item
  material: snow
  assigned_stat: health.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Health<&r> <&6>◆"
  lore:
  - ""
  drops_on_death: false

melee_damage_stats_icon:
  type: item
  material: snow
  assigned_stat: melee_damage
  assigned_stat_increment: 2
  display name: "<green><&6>◆ <&a><&n><&l>Melee Damage<&r> <&6>◆"
  drops_on_death: false

constitution_stats_icon:
  type: item
  material: snow
  assigned_stat: constitution
  assigned_stat_increment: 1
  display name: "<green><&6>◆ <&a><&n><&l>Constitution<&r> <&6>◆"
  drops_on_death: false

speed_stats_icon:
  type: item
  material: snow
  assigned_stat: speed
  assigned_stat_increment: 0.01
  display name: "<green><&6>◆ <&a><&n><&l>Speed<&r> <&6>◆"
  drops_on_death: false

carry_weight_stats_icon:
  type: item
  material: snow
  assigned_stat: weight.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Carry Weight<&r> <&6>◆"
  drops_on_death: false

thirst_stats_icon:
  type: item
  material: snow
  assigned_stat: thirst.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Thirst<&r> <&6>◆"
  drops_on_death: false

food_stats_icon:
  type: item
  material: snow
  assigned_stat: food.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Food<&r> <&6>◆"
  drops_on_death: false

power_stats_icon:
  type: item
  material: snow
  assigned_stat: power.max
  assigned_stat_increment: 2
  display name: "<green><&6>◆ <&a><&n><&l>Power<&r> <&6>◆"
  drops_on_death: false

create_player_stats:
  type: world
  events:
    on player first login:
      - inject stats_setup

survival_sidebar:
  type: world
  events:
    on player join:
      - inject survival_sidebar_show
    
    on delta time secondly:
      - inject survival_sidebar_show

survival_sidebar_show:
  type: task
  script:
    - sidebar set "title:<&c>Survival Stats" "values:<&a>Temperature<&co><&e> <yaml[player.<player.uuid>].read[stats.temperature]>|<&a>Weight<&co><&e> <yaml[player.<player.uuid>].read[stats.weight.current]>/<yaml[player.<player.uuid>].read[stats.weight.max]>|<&a>Food<&co><&e> <yaml[player.<player.uuid>].read[stats.food.current]>/<yaml[player.<player.uuid>].read[stats.food.max]>|<&a>Thirst<&co><&e> <yaml[player.<player.uuid>].read[stats.thirst.current]>/<yaml[player.<player.uuid>].read[stats.thirst.max]>" players:<server.list_online_players> per_player