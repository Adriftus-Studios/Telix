combat_log_events:
  type: world
  debug: false
  events:
    on player damages player:
      - flag <context.damager> combat duration:45s
      - flag <context.entity> combat duration:45s
    on player quits:
      - if <player.has_flag[combat]>:
        - hurt <player.health> <player>
    on delta time secondly every:1:
      - foreach <server.list_online_players.filter[has_flag[combat]]> as:player:
        - adjust <queue> linked_player:<[player]>
        - if <player.flag[combat].expiration.in_seconds> < 1:
          - wait 1s
          - flag <player> combat:!
          - narrate "<&b>You are no longer in combat."