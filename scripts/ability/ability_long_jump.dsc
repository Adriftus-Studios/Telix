ability_long_jump:
  type: world
  events:
    on player jumps:
      - if <player.is_sneaking> && <player.is_sprinting>:
        - determine passively cancelled
        - shoot <player> d:<player.location.forward_flat[20]> height:2