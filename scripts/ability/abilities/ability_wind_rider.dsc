ability_wind_rider:
  type: task
  name: wind_rider
  ability_tree: Elemental
  ability_type: active
  duration: 5
  points_to_unlock: 99
  power_cost: 10
  description: Launch yourself torwards your cursor, and ride the winds
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - shoot <player> destination:<player.location.forward[10]> speed:3
    - wait 15t
    - adjust <player> gliding:true
    - flag player wind_rider:true