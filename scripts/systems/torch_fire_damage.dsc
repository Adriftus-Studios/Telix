torch_fire_damage:
  type: world
  events:
    on player damages entity with:torch:
      - if <context.cause> != projectile:
        - burn <context.entity>
