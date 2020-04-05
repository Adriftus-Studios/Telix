
boss_dagon:
  type: entity
  entity_type: elder_guardian
  custom_name: <&l><&4>Dagon
  custom_name_visible: true
  max_health: 1200
  health: 1200
  speed: 0.3
  custom:
    ability_usage:
      - boss_dagon_aqua_burst
      - boss_dagon_summon_minion
      - boss_dagon_aqua_shield

entity_dagon_minion:
  type: entity
  entity_type: guardian
  custom_name: <&c>Dagon Minion
  max_health: 16
  
boss_dagon_aqua_shield:
  type: task
  ability_tree: water
  cooldown: 60s
  warmup: 5s
  requires_target: false
  requires_target_in_sight: false
  definitions: entity
  warmup_script:
  - define sphere:<proc[define_sphere1].context[<[entity].location>|2|1]>
  - define center:<[entity].location>
  - repeat 100:
    - define offset:<[entity].location.sub[<[center]>]>
    - playeffect redstone <[sphere].random[10].parse[add[<[offset]>]]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - wait 1t
  script:
  - define layers:<proc[define_sphere2].context[<[entity].location.above>|2|0.5]>
  - define center:<[entity].location>
  - define time:<util.date.time>
  - repeat 20:
    - repeat <[layers].size>:
      - if <[entity].is_spawned||false> == false:
        - stop
      - define offset:<[entity].location.sub[<[center]>]>
      - define points:<[layers].get[<[value]>].unescaped>
      - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
      - playeffect redstone at:<[points].parse[add[<[offset]>]]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,245>
      - wait 1t
  - playeffect redstone at:<proc[define_sphere1].context[<[entity].location.above>|2|0.5]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,200>

boss_dagon_aqua_burst:
  type: task
  ability_tree: water
  cooldown: 12s
  warmup: 2s
  requires_target: false
  requires_target_in_sight: false
  definitions: entity
  warmup_script:
  - define sphere:<proc[define_sphere1].context[<[entity].location>|3|1]>
  - define center:<[entity].location>
  - repeat 40:
    - define offset:<[entity].location.sub[<[center]>]>
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location.sub[<[offset]>]>].distance[0.2].parse[add[<[offset]>]]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location.sub[<[offset]>]>].distance[0.2].parse[add[<[offset]>]]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location.sub[<[offset]>]>].distance[0.2].parse[add[<[offset]>]]> offset:0 visibility:300 quantity:1
    - wait 2t
  script:
  - define sphere:<proc[define_sphere1].context[<[entity].location>|7|1]>
  - define center:<[entity].location>
  - repeat 15:
    - repeat 5:
      - define point:<[sphere].random>
      - define offset:<[entity].location.sub[<[center]>]>
      - run boss_dagon_aqua_burst_animation def:<[entity].location>|<[offset].add[<[point]>]>
    - wait 2t

boss_dagon_aqua_burst_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|<util.random.int[0].to[360]>|0.3]>
  - repeat <[points].size.div[2]>:
    - playeffect redstone <[points].get[<[value].mul[2].sub[1]>]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,245>
    - playeffect redstone <[points].get[<[value].mul[2]>]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,245>
    - if <[points].get[<[value].mul[2].sub[1]>].find.living_entities.within[0.5].filter[script.name.is[!=].to[boss_dagon]].filter[script.name.is[!=].to[entity_dagon_deity]].size> != 0:
      - hurt 3 <[points].get[<[value]>].find.living_entities.within[0.5].filter[script.name.is[!=].to[boss_dagon]].filter[script.name.is[!=].to[entity_dagon_deity]]>
      - repeat stop
    - wait 1t

boss_dagon_summon_minion:
  type: task
  ability_tree: water
  cooldown: 40s
  warmup: 5s
  requires_target: false
  requires_target_in_sight: false
  additional_conditions:
  - <[entity].health.is[less].to[300]>
  definitions: entity
  warmup_script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - narrate "<&b>Dagon is calling for help!"
  - define sphere1:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_1]>|2|1]>
  - define sphere2:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_2]>|2|1]>
  - define sphere3:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_3]>|2|1]>
  - define sphere4:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_4]>|2|1]>
  - repeat 100:
    - define offset:<[entity].location.sub[<[center]>]>
    - playeffect redstone <[sphere].random[10].parse[add[<[offset]>]]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - wait 1t
  script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - run spawn_custom_mob def:<entity[entity_dagon_minion]>|<[entity].location>
    
test_command:
  type: command
  name: test
  permission: test
  script:
  - define sphere1:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_1]>|2|1]>
  - define sphere2:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_2]>|2|1]>
  - define sphere3:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_3]>|2|1]>
  - define sphere4:<proc[define_sphere1].context[<location[water_boss_minion_spawnpoint_4]>|2|1]>
  - repeat 200:
    - playeffect redstone <[sphere1].random[10]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - playeffect redstone <[sphere2].random[10]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - playeffect redstone <[sphere3].random[10]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - playeffect redstone <[sphere4].random[10]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,200>
    - wait 1t

  - define layers1:<proc[define_sphere2].context[<location[water_boss_minion_spawnpoint_1]>|2|0.5]>
  - define layers2:<proc[define_sphere2].context[<location[water_boss_minion_spawnpoint_2]>|2|0.5]>
  - define layers3:<proc[define_sphere2].context[<location[water_boss_minion_spawnpoint_3]>|2|0.5]>
  - define layers4:<proc[define_sphere2].context[<location[water_boss_minion_spawnpoint_4]>|2|0.5]>
  - repeat 5:
    - repeat <[layers1].size>:
      - define points:<[layers1].get[<[value]>].unescaped>
      - define points:|:<[layers1].get[<[layers1].size.sub[<[value]>]>].unescaped>
      - define points:|:<[layers2].get[<[value]>].unescaped>
      - define points:|:<[layers2].get[<[layers1].size.sub[<[value]>]>].unescaped>
      - define points:|:<[layers3].get[<[value]>].unescaped>
      - define points:|:<[layers3].get[<[layers1].size.sub[<[value]>]>].unescaped>
      - define points:|:<[layers4].get[<[value]>].unescaped>
      - define points:|:<[layers4].get[<[layers1].size.sub[<[value]>]>].unescaped>
      - playeffect redstone at:<[points]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,245>
      - wait 1t
    - run spawn_custom_mob def:<entity[entity_dagon_minion]>|<location[water_boss_minion_spawnpoint_1].below>
    - run spawn_custom_mob def:<entity[entity_dagon_minion]>|<location[water_boss_minion_spawnpoint_2].below>
    - run spawn_custom_mob def:<entity[entity_dagon_minion]>|<location[water_boss_minion_spawnpoint_3].below>
    - run spawn_custom_mob def:<entity[entity_dagon_minion]>|<location[water_boss_minion_spawnpoint_4].below>