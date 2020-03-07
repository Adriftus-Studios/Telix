
test_armorstand:
  type: entity
  entity_type: armor_stand
  equipment: <item[test_armorstand_head]>|<item[air]>|<item[air]>|<item[air]>

test_armorstand_head:
  type: item
  material: sponge
  mechanisms:
    custom_model_data: 1

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
      spawn_script: test_spawn_script

test_spawn_script:
  type: task
  script:
    - narrate 1

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
      dropped_by: entity_waterhag
      chance: 9
      max_quantity: 1
      min_quantity: 1

entity_direwolf:
  type: entity
  entity_type: wolf
  custom_name_visible: false
  custom_name: Direwolf
  max_health: 15
  health: 15
  speed: 0.2
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
      spawn_script: none
