ability_fire_arrows:
  type: task
  name: fire_arrows
  ability_tree: Archery
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Your arrows light themselves for the next 15 seconds.
  icon:
    material: iron_nugget
    custom_model_data: 110
  script:
    - flag player fire_arrows:true duration:15s
    - run bb_status def:fire_arrows|15s

abilities_fire_arrows_events:
  type: world
  events:
    on player shoots bow flagged:fire_arrows:
      - inject abilities_check
      - inject abilities_cost
      - wait 1t
      - flag <context.projectile> fire_arrow:true duration:30s
      - while <context.projectile.is_spawned>:
        - playeffect flame at:<context.projectile.location> quantity:15 offset:0.1
        - wait 1t
    
    on entity damaged by projectile:
      - if <context.projectile.has_flag[fire_arrow]>:
        - burn <context.entity> 6
