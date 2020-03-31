
entity_drowned:
  type: entity
  entity_type: drowned
  custom_name: Drowned
  max_health: 25
  health: 25
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
      max_quantity: 3
      min_quantity: 1
      time: night
      aggressive_on_spawn: true
      chance: 1

entity_boomboom:
  type: entity
  definitions: entity
  entity_type: cow
  custom_name: BoomBoom
  custom:
    aggressive: true
    xp_dropped: 3
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
      chance: 1
    events:
      on attacked:
        - wait 1t
        - if <[entity].health> > 0:
          - hurt 1 <player> source:<[entity]>
          - explode power:5 <[entity].location> fire breakblocks
        
entity_direwolf:
  type: entity
  entity_type: wolf
  custom_name: Direwolf
  max_health: 5
  health: 5
  speed: 0.4
  custom:
    xp_dropped: 2
    spawning_conditions:
      world: tor_mainland
      biome: forest|birch_forest|birch_forest_hills|dark_forest|flower_forest|tall_birch_forest|dark_forest_hills
      every: 5m
      air: false
      max_y: 100
      min_y: 0
      max_distance: 40
      min_distance: 30
      water: false
      max_quantity: 1
      min_quantity: 3
      time: night
      aggressive_on_spawn: true
      chance: 1

entity_hyena:
  type: entity
  entity_type: wolf
  custom_name: Hyena
  max_health: 19
  health: 19
  speed: 0.3
  custom:
    xp_dropped: 2
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 20m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 2
      min_quantity: 1
      time: day|morning
      aggressive_on_spawn: true
      chance: 1

entity_elk:
  type: entity
  entity_type: cow
  custom_name: Elk
  max_health: 20
  health: 20
  speed: 0.2
  custom:
    xp_dropped: 3
    spawning_conditions:
      world: tor_mainland
      biome: wooded_hills|jungle_hills|birch_forest_hills|swamp_hills|tall_birch_hills|dark_forest_hills|giant_spruce_taiga_hills|bamboo_jungle_hills|plains|sunflower_plains
      every: 20m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 4
      min_quantity: 1
      time: all
      aggressive_on_spawn: false
      chance: 1

entity_highland_cattle:
  type: entity
  entity_type: cow
  custom_name: Highland Cattle
  max_health: 25
  health: 25
  speed: 0.2
  custom:
    xp_dropped: 3
    spawning_conditions:
      world: tor_mainland
      biome: plains|sunflower_plains
      every: 20m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 4
      min_quantity: 1
      time: all
      aggressive_on_spawn: false
      chance: 1

entity_sand_rat:
  type: entity
  entity_type: silverfish
  custom_name: Sand Rat
  max_health: 10
  health: 10
  speed: 0.2
  custom:
    xp_dropped: 1
    spawning_conditions:
      world: tor_mainland
      biome: desert|desert_hills|desert_lakes|beach
      every: 10m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 7
      min_quantity: 1
      time: all
      aggressive_on_spawn: true
      chance: 1

entity_desert_dweller:
  type: entity
  entity_type: pillager
  custom_name: Desert Dweller
  max_health: 20
  health: 20
  speed: 0.2
  custom:
    xp_dropped: 10
    spawning_conditions:
      world: tor_mainland
      biome: desert|desert_hills|desert_lakes|beach
      every: 15m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: day
      aggressive_on_spawn: true
      chance: 1

entity_desert_priest:
  type: entity
  entity_type: evoker
  custom_name: Desert Priest
  max_health: 55
  health: 55
  speed: 0.1
  custom:
    xp_dropped: 15
    spawning_conditions:
      world: tor_mainland
      biome: desert|desert_hills|desert_lakes|beach
      every: 20m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: day
      aggressive_on_spawn: true
      chance: 1

entity_mountain_golem:
  type: entity
  entity_type: iron_golem
  custom_name: Mountain Golem
  max_health: 120
  health: 120
  speed: 0.1
  custom:
    xp_dropped: 20
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 20m
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
      chance: 1

entity_desert_golem:
  type: entity
  entity_type: iron_golem
  custom_name: Tomb Golem
  max_health: 1000
  health: 240
  speed: 0.1
  custom:
    kill_number: 0
    xp_dropped: 40
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 20m
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
      chance: 1

entity_mountain_golem3:
  type: entity
  entity_type: iron_golem
  custom_name: Mountain Golem3
  max_health: 1000
  health: 450
  speed: 0.1
  custom:
    xp_dropped: 20
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 20m
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
      chance: 1

entity_mountain_golem4:
  type: entity
  entity_type: iron_golem
  custom_name: Mountain Golem4
  max_health: 1000
  health: 740
  speed: 0.1
  custom:
    xp_dropped: 20
    spawning_conditions:
      world: tor_mainland
      biome: mountains|snowy_mountains|mountain_edge|wooded_mountains|gravelly_mountains|taiga_mountains|snowy_taiga_mountains|modified_gravelly_mountains
      every: 20m
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
      chance: 1



entity_frost_golem:
  type: entity
  entity_type: iron_golem
  custom_name: Frost Golem
  max_health: 80
  health: 80
  speed: 0.2
  custom:
    xp_dropped: 20
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
      chance: 1

entity_icicle_guardian:
  type: entity
  entity_type: guardian
  custom_name: Icicle Guardian
  max_health: 70
  health: 70
  speed: 0.3
  custom:
    xp_dropped: 30
    spawning_conditions:
      world: tor_mainland
      biome: ocean|frozen_ocean|deep_ocean|warm_ocean|lukewarm_ocean|cold_ocean|deep_warm_ocean|deep_lukewarm_ocean|deep_cold_ocean|deep_frozen_ocean
      every: 40m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: true
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: true
      chance: 1

entity_icewolf:
  type: entity
  entity_type: wolf
  custom_name: Ice Wolf
  max_health: 14
  health: 14
  speed: 0.2
  custom:
    xp_dropped: 5
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
      chance: 1

entity_sky_moth:
  type: entity
  entity_type: bat
  custom_name: Sky Moth
  max_health: 8
  health: 8
  speed: 0.6
  custom:
    xp_dropped: 1
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 10m
      air: true
      max_y: 255
      min_y: 200
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 2
      min_quantity: 1
      time: all
      aggressive_on_spawn: false
      chance: 1

entity_jungle_moth:
  type: entity
  entity_type: bat
  custom_name: Jungle Moth
  max_health: 8
  health: 8
  speed: 0.6
  custom:
    xp_dropped: 1
    spawning_conditions:
      world: tor_mainland
      biome: jungle|jungle_hills|jungle_edge|modified_jungle|modified_jungle_edge|bamboo_jungle|bamboo_jungle_hills
      every: 10m
      air: true
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: all
      aggressive_on_spawn: false
      chance: 1

entity_frost_moth:
  type: entity
  entity_type: bat
  custom_name: Frost Moth
  max_health: 9
  health: 9
  speed: 0.6
  custom:
    xp_dropped: 1
    spawning_conditions:
      world: tor_mainland
      biome: snowy_tundra|snowy_mountains|snowy_beach|snowy_taiga|snowy_taiga_hills|snowy_taiga_mountains
      every: 10m
      air: true
      max_y: 255
      min_y: 0
      max_distance: 40
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: false
      chance: 1

entity_lost_soul:
  type: entity
  entity_type: stray
  custom_name: Lost Soul
  max_health: 80
  health: 80
  speed: 0.2
  custom:
    xp_dropped: 50
    spawning_conditions:
      world: tor_mainland
      biome: all
      every: 120m
      air: false
      max_y: 255
      min_y: 0
      max_distance: 60
      min_distance: 15
      water: false
      max_quantity: 1
      min_quantity: 1
      time: night
      aggressive_on_spawn: true
      chance: 1

entity_mountain_wolf:
  type: entity
  entity_type: wolf
  custom_name: Mountain Wolf
  max_health: 80
  health: 80
  speed: 0.2
  custom:
    xp_dropped: 4
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
      time: day
      aggressive_on_spawn: true
      chance: 1

entity_waterhag:
  type: entity
  entity_type: drowned
  custom_name_visible: true
  custom_name: Waterhag
  max_health: 70
  health: 70
  speed: 0.4
  custom:
    xp_dropped: 17
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
      chance: 1
