freeze:
  type: command
  debug: true
  name: freeze
  description: Allows an admin to freeze a player in place.
  usage: /freeze (player)
  permission: dutilities.freeze
  tab complete:
    - if <context.args.is_empty||true>:
      - determine <server.list_online_players.parse[name]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <server.list_online_players.parse[name].filter[starts_with[<context.args.get[1]>]]>
  script:
    - if <context.arg.is_empty||true>:
      - flag player block_movement:true
      - narrate "<&e>Good Job! You <&b>froze<&e> yourself."
    - else:
      - define target <serer.match_online_player[<context.args.get[1]>]||null>
      - if <[target]> != null:
        - flag <[target]> block_movement:true
        - narrate "<&c>You have been <&b>frozen <&c> by <&a><player.name>" targets:<[target]>
        - narrate "<&e>You have <&b>frozen <[target].name><&e>."

unfreeze:
  type: command
  debug: true
  name: unfreeze
  description: Allows an admin to unfreeze a player.
  usage: /unfreeze (player)
  permission: dutilities.unfreeze
  tab complete:
    - if <context.args.is_empty||true>:
      - determine <server.list_online_players.parse[name]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <server.list_online_players.parse[name].filter[starts_with[<context.args.get[1]>]]>
    - else:
      - determine <list[]>
  script:
    - if <context.arg.is_empty||true>:
      - if !<player.has_flag[block_movement]>:
        - narrate "<&c>You are not frozen."
        - stop
      - flag player block_movement:!
      - narrate "<&c>You are now unfrozen."
    - else:
      - define target <serer.match_online_player[<context.args.get[1]>]||null>
      - if <[target]> != null:
        - if <[target].has_flag[block_movement]>:
          - narrate "<&c><[target].name> is not frozen."
          - stop
        - flag <[target]> block_movement:!
        - narrate "<&c>You have been <&b>unfrozen <&c> by <&a><player.name>" targets:<[target]>
        - narrate "<&e>You have <&b>unfrozen <[target].name><&e>."
      - else:
        - narrate "<&c>Unknown Target: <&e><context.args.get[1]><&e>."

frozen_handler:
  type: world
  events:
    on player walks flagged:block_movement:
      - determine cancelled
    
    on player jumps flagged:block_movement:
      - determine cancelled
