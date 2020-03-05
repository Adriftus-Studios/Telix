
debug_events:
  type: world
  events:
    on script generates error:
      - foreach <server.list_online_players.filter[has_flag[debug]]> as:player:
        - if <context.script||null> == null:
          - stop
        - adjust <queue> linked_player:<[player]>
        - narrate "<&c>|----------------------| <&4>Error<&c> |-----------------------|"
        - narrate "<&c> <context.message>"
        - narrate "<&c> Script: <context.script.name>"
        - narrate "<&c> File: <context.script.original_name>"
        - narrate "<&c> Line: <context.line>"
    on player clicks in inventory:
      - narrate <context.raw_slot>



debug_command:
  type: command
  name: dbug
  script:
  - if <player.has_flag[debug]>:
    - flag <player> debug:!
  - else:
    - flag <player> debug:true
