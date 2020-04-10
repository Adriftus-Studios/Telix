
# cosmetics command moved to cosmetics.dsc

qol_equipment_command:
  type: command
  debug: false
  name: equipment
  aliases:
    - equip
    - eq
  script:
    - inventory open d:<inventory[equipment_character]>

qol_statistics_command:
  type: command
  debug: false
  name: statistics
  aliases:
    - stats
    - st
  script:
    - inventory open d:<inventory[stats_character]>

qol_skills_command:
  type: command
  debug: false
  name: skills
  aliases:
    - sk
    - abilities
    - ab
  script:
    - inventory open d:<inventory[abilities_characterAbilityTrees]>
    
qol_recipebook_command:
  type: command
  debug: false
  name: recipebook
  aliases:
    - rb
  script:
    - inventory open d:<inventory[recipe_book_inventory]>

qol_ping_command:
  type: command
  debug: false
  name: ping
  tab complete:
    - define arguments:<server.list_online_players.exclude[<player>].parse[name]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&a>Your ping: <&b><player.ping>ms"
    - else if <server.list_online_players.parse[name].contains[<context.args.get[1]>]>:
      - narrate "<&a><server.match_player[<context.args.get[1]>].name>'s ping: <&b><server.match_player[<context.args.get[1]>].ping>ms"
    - else:
      - narrate "<&c>This player is not online!"
