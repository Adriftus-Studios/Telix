ability_fire_arrows:
  type: task
  name: fire_arrows
  ability_tree: Archery
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: For the next 15 second your arrows are fire arrows.
  icon:
    material: iron_nugget
    custom_model_data: 10
  script:
    - flag player fire_arrows:true duration:15s

abilities_fire_arrows_events:
  type: world
  events:
    on player shoots bow flagged:fire_arrows:
      - wait 1t
      - flag <context.projectile> fire_arrow:true duration:30s
      - while <context.projectile.is_spawned>:
        - playeffect fire <context.projectile.location> quantity:5
    
    on player damaged by projectile:
      - if <context.projectile.has_flag[fire_arrow]>:
        - burn <context.entity> 5