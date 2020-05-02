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
    - narrate "<&b>Use <&f>/challenge <&lt>name<&gt> <&b>to challenge another player."
    - narrate "<&b>To <&a>accept <&b>or <&c>decline <&b>a challenge, use <&f>/challenge accept/decline."
    - narrate "<&6>If a player accepts your challenge, they get to pick an arena to fight in."
  script:
    - if <context.args.get[1]||null> == null:
      - inject locally help
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
    - define args1:<list[send|accept|decline]>
    - define args2:<server.list_online_players.parse[name]>
    - if <context.args.size||0> == 0:
      - determine <[args1]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[args1].filter[starts_with[<context.args.get[1]>]]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>]>:
      - determine <[args2]>
    - else if <context.args.size> == 2 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[args2].filter[starts_with[<context.args.get[2]>]]>
  send:
    #Send
    - flag <[sender]> challenges_sent:->:<[receiver]>
    - narrate "<&6>You have successfully sent a challenge to <&e><[receiver].name>."
    - narrate "<&6>They have 5 minutes to accept it."
    #Receive
    - flag <[receiver]> challenges_received:->:<[sender]>
    - run bb_notification def:<&6>⚠<&sp><&c>CHALLENGER<&sp>APPROACHING<&sp><&6>⚠|15s|yellow|1|<[receiver]>
    - narrate "<&c>You have been challenged by <&6><[sender].name> to a duel!" targets:<[receiver]>
    - narrate "<&c>You have 5 minutes to accept their challenge." targets:<[receiver]>
    - narrate "<&a>/challenge accept <[sender].name><&8>| <&c>/challenge decline <[sender].name>." targets:<[receiver]>
    #Remove challenges
    - wait 5m
    - flag <[sender]> challenges_sent:<-:<[receiver]>
    - flag <[receiver]> challenges_received:<-:<[sender]>
  revoke:
    #Remove challenges
    - flag <[sender]> challenges_sent:<-:<[receiver]>
    - flag <[receiver]> challenges_received:<-:<[sender]>
    - narrate "wip"
  accept:
    #Sender
    - flag <player> challenges_received:<-:<server.match_player[<context.args.get[2]>]>
    #Receiver
    - flag <server.match_player[<context.args.get[2]>]> challenges_received:<-:<player>
    - narrate "wip lmao"
  decline:
    #Sender
    - flag <server.match_player[<context.args.get[2]>]> challenges_received:<-:<player>
    #Receiver
    - flag <player> challenges_received:<-:<server.match_player[<context.args.get[2]>]>
    - narrate "wip lol"
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&c>Command argument missing! (Argument #1)"
      - stop
    - else if <context.args.get[2]||null> == null:
      - narrate "<&c>Command argument missing! (Argument #2)"
      - stop
    - else if <context.args.get[1].to_lowercase> == send:
      - if <server.match_player[<context.args.get[2]>]||null> != null:
        - if <server.match_player[<context.args.get[2]>].is_online> && <player> != <server.match_player[<context.args.get[2]>]>:
          - define sender:<player>
          - define receiver:<server.match_player[<context.args.get[2]>]>
          - inject locally send
        - else:
          - narrate "<&c>You cannot challenge this player."
      - else:
        - narrate "<&c>Command argument invalid! (Argument #2)"
    - else if <context.args.get[1].to_lowercase> == revoke:
      - if <server.match_player[<context.args.get[2]>]||null> != null:
        - if <server.match_player[<context.args.get[2]>].is_online>:
          - inject locally decline
        - else:
          - narrate "<&c>This player is not online!"
          - inject locally revoke
      - else:
        - narrate "<&c>Command argument invalid! (Argument #2)"
    - else if <context.args.get[1].to_lowercase> == accept:
      - if <server.match_player[<context.args.get[2]>]||null> != null:
        - if <server.match_player[<context.args.get[2]>].is_online>:
          - inject locally accept
        - else:
          - narrate "<&c>This player is not online!"
          - inject locally decline
      - else:
        - narrate "<&c>Command argument invalid! (Argument #2)"
    - else if <context.args.get[1].to_lowercase> == decline:
      - if <server.match_player[<context.args.get[2]>]||null> != null:
        - if <server.match_player[<context.args.get[2]>].is_online>:
          - inject locally decline
        - else:
          - narrate "<&c>This player is not online!"
          - inject locally decline
      - else:
        - narrate "<&c>Command argument invalid! (Argument #2)"
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
    dmg_f: <item[qol_pvp_settings_damage_flash]>
    pwr_f: <item[qol_pvp_settings_power_flash]>
  slots:
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    - "[w_filler] [dmg_n] [fx_n] [dmg_f] [pwr_f] [] [] [] [w_filler]"
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    
qol_pvp_settings_inventory_events:
  type: world
  debug: false
  events:
    on player clicks in qol_pvp_settings_inventory priority:10:
      - determine cancelled
    
    on player left clicks in qol_pvp_settings_inventory:
      - if <context.item.script.yaml_key[setting]||null> != null && <context.item.script.yaml_key[options]||null> != null:
        - define setting:<context.item.script.yaml_key[setting]>
        - define options:<context.item.script.yaml_key[options].as_list>
        - if !<[options].contains[<yaml[player.<player.uuid>].read[pvp.<[setting]>]||null>]>:
          - yaml id:player.<player.uuid> set pvp.<[setting]>:<[options].first>
        - define next:<[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].+[1]>
        - define new:<[options].get[<[next]>]||<[options].first>>
        - yaml id:player.<player.uuid> set pvp.<[setting]>:<[new]>
        - actionbar "<&d>Set PvP setting <&b><[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&e><[new].to_titlecase>."
        - inventory open d:<inventory[qol_pvp_settings_inventory]>
    on player right clicks in qol_pvp_settings_inventory:
      - if <context.item.script.yaml_key[setting]||null> != null && <context.item.script.yaml_key[options]||null> != null:
        - define setting:<context.item.script.yaml_key[setting]>
        - define options:<context.item.script.yaml_key[options].as_list>
        - if !<[options].contains[<yaml[player.<player.uuid>].read[pvp.<[setting]>]||null>]>:
          - yaml id:player.<player.uuid> set pvp.<[setting]>:<[options].first>
        - define prev:<[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].-[1]>
        - if <[prev]> == 0:
          - define new:<[options].last>
        - else:
          - define new:<[options].get[<[prev]>]>
        - yaml id:player.<player.uuid> set pvp.<[setting]>:<[new]>
        - actionbar "<&d>Set PvP setting <&b><[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&e><[new].to_titlecase>."
        - inventory open d:<inventory[qol_pvp_settings_inventory]>

#Items
qol_pvp_settings_damage_notifier:
  type: item
  debug: false
  material: stone
  display name: <&c>Damage Notifier
  lore:
    - "<&7>Display damage amount when attacking."
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier].to_titlecase||<script.as_item.nbt[options].get[1].to_titlecase>>"
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
    - "<&7>Display effects given when attacking."
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.effect_notifier].to_titlecase||<script.as_item.nbt[options].get[1].to_titlecase>>"
  mechanisms:
    custom_model_data: 0
  setting: effect_notifier
  options: chat|bossbar|disabled
  
qol_pvp_settings_damage_flash:
  type: item
  debug: false
  material: stone
  display name: <&4>Damage Flash
  lore:
    - "<&7>Flash the actionbar when taking damage."
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_flash].to_titlecase||<script.as_item.nbt[options].get[1].to_titlecase>>"
  mechanisms:
    custom_model_data: 0
  setting: damage_flash
  options: both|values|dot|disabled
  
qol_pvp_settings_power_flash:
  type: item
  debug: false
  material: stone
  display name: <&3>Power Flash
  lore:
    - "<&7>Flash the actionbar when using an ability."
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.power_flash].to_titlecase||<script.as_item.nbt[options].get[1].to_titlecase>>"
  mechanisms:
    custom_model_data: 0
  setting: power_flash
  options: both|values|dot|disabled
