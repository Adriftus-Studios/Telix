player_profile_events:
  type: world
  debug: false
  events:
    on player right clicks entity:
      - if <context.entity.type> == player:
        - narrate 1