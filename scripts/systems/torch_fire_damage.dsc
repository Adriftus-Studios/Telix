torch_fire_damage:
  type: world
  events:
    on player damages entity with:torch:
      - narrate <context.cause>
      - narrate <context.projectile||null>
      - burn <context.entity>
