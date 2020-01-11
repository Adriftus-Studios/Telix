food_override:
  type: world
  events:
    on delta time minutely:
      - foreach <server.list_online_players>:
        - adjust <[value]> saturation:1000

    on player joins:
      - adjust <player> saturation:1000