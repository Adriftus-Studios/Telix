
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

entity_dagon_deity:
  type: entity
  entity_type: guardian
  custom_name: <&c>Dagon Diety
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
    - playeffect redstone <[sphere].random[20]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,245>
    - wait 1t
  script:
  - define layers:<proc[define_sphere2].context[<player.location.above>|2|0.5]>
  - define center:<[entity].location>
  - repeat 20:
    - repeat <[layers].size>:
      - define offset:<[entity].location.sub[<[center]>]>
      - define points:<[layers].get[<[value]>].unescaped>
      - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
      - playeffect redstone at:<[points].parse[add[<[offset]>]]> quantity:1 offset:0 visibility:100 special_data:1|<co@91,225,245>
      - wait 2t

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
  script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - run spawn_custom_mob def:<entity[entity_dagon_deity]>|<[entity].location>