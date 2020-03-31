torch_fire_damage:
  type: world
  events:
    on player damages entity by entity_attack with:torch:
      - burn <context.entity>
