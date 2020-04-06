error_handler_events:
  type: world
  debug: false
  events:
    on script generates error:
      - if <context.script||null> != null && <context.line||null> != null:
        - define cause:<player.name||None>
        - announce to_console "<&c>|----------------------| <&4>Error<&c> |-----------------------|"
        - announce to_console "<&c> <context.message>"
        - announce to_console "<&c> Player: <[cause]>"
        - announce to_console "<&c> Script: <context.script.name>"
        - announce to_console "<&c> File: <context.script.filename.replace[/home/minecraft/servers/telix-test/plugins/Denizen].with[]>"
        - announce to_console "<&c> Line: <context.line>"
        - foreach <server.list_players||<list[]>> as:player:
          - adjust <queue> linked_player:<[player]>
          - if <player.has_flag[debug]> && <player.is_online>:
            - narrate "<&c>|----------------------| <&4>Error<&c> |-----------------------|"
            - narrate "<&c> <context.message>"
            - narrate "<&c> Player: <[cause]>"
            - narrate "<&c> Script: <context.script.name>"
            - narrate "<&c> File: <context.script.filename.replace[/home/minecraft/servers/telix-test/plugins/Denizen].with[]>"
            - narrate "<&c> Line: <context.line>"
            - foreach <context.queue.definitions||<list[]>> as:definition:
              - define data:<context.queue.definition[<[definition]>]>
              - define "info:Type: <[data].type||Unknown>"
              - define "info:|:Script: <[data].script.name||None>"
              - choose <[data].type>:
                - case item:
                  - define "info:|:Material: <[data].material.name||Unknown>"
                  - if <[data].has_lore>:
                    - foreach <[data].lore> as:line:
                      - define "info:|:Lore line <[loop_index]>: <&r><[line]><&r>"
              - define "info:|:Raw: <[data]>"
              - define definitions:|:<&l><el@[<[definition]>].on_hover[<[info].separated_by[<&nl>]>]>
            - narrate "<&c> Definitions: <[definitions].separated_by[<&sp>]||None>"