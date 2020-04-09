
survival_stats_temperature:
  type: world
  debug: false
  events:
    on delta time secondly every:15:
      - stop
      # temperature disabled until insulation methods implemented
      - foreach <server.list_online_players.filter[health.is[OR_MORE].than[0]]>:
        - adjust <queue> linked_player:<[value]>
        - define change:none
        - if !<player.is_online>:
          - foreach next
        - define temperature:<player.location.biome.temperature.*[100].+[<server.flag[global_temperature_modifier]>]>
        - if <player.location.material.name.contains[water]||null> != null:
          - define temp:<[temperature].round_to[0].-[10]>
          - if <[temp]> >= 100:
            - define temp:100
          - if <[temp]> > <yaml[player.<player.uuid>].read[stats.temperature]>:
            - define change:decrease
          - else if <[temp]> < <yaml[player.<player.uuid>].read[stats.temperature]>:
            - define change:increase
          - yaml id:player.<player.uuid> set stats.temperature:<[temp]>
        - else if !<player.location.find.blocks[fire|campfire|torch].within[5].is_empty||null> != null:
          - if <[temperature].+[20].round_to[0]> > <yaml[player.<player.uuid>].read[stats.temperature]>:
            - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> > 100:
              - foreach next
            - yaml id:player.<player.uuid> set stats.temperature:+:2
            - define change:increase
          - else if <[temperature].+[20].round_to[0]> < <yaml[player.<player.uuid>].read[stats.temperature]||null> != null:
            - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> < 100:
              - foreach next
            - yaml id:player.<player.uuid> set stats.temperature:--
            - define change:decrease
        - else if <[temperature].round_to[0]> > <yaml[player.<player.uuid>].read[stats.temperature]||null> != null:
          - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> > 100:
            - foreach next
          - yaml id:player.<player.uuid> set stats.temperature:++
          - define change:increase
        - else if <[temperature].round_to[0]> < <yaml[player.<player.uuid>].read[stats.temperature]||null> != null:
          - if <util.random.int[0].to[100]> <= <yaml[player.<player.uuid>].read[stats.constitution]> && <yaml[player.<player.uuid>].read[stats.temperature]> < 100:
            - foreach next
          - yaml id:player.<player.uuid> set stats.temperature:--
          - define change:decrease
        - if <[value].has_flag[cheatmode]>:
          - foreach next
        - inject survival_temperature_impact
        - wait 1t


survival_temperature_impact:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.temperature]||80> < 50:
      - narrate "<&c>You have <&b>frozen<&c> to death."
      - hurt 1000
    - else if <yaml[player.<player.uuid>].read[stats.temperature]||80> <= 70:
      - if <[change]> == decrease:
        - run bb_notification def:<&c>You<&sp>are<&sp><&b>freezing<&sp><&c>to<&sp>death.|5s|blue
        - actionbar "<&c>You are <&b>freezing <&c>to death."
      - hurt 1
      - yaml id:player.<player.uuid> set stats.food.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]||80> <= 80:
      - if <[change]> == decrease:
        - run bb_notification def:<&e>You<&sp>are<&sp>getting<&sp><&b>chilly<&e>.|5s|blue
        - actionbar "<&e>You are getting <&b>chilly<&e>."
      - yaml id:player.<player.uuid> set stats.food.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]||80> >= 140:
      - narrate "<&c>You have died from <&4>heat<&c> exhaustion."
      - hurt 1000
    - else if <yaml[player.<player.uuid>].read[stats.temperature]||80> >= 120:
      - if <[change]> == increase:
        - run bb_notification def:<&c>You<&sp>are<&sp><&4>burning<&c><&sp>up.|5s|red
        - actionbar "<&c>You are <&4>burning<&c> up."
      - hurt 1
      - yaml id:player.<player.uuid> set stats.thirst.current:--
    - else if <yaml[player.<player.uuid>].read[stats.temperature]||80> >= 110:
      - if <[change]> == increase:
        - run bb_notification def:<&e>You<&sp>are<&sp>getting<&sp><&c>hot<&e>.|5s|red
        - actionbar "<&e>You are getting <&c>hot<&e>."
      - yaml id:player.<player.uuid> set stats.thirst.current:--
    - inject survival_thirst_hunger_impact

survival_thirst_hunger_impact:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.food.current]||100> <= -50:
      - hurt 1000
      - narrate "<&c>You have starved to death."
    - else if <yaml[player.<player.uuid>].read[stats.food.current]||100> <= 0:
      - hurt 1
      - narrate "<&e>You are starving to death."
    - if <yaml[player.<player.uuid>].read[stats.thirst.current]||100> <= -50:
      - hurt 1000
      - narrate "<&c>You have died of dehydration."
    - else if <yaml[player.<player.uuid>].read[stats.thirst.current]||100> <= 0:
      - if !<yaml[player.<player.uuid>].read[debuffs].contains[dehydrated]>:
        - yaml id:player.<player.uuid> set debuffs:->:dehydrated
        - run debuff_dehydration

survival_stats_thirst_hunger_periodic_drain:
  type: world
  events:
    on delta time secondly every:30:
      - foreach <server.list_online_players>:
        - if <[value].has_flag[cheatmode]>:
          - stop
        - yaml id:player.<[value].uuid> set stats.food.current:--
        - yaml id:player.<[value].uuid> set stats.thirst.current:--

survival_stats_food_impact_events:
  type: world
  events:
    on player starts sprinting:
    - while <player.is_sprinting>:
      - yaml id:player.<player.uuid> set stats.food.current:--
      - wait 3s
    on player starts swimming:
    - while <player.swimming>:
      - yaml id:player.<player.uuid> set stats.food.current:--
      - wait 3s

survival_stats_reset:
  type: task
  script:
    - yaml id:player.<player.uuid> set stats.food.current:<yaml[player.<player.uuid>].read[stats.food.max]>
    - yaml id:player.<player.uuid> set stats.thirst.current:<yaml[player.<player.uuid>].read[stats.thirst.max]>
    - yaml id:player.<player.uuid> set stats.power.current:<yaml[player.<player.uuid>].read[stats.power.max]>
    - yaml id:player.<player.uuid> set stats.health.current:<yaml[player.<player.uuid>].read[stats.health.max]>
    - yaml id:player.<player.uuid> set stats.temperature:100
    - inject calculate_encumberance_speed
