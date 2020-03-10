
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
      aggressive_on_spawn: true

entity_frost_golem:
  type: entity
  entity_type: iron_golem
  custom_name: Frost Golem
  max_health: 80
  health: 80
  speed: 0.2
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: snowy_tundra|snowy_mountains|snowy_beach|snowy_taiga|snowy_taiga_hills|snowy_taiga_mountains
      every: 15m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: all
      aggressive_on_spawn: true

entity_icewolf:
  type: entity
  entity_type: wolf
  custom_name: Ice Wolf
  max_health: 14
  health: 14
  speed: 0.2
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: snowy_tundra|snowy_mountains|snowy_beach|snowy_taiga|snowy_taiga_hills|snowy_taiga_mountains
      every: 10m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 2
      time: all
      aggressive_on_spawn: true

custom_blizz_rod:
  type: item
  material: blue_ice
  display name: <&7>Blizz Rod
  mob_drops:
    1:
      dropped_by: entity_icewolf|entity_frost_golem
      chance: 4
      max_quantity: 2
      min_quantity: 1

entity_mountain_wolf:
  type: entity
  entity_type: wolf
  custom_name: Mountain Wolf
  max_health: 80
  health: 80
  speed: 0.2
  custom:
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 10m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 2
      time: all
      aggressive_on_spawn: true

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

custom_sharp_fang:
  type: item
  material: bone
  display name: <&7>Sharp Fang
  mob_drops:
    1:
      dropped_by: entity_direwolf|entity_mountain_wolf|entity_icewolf
      chance: 3
      max_quantity: 2
      min_quantity: 1
      
custom_animal_pelt:
  type: item
  material: leather
  display name: <&7>Animal Pelt
  mob_drops:
    1:
      dropped_by: entity_direwolf|entity_mountain_wolf|entity_icewolf
      chance: 2
      max_quantity: 1
      min_quantity: 1