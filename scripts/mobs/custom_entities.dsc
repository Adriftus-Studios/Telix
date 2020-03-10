
entity_drowned:
  type: entity
  entity_type: drowned
  custom_name: Drowned
  max_health: 70
  health: 70
  speed: 0.4
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 15m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 20
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: true

entity_boomboom:
  type: entity
  entity_type: cow
  custom_name: BoomBoom
  health: 20
  custom:
    aggressive: true
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 15m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 20
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: false
    ability_usage:
      - mob_ability_boomboom_explode

mob_ability_boomboom_explode:
  type: task
  name: mob_ability_boomboom_explode
  ability_tree: Nether
  cooldown: 10s
  warmup: 1s
  requires_target: true
  requires_target_in_sight: true
  definitions: entity
  script:
    - explode power:2 location:<[entity].location> fire
    - remove <[entity]>

entity_waterhag:
  type: entity
  entity_type: drowned
  custom_name_visible: true
  custom_name: Waterhag
  max_health: 70
  health: 70
  speed: 0.4
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 15m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 20
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: true

custom_waterhag_hand:
  type: item
  material: rotten_flesh
  display name: <&7>Waterhag's Hand
  mob_drops:
    1:
      dropped_by: entity_waterhag
      chance: 4
      max_quantity: 2
      min_quantity: 1

custom_venom_extract:
  type: item
  material: potion
  display name: <&7>Venom Extract
  mechanisms:
    flags: HIDE_POTION_EFFECTS
    color: 0,0,0
    potion_effects: poison,5,20
  mob_drops:
    1:
      dropped_by: entity_direwolf
      chance: 9
      max_quantity: 1
      min_quantity: 1
