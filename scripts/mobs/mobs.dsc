
entity_waterhag:
  type: entity
  entity_type: drowned
  custom_name_visible: true
  custom_name: Drowned
  max_health: 70
  health: 70
  speed: 0.4
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 5m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 20
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      spawn_script: none

entity_direwolf:
  type: entity
  entity_type: wolf
  custom_name_visible: true
  custom_name: Direwolf
  max_health: 25
  health: 25
  speed: 0.2
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 5m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 20
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      spawn_script: none
