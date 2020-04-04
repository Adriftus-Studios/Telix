
boss_dagon:
  type: entity
  entity_type: elder_guardian
  custom_name: <&4>Dagon
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
  
boss_dagon_summon_minion:
  type: task
  name: boss_dagon_summon_minion
  ability_tree: water
  cooldown: 40s
  warmup: 5s
  requires_target: true
  requires_target_in_sight: false
  #additional_conditions:
  #- <[entity].health.is[less].to[15]>
  definitions: entity
  script:
  - foreach <[entity].location.find.players.within[30]> as:player:
    - inject spawn_custom_mob def:<entity[entity_dagon_deity]>|<[entity].location>
    - attack <[spawned_entity]> target:<[player]>