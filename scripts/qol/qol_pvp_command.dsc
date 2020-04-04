##PvP Command (Help/Settings)
qol_pvp_command:
  type: command
  debug: false
  name: pvp
  tab complete:
    - define arguments:<list[help|challenge|settings]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
    - else if <context.args.get[1].to_lowercase.replace[<&sp>].with[]> == challenge && <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>]>:
      - determine <server.list_online_players.parse[name]>
    - else if <context.args.get[1].to_lowercase.replace[<&sp>].with[]> == challenge && <context.args.size> == 2 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <server.list_online_players.parse[name].filter[starts_with[<context.args.get[2]>]]>
  help:
    - narrate "<&a>Use <&e>/pvp settings <&a>to change your PvP settings."
    - narrate "<&6>Use <&e>/pvp challenge <&6>for more information on Arena Challenges."
  challenge:
    - narrate "<&9><&n>Arena Challenges"
    - narrate "<&b>Use <&f>/challenge <name> <&b>to challenge another player."
    - narrate "<&b>To <&a>accept <&b>or <&c>decline <&b>a challenge, use <&f>/challenge accept/decline."
    - narrate "<&6>If a player accepts your challenge, they get to pick an arena to fight in."
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&c>Command argument missing! (Argument #1)"
    - else if <context.args.get[1].to_lowercase> == help:
      - inject locally help
    - else if <context.args.get[1].to_lowercase> == challenge:
      - inject locally challenge
    - else if <context.args.get[1].to_lowercase> == settings:
      - inventory open d:<inventory[qol_pvp_settings_inventory]>
    - else:
      - narrate "<&c>Command argument invalid! (Argument #1)"

##Challenge
qol_pvp_challenge_command:
  type: command
  debug: false
  name: challenge
  tab complete:
    - define arguments:<server.list_online_players.parse[name]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&c>Command argument missing! (Argument #1)"
    - if <server.match_player[<context.args.get[1]>]||null> != null:
      - if <server.match_player[<context.args.get[1]>].is_online>:
        #Send
        - flag <player> challenges_sent:->:<server.match_player[<context.args.get[1]>]>
        - narrate "<&6>You have successfully sent a challenge to <&e><server.match_player[<context.args.get[1]>].name>."
        - narrate "<&6>They have 5 minutes to accept it."
        #Receive
        - flag <server.match_player[<context.args.get[1]>]> challenges_received:->:<player>
        - run bb_notification def:<&e>⚠️<&c>CHALLENGER<&sp>APPROACHING<&sp><&e>⚠️|15s|yellow|1.0|<server.match_player[<context.args.get[1]>]>
        - narrate "<&c>You have been challenged by <&6><player.name> to a duel!"
        - narrate "<&c>You have 5 minutes to accept their challenge."
        - narrate "<&a>/challenge accept <&8>| <&c>/challenge decline"
        #Remove challenges
        - wait 5m
        - flag <player> challenges_sent:<-:<server.match_player[<context.args.get[1]>]>
        - flag <server.match_player[<context.args.get[1]>]> challenges_received:<-:<player>
      - else:
        - narrate "<&c>You cannot challenge this player, as they are not online!"
    - else:
      - narrate "<&c>Command argument invalid! (Argument #1)"
      
##Settings
#Inventory
qol_pvp_settings_inventory:
  type: inventory
  debug: false
  title: <&5>◆ <&c><&n><&l>Player VS Player<&r> <&5>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    dmg_n: <item[qol_pvp_settings_damage_notifier]>
    fx_n: <item[qol_pvp_settings_effect_notifier]>
  slots:
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    - "[w_filler] [dmg_n] [fx_n] [] [] [] [] [] [w_filler]"
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    
qol_pvp_settings_inventory_events:
  type: world
  debug: false
  events:
    on player clicks in qol_pvp_settings_inventory priority:10:
      - determine cancelled
    
    on player clicks in qol_pvp_settings_inventory:
      - if <context.item.script.yaml_key[setting]||null> != null && <context.item.script.yaml_key[options]||null> != null:
        - define setting:<context.item.script.yaml_key[setting]>
        - define options:<context.item.script.yaml_key[options].as_list>
        - if !<[options].contains[<yaml[player.<player.uuid>].read[pvp.<[setting]>]||null>]>:
          - yaml id:player.<player.uuid> set pvp.<[setting]>:<[options].get[1]>
        - define next:<[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].+[1]>
        - define new:<[options].get[<[next]>]||<[options].get[1]>>
        - yaml id:player.<player.uuid> set pvp.<[setting]>:<[new]>
        - narrate "<&d>Set PvP setting <&b><[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&5><[new].to_titlecase>."
        - inventory open d:<inventory[qol_pvp_settings_inventory]>

#Items
qol_pvp_settings_damage_notifier:
  type: item
  debug: false
  material: stone
  display name: <&c>Damage Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: damage_notifier
  options: bossbar|chat|false

qol_pvp_settings_effect_notifier:
  type: item
  debug: false
  material: stone
  display name: <&d>Effect Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: effect_notifier
  options: chat|bossbar|false
