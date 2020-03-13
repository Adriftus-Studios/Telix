
debug_events:
  type: world
  events:
    on script generates error:
      - foreach <server.list_online_players> as:player:
        - adjust <queue> linked_player:<[player]>
        - if <[player].flag[debug]||null> != null:
          - narrate "<&c>|----------------------| <&4>Error<&c> |-----------------------|"
          - narrate "<&c> <context.message>"
          - narrate "<&c> Script: <context.script.name>"
          - narrate "<&c> File: <context.script.original_name>"
          - narrate "<&c> Line: <context.line>"
    on player clicks in inventory:
      - if <player.has_flag[debug]>:
        - narrate "<&c>|----------------------| <&4>Debug<&c> |-----------------------|"
        - narrate "<&c>Raw Slot: <context.raw_slot>"
        - narrate "<&c>Clicked Item: <context.item.script.name||<context.item.material.name>>"
        
debug_command:
  type: command
  name: dbug
  script:
  - if <player.has_flag[debug]>:
    - narrate "<&c>Debug Mode enabled for <player.name>"
    - flag <player> debug:!
  - else:
    - narrate "<&c>Debug Mode disabled for <player.name>"
    - flag <player> debug:true

