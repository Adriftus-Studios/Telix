ability_high_jump:
  type: world
  events:
    on player jumps:
      - if <player.is_sneaking> && !<player.is_sprinting>:
        - determine passively cancelled
        - adjust <player> velocity:<location[0,0.7,0]>