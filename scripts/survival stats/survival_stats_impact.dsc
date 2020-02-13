survival_stats_temperature:
  type: world
  debug: false
  events:
    on delta time secondly every:15:
      - foreach <server.list_online_players.filter[health.is[OR_MORE].than[0]]>:
        - if <[value].has_flag[cheatmode]>:
          - stop
        - adjust <queue> linked_player:<[value]>
        - define change:none
        - if !<player.is_online>:
          - foreach next
        - define temperature:<player.location.biome.temperature.*[100].+[<server.flag[global_temperature_modifier]>]>
        - if <player.location.material.name.contains[water]>:
          - define temp:<[temperature].*[100].round_to[0].-[10]>
          - if <[temp]> >= 100:
            - define temp:100
          - if <[temp]> > <yaml[player.<player.uuid>].read[stats.temperature]>:
            - define change:decrease
          - else if <[temp]> < <yaml[player.<player.uuid>].read[stats.temperature]>:
            - define change:increase
          - yaml id:player.<player.uuid> set stats.temperature:<[temp]>
        - else if !<player.location.find.blocks[fire|campfire|torch].within[5].is_empty>:
          - if <[temperature].+[20].round_to[0]> > <yaml[player.<player.uuid>].read[stats.temperature]>:
            - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> > 100:
              - foreach next
            - yaml id:player.<player.uuid> set stats.temperature:+:2
            - define change:increase
          - else if <[temperature].+[20].round_to[0]> < <yaml[player.<player.uuid>].read[stats.temperature]>:
            - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> < 100:
              - foreach next
            - yaml id:player.<player.uuid> set stats.temperature:--
            - define change:decrease
        - else if <[temperature].round_to[0]> > <yaml[player.<player.uuid>].read[stats.temperature]>:
          - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> > 100:
            - foreach next
          - yaml id:player.<player.uuid> set stats.temperature:++
          - define change:increase
        - else if <[temperature].round_to[0]> < <yaml[player.<player.uuid>].read[stats.temperature]>:
          - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> < 100:
            - foreach next
          - yaml id:player.<player.uuid> set stats.temperature:--
          - define change:decrease
        - inject survival_temperature_impact
        - wait 1t


survival_temperature_impact:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.temperature]> < 50:
      - narrate "<&c>You have <&b>frozen<&c> to death."
      - hurt 1000
    - else if <yaml[player.<player.uuid>].read[stats.temperature]> <= 70:
      - if <[change]> == decrease:
        - actionbar "<&c>You are <&b>freezing <&c>to death."
      - hurt 1
      - yaml id:player.<player.uuid> set stats.food.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]> <= 80:
      - if <[change]> == decrease:
        - actionbar "<&e>You are getting <&b>chilly<&e>."
      - yaml id:player.<player.uuid> set stats.food.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]> >= 140:
      - narrate "<&c>You have died from <&4>heat<&c> exhaustion."
      - hurt 1000
    - else if <yaml[player.<player.uuid>].read[stats.temperature]> >= 120:
      - if <[change]> == increase:
        - actionbar "<&c>You are <&4>burning<&c> up."
      - hurt 1
      - yaml id:player.<player.uuid> set stats.thirst.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]> >= 110:
      - if <[change]> == increase:
        - actionbar "<&e>You are getting <&c>hot<&e>."
      - yaml id:player.<player.uuid> set stats.thirst.current:--
    - inject survival_thirst_hunger_impact

survival_thirst_hunger_impact:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.food.current]> <= -50:
      - hurt 1000
      - narrate "<&c>You have starved to death."
    - else if <yaml[player.<player.uuid>].read[stats.food.current]> <= 0:
      - hurt 1
      - narrate "<&e>You are starving to death."
    - if <yaml[player.<player.uuid>].read[stats.thirst.current]> <= -50:
      - hurt 1000
      - narrate "<&c>You have died of dehydration."
    - else if <yaml[player.<player.uuid>].read[stats.thirst.current]> <= 0:
      - if !<yaml[player.<player.uuid>].read[debuffs].contains[dehydrated]>:
        - yaml id:player.<player.uuid> set debuffs:->:dehydrated
        - run debuff_dehydration

survival_stats_thirst_hunger_periodic_drain:
  type: world
  events:
    on delta time secondly every:15:
      - foreach <server.list_online_players>:
        - if <[value].has_flag[cheatmode]>:
          - stop
        - yaml id:player.<[value].uuid> set stats.food.current:--
        - yaml id:player.<[value].uuid> set stats.thirst.current:--

survival_stats_weight_calculate:
  type: task
  script:
    - foreach <player.inventory.list_contents> as:item:
      - define this_item_weight:<[item].script.yaml_key[weight]||1>
      - define weight:|:<[this_item_weight].*[<[item].quantity>]>
    - yaml id:player.<player.uuid> set stats.weight.current:<[weight].sum||0>
    - inject survival_stats_weight_impact

survival_stats_weight_impact:
  type: task
  debug: false
  script:
    - if <player.has_flag[cheatmode]>:
      - stop
    - define encumberance:<yaml[player.<player.uuid>].read[stats.weight.current].-[4]./[<yaml[player.<player.uuid>].read[stats.weight.max]>].*[100].round_down_to_precision[10]>
    - if <[encumberance]> > 110:
      - define encumberance:110
    - choose <[encumberance]>:
      - case 110:
        - if !<yaml[player.<player.uuid>].read[debuffs].contains[full_encumbered]>:
          - inject debuff_full_encumbered
      - case 100:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.99]>]>
        - if !<yaml[player.<player.uuid>].read[debuffs].contains[encumbered]>:
          - inject debuff_encumbered
      - case 90:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.85]>]>
        - if !<yaml[player.<player.uuid>].read[debuffs].contains[encumbered]>:
          - inject debuff_encumbered
      - case 80:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.5]>]>
      - case 70:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.2]>]>
      - case 60:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.1]>]>
      - case 50:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed].-[<yaml[player.<player.uuid>].read[stats.basespeed].*[0.1]>]>
      - default:
        - adjust <player> walk_speed:<yaml[player.<player.uuid>].read[stats.basespeed]>

survival_stats_weight_events:
  type: world
  events:
    on player picks up item bukkit_priority:HIGHEST:
      - wait 1t
      - inject survival_stats_weight_calculate

    on player drops item bukkit_priority:HIGHEST:
      - wait 1t
      - inject survival_stats_weight_calculate
    
    on player closes inventory bukkit_priority:HIGHEST:
      - wait 1t
      - inject survival_stats_weight_calculate

survival_stats_food_impact_events:
  type: world
  events:
    on player starts sprinting:
      - inject survival_stats_food_burn_sprint
    on player starts swimming:
      - inject survival_stats_food_burn_swim

survival_stats_food_burn_sprint:
  type: task
  script:
    - while <player.is_sprinting>:
      - yaml id:player.<[value].uuid> set stats.food.current:--
      - wait 3s

survival_stats_food_burn_swim:
  type: task
  script:
    - while <player.is_swimming>:
      - yaml id:player.<[value].uuid> set stats.food.current:--
      - wait 3s

survival_stats_reset:
  type: task
  script:
    - yaml id:player.<player.uuid> set stats.food.current:<yaml[player.<player.uuid>].read[stats.food.max]>
    - yaml id:player.<player.uuid> set stats.thirst.current:<yaml[player.<player.uuid>].read[stats.thirst.max]>
    - yaml id:player.<player.uuid> set stats.power.current:<yaml[player.<player.uuid>].read[stats.power.max]>
    - yaml id:player.<player.uuid> set stats.health.current:<yaml[player.<player.uuid>].read[stats.health.max]>
    - yaml id:player.<player.uuid> set stats.temperature:100
    - inject survival_stats_weight_calculate
