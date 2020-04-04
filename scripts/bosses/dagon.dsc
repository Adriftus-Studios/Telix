
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
  - narrate a
  - repeat 40:
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2]> offset:0 visibility:300 quantity:1
    - playeffect spell_witch <[sphere].random.points_between[<[entity].location>].distance[0.2]> offset:0 visibility:300 quantity:1
    - wait 1t
  script:
  - define sphere:<proc[define_sphere1].context[<[entity].location>|7|1]>
  - repeat 5:
    - define points:<proc[define_curve1].context[<[entity].location>|<[sphere].random>|1|<util.random.int[0].to[360]>|0.5]>
    - playeffect spell_witch <[points]> offset:0 visibility:300 quantity:1
    - wait 1t

boss_dagon_aqua_burst_animation:
  type: task
  definitions: start|end
  script:
  

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