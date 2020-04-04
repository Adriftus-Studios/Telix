
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
      - boss_dagon_summon_minion

entity_dagon_deity:
  type: entity
  entity_type: guardian
  custom_name: <&c>Dagon Diety
  max_health: 16
  
boss_dagon_aqua_burst:
  type: task
  ability_tree: water
  cooldown: 12s
  warmup: 1s
  requires_target: false
  requires_target_in_sight: false
  definitions: entity
  warmup_script:
  - repeat 20:
    - define points:<proc[define_curve1].context[start|end|intensity|angle|between]>
    - wait 1t
  script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - adjust <queue> linked_player:<[player]>
    - run spawn_custom_mob def:<entity[entity_dagon_deity]>|<[entity].location>

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