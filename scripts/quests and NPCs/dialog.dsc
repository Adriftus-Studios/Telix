
test_dialog:
  type: yaml data
  character_name: <&a><&lb><&6>Guide<&a><&rb><&6>
  dialog:
    start:
      actions:
      - say What would you like to know? (Click One)
      - offer options
      options:
      - Tell me the basics
    Tell me the basics:
      actions:
      - say todo

play_dialog:
  type: task
  definitions: script
  script:
  - define script:<script[<[script]>]>
  - execute as_player "dialog <[script].name> start"

dialog_command:
  type: command
  name: dialog
  script:
  - if <player.location.distance[<npc.location>]||7> > 6:
    - stop
  - if <context.args.size> >= 2:
    - define script:<script[<context.args.get[1]>]>
    - define option:<context.args.remove[1].separated_by[<&sp>]>
    - foreach <[script].yaml_key[dialog.<[option]>.actions]> as:action:
      - if <[action].parsed.starts_with[say]>:
        - narrate <[script].yaml_key[character_name].parsed><&sp><[action].parsed.substring[4].trim>
        - wait <[action].parsed.substring[4].trim.split[].count[<&sp>].div[2]>s
      - else if <[action].parsed.starts_with[offer]>:
        - if <[action].parsed.substring[6].trim> == options:
          - foreach <[script].yaml_key[dialog.start.options]> as:option:
            - narrate "<&b><element[ - <[option].parsed>].on_click[/dialog <[script].name> <[option]>]>"
      - else if <[action].parsed.starts_with[quest]>:
        - narrate todo
      - else:
        - execute as_op "ex <[action].parsed.trim>"
