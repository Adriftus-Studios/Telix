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
    material: iron_nugget
    custom_model_data: 1
  script:
    - inject abilities_check
    - shoot <player> destination:<player.location.forward[10]> speed:3
    - wait 15t
    - inventory adjust d:<player.inventory> slot:39 material:<material[elytra]>
    - adjust <player> gliding:true
    - flag player wind_rider:true

abilities_wind_rider:
  type: world
  events:
    on player stops gliding flagged:wind_rider:
      - inventory adjust d:<player.inventory> slot:39 material:<material[golden_chestplate]>
      - flag <player> wind_rider:!