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
    - yaml id:player.<player.uuid> set stats.xp:0
    - yaml id:player.<player.uuid> set stats.level:1
    - yaml id:player.<player.uuid> set stats.stat_points:1000
    - yaml id:player.<player.uuid> set stats.experience_multiplier:100
    - yaml id:player.<player.uuid> set stats.drop_rate_multiplier:100
    - yaml id:player.<player.uuid> set stats.equipment_rating:0
    - yaml id:player.<player.uuid> set lessons.current:1000
    - yaml id:player.<player.uuid> set lessons.lifetime:0
    - wait 1t
    - foreach <yaml[ability_trees].list_keys[skill_trees]>:
      - yaml id:player.<player.uuid> set skills.<[value]>.current:100

default_stats:
  type: yaml data
  test: 1

stats_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Stats Menu<&r> <&6>◆
  size: 45
  definitions:
    filler: <item[gui_invisible_item]>
    gui_top: <item[gui_stats_top]>
    gui_bottom: <item[gui_stats_bottom]>
  slots:
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [power_stats_icon] [food_stats_icon] [thirst_stats_icon] [carry_weight_stats_icon] [speed_stats_icon] [constitution_stats_icon] [health_stats_icon] [filler]"
  - "[gui_stats_top] [experience_multiplier_stats_icon] [drop_rate_multiplier_stats_icon] [equipment_rating_stats_icon] [damage_stats_icon] [] [] [] [filler]"
  - "[gui_stats_bottom] [] [] [] [] [] [] [] [filler]"
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

stats_inventory_handler:
  type: world
  debug: true
  events:
    on player clicks in stats_character:
    - if <context.clicked_inventory.script_name> == "STATS_CHARACTER":
      - determine passively cancelled
      - if <context.item.script.yaml_key[assigned_stat_increment]||null> != null:
        - if <yaml[player.<player.uuid>].read[stats.stat_points]> > 0:
          - yaml id:player.<player.uuid> set stats.<context.item.script.yaml_key[assigned_stat]>:+:<context.item.script.yaml_key[assigned_stat_increment]>
          - yaml id:player.<player.uuid> set stats.stat_points_spent.<context.item.script.yaml_key[assigned_stat].replace[.max].with[]>:+:1
          - yaml id:player.<player.uuid> set stats.stat_points:--
          - inventory open d:stats_character
          - inject update_stats

update_stats:
  type: task
  debug: true
  script:
  - adjust <player> max_health:<yaml[player.<player.uuid>].read[stats.health.max]>
  - define speed:<yaml[player.<player.uuid>].read[stats.speed].mul[0.002]>
  - adjust <player> walk_speed:<[speed].sub[<[speed].mul[<yaml[player.<player.uuid>].read[stats.encumberance].mul[0.01]>]>]>

damage_stats_icon:
  type: item
  material: snow
  assigned_stat: melee_damage
  display name: "<green><&6>◆ <&a><&n><&l>Melee Damage<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

equipment_rating_stats_icon:
  type: item
  material: snow
  assigned_stat: equipment_rating
  display name: "<green><&6>◆ <&a><&n><&l>Equipment Rating<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

drop_rate_multiplier_stats_icon:
  type: item
  material: snow
  assigned_stat: drop_rate_multiplier
  display name: "<green><&6>◆ <&a><&n><&l>Drop Rate Multiplier<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

experience_multiplier_stats_icon:
  type: item
  material: snow
  assigned_stat: experience_multiplier
  display name: "<green><&6>◆ <&a><&n><&l>Experience Multiplier<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

health_stats_icon:
  type: item
  material: snow
  assigned_stat: health.max
  assigned_stat_increment: 1
  display name: "<green><&6>◆ <&a><&n><&l>Health<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

constitution_stats_icon:
  type: item
  material: snow
  assigned_stat: constitution
  assigned_stat_increment: 1
  display name: "<green><&6>◆ <&a><&n><&l>Constitution<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

speed_stats_icon:
  type: item
  material: snow
  assigned_stat: speed
  assigned_stat_increment: 1
  display name: "<green><&6>◆ <&a><&n><&l>Speed<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

carry_weight_stats_icon:
  type: item
  material: snow
  assigned_stat: weight.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Carry Weight<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

thirst_stats_icon:
  type: item
  material: snow
  assigned_stat: thirst.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Thirst<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

food_stats_icon:
  type: item
  material: snow
  assigned_stat: food.max
  assigned_stat_increment: 10
  display name: "<green><&6>◆ <&a><&n><&l>Food<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
  drops_on_death: false

power_stats_icon:
  type: item
  material: snow
  assigned_stat: power.max
  assigned_stat_increment: 2
  display name: "<green><&6>◆ <&a><&n><&l>Power<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script.yaml_key[assigned_stat_increment]>]>"
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