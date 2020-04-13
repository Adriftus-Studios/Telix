first_join_events:
    type: world
    events:
        on player joins for first time:
          - wait 1t
          - teleport <player> spawn
          - narrate "<&a>Welcome to Telix! Where adventure meets RPG."
          - narrate "<&a>Please talk to the guide to begin your journey."