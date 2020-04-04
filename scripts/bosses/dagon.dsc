
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

entity_dagon_deity:
  type: entity
  entity_type: guardian
  custom_name: <&c>Dagon Diety
  max_health: 16
  
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
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2].parse[add[<[offset]>]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2].parse[add[<[offset]>]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2].parse[add[<[offset]>]> offset:0 visibility:300 quantity:1
    - wait 1t
  script:
  - define sphere:<proc[define_sphere1].context[<[entity].location>|7|1]>
  - define center:<[entity].location>
  - repeat 15:
    - repeat 5:
      - define point:<[sphere].random>
      - define offset:<[entity].location.sub[<[center]>]>
      - narrate <[offset]>
      - run boss_dagon_aqua_burst_animation def:<[entity].location>|<[offset].add[<[point]>]>
    - wait 2t

boss_dagon_aqua_burst_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|<util.random.int[0].to[360]>|0.4]>
  - playeffect redstone <[points]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,245>
  - foreach <[points]> as:point:
    - playeffect redstone <[point]> offset:0 visibility:300 quantity:3 special_data:1|<co@91,225,245>
    - wait 1t

boss_dagon_summon_minion:
  type: task
  ability_tree: water
  cooldown: 40s
  warmup: 5s
  requires_target: false
  requires_target_in_sight: false
  additional_conditions:
  - <[entity].health.is[less].to[1200]>
  definitions: entity
  warmup_script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - narrate "Dagon is calling for help!"
  script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - run spawn_custom_mob def:<entity[entity_dagon_deity]>|<[entity].location>