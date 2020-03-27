player_profile_events:
  type: world
  debug: false
  events:
    on player clicks player:
      - narrate 1
    on script generates error:
      - narrate 12
    on server generates exception:
      - narrate 13