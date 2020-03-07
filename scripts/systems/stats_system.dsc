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
  definitions: player
  script:
    - if <[player]||null> != null:
      - adjust <queue> linked_player:<[player]>
    - inject calculate_base_stats
    - inject calculate_weight_equipment_stats
    - inject calculate_encumberance_speed

stats_setup:
  type: task
  script:
  - announce to_ops "<&c>The script <script.name> has used the deprecated task 'stats_setup'. this task has been replaced with 'player_setup'"
  - inject player_setup
  
stats_events:
  type: world
  events:
    on player damages player:
      - yaml id:player.<player.uuid> set values.damage_to_players:+:<context.damage.round>
    on player kills player:
      - if <context.entity.is_player>:
        - yaml id:player.<context.entity.uuid> set values.deaths:++
      - if <context.damager.is_player>:
        - yaml id:player.<context.damager.uuid> set values.kills:++
    on player heals:
      - yaml id:player.<player.uuid> set values.heals:+:<context.amount>

calculate_base_stats:
  type: task
  debug: false
  script:
    - if <yaml[player.<player.uuid>].list_keys[]||null> == null:
      - inject player_setup
    - foreach <script[default_stats].list_keys[stats.default]> as:stat:
      - if <script[default_stats].yaml_key[stats.default.<[stat]>]||null> != null:
        - define value:<script[default_stats].yaml_key[stats.default.<[stat]>].add[<script[default_stats].yaml_key[stats.increments.<[stat]>].mul[<yaml[player.<player.uuid>].read[stats.stat_points_spent.<[stat]>]||0>]||0>]>
        - if !<list[speed|constitution|melee_damage|experience_multiplier|drop_rate_multiplier|equipment_rating].contains[<[stat]>]>:
          - yaml id:player.<player.uuid> set stats.<[stat]>.max:<[value]>
        - else:
          - yaml id:player.<player.uuid> set stats.<[stat]>:<[value]>
        - foreach <list[aer|arcane|chaos|earth|electric|ender|holy|nether|ocean|physical]> as:modifier:
          - yaml id:player.<player.uuid> set stats.damage_modifier.<[modifier]>:0
          - yaml id:player.<player.uuid> set stats.damage_reduction.<[modifier]>:0

calculate_weight_equipment_stats:
  type: task
  debug: false
  script:
    - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
    - foreach <[slotmap]>:
      - define item:<inventory[equipment_<player.uuid>].slot[<[value].split[/].get[1]>]||<item[air]>>
      - if <[item].material.name> != air:
        - if !<[item].script.name.ends_with[_shadow]>:
          - if <[item].nbt[built]||null> = null:
            - announce to_ops "<player.name> tried to update stats with an unbuilt item. (<[item].script.name>)"
          - foreach <[item].enchantments||<list[]>> as:enchant:
            - if <[enchants]||null> != null:
              - if <[item].enchantments.contains[<[enchant].split[,].get[1]>]>:
                - define entry:<[enchant]>,<[enchants].filter[starts_with[<[enchant]>]].get[1].split[,].get[2].add[<[item].enchantments.level[<[enchant]>]>]||<[item].enchantments.level[<[enchant]>]>>
                - define enchants:<[enchants].exclude[<[enchants].filter[starts_with[<[enchant]>]].get[1]||<list[]>>]||<list[]>>
                - define enchants:|:<[entry]>
              - else:
                - define enchants:|:<[enchant]>,<[item].enchantments.level[<[enchant]>]>
            - else:
              - define enchants:|:<[enchant]>,<[item].enchantments.level[<[enchant]>]>
          - if <[item].script.yaml_key[armor]||null> != null:
            - define armor:+:<[item].script.yaml_key[armor]>
          - foreach <[item].nbt_attributes> as:attr:
            - define attr_type:<[attr].split[/].get[1]>
            - define attr_amount:<[attr].split[/].get[4]>
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
    - equip chest:<item[equipment_chest_slot].with[nbt_attributes:generic.armor/chest/0/<[armor]||0>].with[enchantments:<[enchants]||<list[]>>]>
    - adjust <player> max_health:<yaml[player.<player.uuid>].read[stats.health.max]>

calculate_encumberance_speed:
  type: task
  debug: false
  script:
    - foreach <player.inventory.list_contents> as:item:
      - define this_item_weight:<[item].script.yaml_key[weight]||1>
      - define weight:|:<[this_item_weight].*[<[item].quantity>]||1>
    - define slotmap:<list[11/necklace|12/earrings|16/hat|20/ring1|21/ring2|24/gloves|25/shirt|26/cape|29/trinket1|30/trinket2|34/pants|43/shoes]>
    - foreach <[slotmap]>:
      - define item:<inventory[equipment_<player.uuid>].slot[<[value].split[/].get[1]>]||<item[air]>>
      - if <[item].material> != air:
        - define weight:|:<[item].script.yaml_key[weight]||1>
    - yaml id:player.<player.uuid> set stats.weight.current:<[weight].sum||0>
    - define encumberance:<yaml[player.<player.uuid>].read[stats.weight.current].-[4]./[<yaml[player.<player.uuid>].read[stats.weight.max]>].*[100].round_down_to_precision[10]>
    - if <[encumberance]> > 100:
      - define encumberance:100
    - yaml id:player.<player.uuid> set stats.encumberance:<[encumberance]>
    - define speed:<yaml[player.<player.uuid>].read[stats.speed].mul[0.002]>
    - if <yaml[player.<player.uuid>].read[stats.encumberance]> > 100:
      - adjust <player> walk_speed:0.1
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
    - foreach <script[default_stats].list_keys[stats.default].alphabetical> as:stat:
      - define icon:<item[stats_icon]>
      - adjust def:icon display_name:<&6>◆<&sp><&a><&n><&l><[stat].substring[0,1].to_uppercase><[stat].substring[2].to_lowercase.replace[_].with[<&sp>]><&r><&sp><&6>◆
      - define lore:Current<&co><&sp><yaml[player.<player.uuid>].read[stats.<[stat]>.max]||<yaml[player.<player.uuid>].read[stats.<[stat]>]>>
      - if <script[default_stats].yaml_key[stats.increments.<[stat]>]||null> != null:
        - define lore:|:Next<&sp>Level<&co><&sp><yaml[player.<player.uuid>].read[stats.<[stat]>.max].+[<script[default_stats].yaml_key[stats.increments.<[stat]>]>]||<yaml[player.<player.uuid>].read[stats.<[stat]>].+[<script[default_stats].yaml_key[stats.increments.<[stat]>]>]>>
        - adjust def:icon nbt:assigned_stat/<[stat]>
      - else:
        - define lore:|:This<&sp>Stat<&sp>cannot<&sp>be<&sp>increased<&sp>with<&sp>Skill<&sp>Points.
      - adjust def:icon lore:<[lore]>
      - define items:|:<[icon]>
    - determine <[items]>
  definitions:
    filler: <item[gui_invisible_item]>
    gui_top: <item[gui_stats_top]>
    gui_bottom: <item[gui_stats_bottom]>
  slots:
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [] [] [] [] [] [] [] [filler]"
  - "[gui_stats_top] [] [] [] [] [] [] [] [filler]"
  - "[gui_stats_bottom] [] [] [] [] [] [] [] [filler]"
  - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

stats_inventory_handler:
  type: world
  events:
    on player clicks in stats_character:
    - if <context.clicked_inventory.script_name||null> == "STATS_CHARACTER":
      - determine passively cancelled
      - if <context.item.nbt[assigned_stat]||null> != null:
        - if <yaml[player.<player.uuid>].read[stats.stat_points]> > 0:
          - yaml id:player.<player.uuid> set stats.stat_points_spent.<context.item.nbt[assigned_stat]>:+:1
          - yaml id:player.<player.uuid> set stats.stat_points:--
          - inventory open d:stats_character

stats_icon:
  type: item
  material: snow
  assigned_stat: power.max
  assigned_stat_increment: 2
  display name: "<&6>◆ <&a><&n><&l>Stat<&r> <&6>◆"
  drops_on_death: false
  
create_player_stats:
  type: world
  events:
    on player first login:
      - inject stats_setup

survival_sidebar:
  type: world
  debug: false
  events:
    on player join:
      - inject survival_sidebar_show
    
    on delta time secondly:
      - inject survival_sidebar_show

survival_sidebar_show:
  type: task
  debug: false
  script:
    - sidebar set "title:<&c>Survival Stats" "values:<&a>Temperature<&co><&e> <yaml[player.<player.uuid>].read[stats.temperature]>|<&a>Weight<&co><&e> <yaml[player.<player.uuid>].read[stats.weight.current]>/<yaml[player.<player.uuid>].read[stats.weight.max]>|<&a>Food<&co><&e> <yaml[player.<player.uuid>].read[stats.food.current]>/<yaml[player.<player.uuid>].read[stats.food.max]>|<&a>Thirst<&co><&e> <yaml[player.<player.uuid>].read[stats.thirst.current]>/<yaml[player.<player.uuid>].read[stats.thirst.max]>" players:<server.list_online_players> per_player