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
    - wait 1t
    - foreach <script[abilitytrees].list_keys[trees]>:
      - yaml id:player.<player.uuid> set skills.<[value]>.current:100

update_stats_command:
  type: command
  name: update_stats
  description: update_stats
  usage: /update_stat
  script:
    - inject update_stats

update_stats:
  type: task
  debug: false
  script:
    - inject calculate_base_stats
    - inject calculate_weight_equipment_stats
    - inject calculate_encumberance_speed

calculate_base_stats:
  type: task
  debug: false
  script:
    - foreach <script[default_stats].list_keys[stats.default]> as:stat:
      - if <script[default_stats].yaml_key[stats.default.<[stat]>]||null> != null:
        - define value:<script[default_stats].yaml_key[stats.default.<[stat]>].add[<script[default_stats].yaml_key[stats.increments.<[stat]>].mul[<yaml[player.<player.uuid>].read[stats.stat_points_spent.<[stat]>]||>]||0>]>
        - if !<list[speed|constitution|melee_damage|experience_multiplier|drop_rate_multiplier|equipment_rating].contains[<[stat]>]>:
          - yaml id:player.<player.uuid> set stats.<[stat]>.max:<[value]>
        - else:
          - yaml id:player.<player.uuid> set stats.<[stat]>:<[value]>

calculate_weight_equipment_stats:
  type: task
  debug: false
  script:
    - foreach <player.inventory.list_contents> as:item:
      - define this_item_weight:<[item].script.yaml_key[weight]||1>
      - define weight:|:<[this_item_weight].*[<[item].quantity>]>
    - foreach <yaml[player.<player.uuid>].list_keys[equipment]> as:equipment:
      - define item:<yaml[player.<player.uuid>].read[equipment.<[equipment]>].as_item>
      - if <[item].material.name> != air:
        - if <[item].nbt[built]||null> != null:
          - define weight:|:<[item].script.yaml_key[weight]>
          - foreach <[item].nbt_keys> as:stat:
            - if <[stat].starts_with[base_stats.]>:
              - define value:<[item].nbt[<[stat]>]>
              - define stat:<[stat].replace[base_stats.].with[]>
              - if <[item].nbt[star_stat.<[stat]>]||null> != null:
                - define value:<[value].add[<[item].nbt[star_stat.<[stat]>]>]>
              - if !<list[speed|constitution|melee_damage|experience_multiplier|drop_rate_multiplier|equipment_rating].contains[<[stat]>]>:
                - yaml id:player.<player.uuid> set stats.<[stat]>.max:+:<[value]>
                - if <yaml[player.<player.uuid>].read[stats.<[stat]>.max]> < <yaml[player.<player.uuid>].read[stats.<[stat]>.current]>:
                  - yaml id:player.<player.uuid> set stats.<[stat]>.current:+:<[value]>
              - else:
                - yaml id:player.<player.uuid> set stats.<[stat]>:+:<[value]>
    - yaml id:player.<player.uuid> set stats.weight.current:<[weight].sum||0>

calculate_encumberance_speed:
  type: task
  debug: false
  script:
    - adjust <player> max_health:<yaml[player.<player.uuid>].read[stats.health.max]>
    - define encumberance:<yaml[player.<player.uuid>].read[stats.weight.current].-[4]./[<yaml[player.<player.uuid>].read[stats.weight.max]>].*[100].round_down_to_precision[10]>
    - if <[encumberance]> > 100:
      - define encumberance:100
    - yaml id:player.<player.uuid> set stats.encumberance:<[encumberance]>
    - define speed:<yaml[player.<player.uuid>].read[stats.speed].mul[0.002]>
    - if <yaml[player.<player.uuid>].read[stats.encumberance]> > 69:
      - adjust <player> walk_speed:<[speed].sub[<[speed].mul[<yaml[player.<player.uuid>].read[stats.encumberance].mul[0.01]>]>]>
    - else:
      - adjust <player> walk_speed:<[speed]>

default_stats:
  type: yaml data
  stats:
    default:
      speed: 100
      food: 100
      thirst: 100
      health: 20
      weight: 100
      power: 20
      constitution: 0
      experience_multiplier: 0
      drop_rate_multiplier: 0
      melee_damage: 100
      equipment_rating: 0
    increments:
      speed: 1
      health: 1
      constitution: 1
      weight: 10
      thirst: 10
      food: 10
      power: 2

stats_character:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Stats Menu<&r> <&6>◆
  size: 45
  procedural items:
    - inject update_stats
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
  events:
    on player clicks in stats_character:
    - if <context.clicked_inventory.script_name> == "STATS_CHARACTER":
      - determine passively cancelled
      - if <context.item.script.yaml_key[assigned_stat_increment]||null> != null:
        - if <yaml[player.<player.uuid>].read[stats.stat_points]> > 0:
          - yaml id:player.<player.uuid> set stats.stat_points_spent.<context.item.script.yaml_key[assigned_stat].replace[.max].with[]>:+:1
          - yaml id:player.<player.uuid> set stats.stat_points:--
          - inventory open d:stats_character
          - inject update_stats

damage_stats_icon:
  type: item
  material: snow
  assigned_stat: melee_damage
  display name: "<&6>◆ <&a><&n><&l>Melee Damage<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

equipment_rating_stats_icon:
  type: item
  material: snow
  assigned_stat: equipment_rating
  display name: "<&6>◆ <&a><&n><&l>Equipment Rating<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

drop_rate_multiplier_stats_icon:
  type: item
  material: snow
  assigned_stat: drop_rate_multiplier
  display name: "<&6>◆ <&a><&n><&l>Drop Rate Multiplier<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

experience_multiplier_stats_icon:
  type: item
  material: snow
  assigned_stat: experience_multiplier
  display name: "<&6>◆ <&a><&n><&l>Experience Multiplier<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>%"
  - "This Stat cannot be increased with Skill Points."
  drops_on_death: false

health_stats_icon:
  type: item
  material: snow
  assigned_stat: health.max
  assigned_stat_increment: 1
  display name: "<&6>◆ <&a><&n><&l>Health<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

constitution_stats_icon:
  type: item
  material: snow
  assigned_stat: constitution
  assigned_stat_increment: 1
  display name: "<&6>◆ <&a><&n><&l>Constitution<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

speed_stats_icon:
  type: item
  material: snow
  assigned_stat: speed
  assigned_stat_increment: 1
  display name: "<&6>◆ <&a><&n><&l>Speed<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

carry_weight_stats_icon:
  type: item
  material: snow
  assigned_stat: weight.max
  assigned_stat_increment: 10
  display name: "<&6>◆ <&a><&n><&l>Carry Weight<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

thirst_stats_icon:
  type: item
  material: snow
  assigned_stat: thirst.max
  assigned_stat_increment: 10
  display name: "<&6>◆ <&a><&n><&l>Thirst<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

food_stats_icon:
  type: item
  material: snow
  assigned_stat: food.max
  assigned_stat_increment: 10
  display name: "<&6>◆ <&a><&n><&l>Food<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
  drops_on_death: false

power_stats_icon:
  type: item
  material: snow
  assigned_stat: power.max
  assigned_stat_increment: 2
  display name: "<&6>◆ <&a><&n><&l>Power<&r> <&6>◆"
  lore:
  - "Current: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>]>"
  - "Next Level: <yaml[player.<player.uuid>].read[stats.<script.yaml_key[assigned_stat]>].+[<script[default_stats].yaml_key[stats.default.<[stat]>]>]>"
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