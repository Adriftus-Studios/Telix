
test_dialog:
  type: yaml data
  character_name: <&a><&lb><&6>Guide<&a><&rb><&6>
  dialog:
    start:
      actions:
      - say What would you like to know? (Click One)
      - offer options
      options:
      - Tell me the basics|basics1
    basics1:
      actions:
      - say todo
      - wait 10s
      - say 2do

play_dialog:
  type: task
  definitions: script|path
  script:
  - define script:<script[<[script]>]>
  - execute as_player "dialog <[script].name> <[path]||start>"

dialog_command:
  type: command
  name: dialog
  script:
  - if <context.args.get[1]> == quest_start:
    - run start_quest def:<context.args.get[2]>
  - if <npc.location||null> != null:
    - if <player.location.distance[<npc.location||null>]||11> > 10:
      - stop
  - if <context.args.size||0> >= 2:
    - define script:<script[<context.args.get[1]>]>
    - define option:<context.args.remove[1].separated_by[<&sp>]>
    - foreach <[script].yaml_key[dialog.<[option]>.actions]> as:action:
      - inject process_dialog_command

process_dialog_command:
  type: task
  definitions: script|option|action
  script:
  - if <[action].parsed.starts_with[say]>:
    - narrate <[script].yaml_key[character_name].parsed><&sp><&l><&3><&co><&r><&sp><&b><[action].parsed.substring[4].trim>
    - wait 1s
  - else if <[action].parsed.starts_with[offer]>:
    - if <[action].parsed.substring[6].trim> == options:
      - foreach <[script].yaml_key[dialog.<[option]>.options]> as:option:
        - narrate "<&b><element[<&3> - <[option].split[|].get[1].trim.parsed>].on_click[/dialog <[script].name> <[option].split[|].get[2]>]>"
  - else if <[action].parsed.starts_with[quest]>:
    - if <[action].parsed.substring[7].trim.starts_with[start]>:
      - define quest:<script[<[action].substring[13]>]>
      - define status:<proc[applicable_for_quest].context[<[quest].name>]>
      - if <[status]> == true:
        - run start_quest def:<[quest].name>
      - else:
        - narrate <&c><[status]>
        - stop
  - else if <[action].parsed.starts_with[wait]>:
    - wait <[action].substring[6]>
  - else if <[action].parsed.starts_with[stop]>:
    - stop
  - else if <[action].parsed.starts_with[if]>:
    - define result:<[action].substring[4].parsed.split[<&sp>then<&sp>].get[1]>
    - if <[result].starts_with[!]>:
      - if <[result].substring[2]> == true:
        - define result:false
      - else if <[result].substring[2]> == false:
        - define result:true
      - else:
        - announce to_flagged:debug "<&c>Invalid if Statement in dialog script <[script].name> ( <[result]> )!"
        - announce to_flagged:debug "<&c>File path: <[script].filename>"
        - stop
    - else:
      - if <[result]> != true || <[result]> != false:
        - announce to_flagged:debug "<&c>Invalid if Statement in dialog script <[script].name> ( <[result]> )!"
        - announce to_flagged:debug "<&c>File path: <[script].filename>"
        - stop
    - if <[result]> != <[action].substring[4].parsed>:
      - define cmd:<[action].substring[4].split[<&sp>then<&sp>].get[2]>
      - if <[result]> == true:
        - ~run process_dialog_command def:<[script]>|<[cmd]>
  - else:
    - execute as_op "ex <[action].parsed.trim>" silent