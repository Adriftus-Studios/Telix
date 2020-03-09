
entity_direwolf:
  type: entity
  entity_type: wolf
  custom_name: Direwolf
  max_health: 15
  health: 7
  speed: 0.4
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 5m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 40
      min_distance: 30
      water: false
      max_quantity: 3
      min_quantity: 5
      time: night
      aggressive: true

custom_direwolf_fang:
  type: item
  material: bone
  display name: <&7>Direwolf Fang
  mob_drops:
    1:
      dropped_by: entity_direwolf
      chance: 3
      max_quantity: 2
      min_quantity: 1
      
custom_direwolf_tail:
  type: item
  material: leather
  display name: <&7>Direwolf Tail
  mob_drops:
    1:
      dropped_by: entity_direwolf
      chance: 2
      max_quantity: 1
      min_quantity: 1
      
custom_direwolf_pelt:
  type: item
  material: leather
  display name: <&7>Direwolf Pelt
  mob_drops:
    1:
      dropped_by: entity_direwolf
      chance: 7
      max_quantity: 1
      min_quantity: 1