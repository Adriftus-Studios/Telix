join_and_leave_events:
    type: world
    events:
      on player logs out:
        - yaml id:player.<player.uuid> set logout_location:<player.location>

      on player joins:
        - wait 1t
        - if <yaml[player.<player.uuid>].read[logout_location]||null> == null:
          - teleport <location[spawn]>
          - narrate "<&a>Welcome to Telix! Where adventure meets RPG."
          - narrate "<&a>Please talk to the guide to begin your journey."
        - else:
          - teleport <yaml[player.<player.uuid>].read[logout_location]>
          - narrate "<&a><&l>Welcome back <player>!"