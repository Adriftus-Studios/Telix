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
    - yaml id:player.<player.uuid> set stats.skill_points:0
    - yaml id:player.<player.uuid> set lessons.current:0
    - yaml id:player.<player.uuid> set lessons.lifetime:0

stats_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Stats Menu<&r> <&6>◆
  size: 45
  definitions:
    filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  slots:
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [] [] [carry_weight_icon] [power_icon] [food_icon] [] [] [filler]"
  - "[filler] [] [] [speed_icon] [guiclose] [thirst_icon] [] [] [filler]"
  - "[filler] [] [] [health_icon] [melee_damage_icon] [constitution_icon] [] [] [filler]"
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

stats_inventory_handler:
  type: world
  events:
    on player clicks in stats_character:
    - choose <context.item.script.name>:
      - case health_icon:
        - narrate 1
      - case speed_icon:
        - narrate 2

health_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Health<&r> <&6>◆"
  drops_on_death: false

melee_damage_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Melee Damage<&r> <&6>◆"
  drops_on_death: false

constitution_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Constitution<&r> <&6>◆"
  drops_on_death: false

speed_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Speed<&r> <&6>◆"
  drops_on_death: false

carry_weight_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Carry Weight<&r> <&6>◆"
  drops_on_death: false

thirst_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Thirst<&r> <&6>◆"
  drops_on_death: false

food_icon:
  type: item
  material: snow
  display name: "<green><&6>◆ <&a><&n><&l>Food<&r> <&6>◆"
  drops_on_death: false

power_icon:
  type: item
  material: snow
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