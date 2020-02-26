guild_settings:
  type: yaml data
  permissions:
  - manage_flags
  - edit_ranks
  - view_members
  - change_settings
  - place_flag
  - remove_flags
  - kick_members
  - invite_members

guild_command:
  type: command
  name: guild
  description: guild
  usage: /guild
  debug: true
  aliases:
  - "g"
  tab complete:
  - if <context.args.size||-1> != -1:
    - if <context.args.size> == 1:
      - define list:<list[invite|disband|kick|create|rank|accept]>
      - determine <[list].filter[starts_with[<context.args.get[1]>]]>
    - else:
      - if <player.flag[guild]||null> != null:
        - choose <context.args.get[1]>:
          - case rank:
            - if <context.args.size> == 2:
              - determine <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].list_keys[ranks].filter[starts_with[<context.args.get[2]>]]>
          - case invite:
            - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name]>
          - case kick:
            - determine <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[members].filter[is[=].to[<player>]].parse[name]>
          - default:
            - determine <list[]>
      - else:
        - choose <context.args.get[1]>:
          - case create:
          - default:
            - determine <list[]>
  script:
    - if <context.args.get[1]||null> == null:
      - if <player.flag[guild]||null> != null:
        - inventory open d:my_guild_gui
      - else:
        - inventory open d:new_guild_gui
    - else:
      - if <player.flag[guild]||null> == null:
        - choose <context.args.get[1]>:
          - case accept:
            - if <yaml[player.<player.uuid>].read[pending_guild_invitation]||null> != null:
              - if <yaml[guild.<yaml[player.<player.uuid>].read[pending_guild_invitation]>].read[pending_invitations].contains[<player>]>:
                - run accept_guild_invitation def:<player>|<yaml[player.<player.uuid>].read[pending_guild_invitation]>
              - else:
                - narrate "<&c>Your invitation has expired."
            - else:
              - narrate "<&c>You have no pending invitations."
          - default:
            - narrate "<&c>That is not a valid option"
      - else:
        - choose <context.args.get[1]>:
          - case kick:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[kick_members]>:
              - if <server.match_player[<context.args.get[2]>]||<server.match_offline_player[<context.args.get[2]>]||null>> != null:
                - define kicked:<server.match_player[<context.args.get[2]>]||<server.match_offline_player[<context.args.get[2]>]>>
                - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>]> > <yaml[guild.<[kicked].flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<[kicked].flag[guild_rank]>]>:
                  - run kick_from_guild def:<player.flag[guild]>|<player>|<[kicked]>
                - else:
                  - narrate "<&c>You cannot kick that player."
              - else:
                - narrate "<&c>Player not found."
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case invite:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[invite_members]>:
              - foreach <context.args.remove[1]> as:player:
                - if !<yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[pending_invitations].contains[<player>]>:
                  - run invite_to_guild def:<player.flag[guild]>|<player>|<server.match_player[<[player]>]>
                - else:
                  - narrate "<&c><[player].name> has already been invited."
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case disband:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> == <player>:
              - run disband_guild def:<player.flag[guild].replace[<&sp>].with[_]>
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - default:
            - narrate "<&c>That is not a valid option"

edit_guild_rank:
  type: task
  definitions: guild|rank|property|value
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if !<yaml[guild.<[guild]>].list_keys[ranks].contains[<[rank]>]>:
    - stop
  - if !<list[title|priority].contains[<[property]>]>:
    - stop
  - yaml id:guild.<[guild]> set ranks.<[rank]>.<[property]>:<[value]>

toggle_guild_rank_permission:
  type: task
  definitions: guild|rank|permission
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if !<yaml[guild.<[guild]>].list_keys[ranks].contains[<[rank]>]>:
    - stop
  - if !<list[title|priority].contains[<[property]>]>:
    - stop
  - yaml id:guild.<[guild]> set ranks.<[rank]>.<[property]>:<[value]>

kick_from_guild:
  type: task
  definitions: guild|kicker|kicked
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set members:<yaml[guild.<[guild]>].read[members].exclude[<[kicked]>]>
  - flag <[kicked]> guild_rank:!
  - flag <[kicked]> guild:!
  - if <[kicked].is_online>:
    - narrate player:<[kicked]> "<&c>You were kicked from the guild."
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&c><[kicker].name> has invited <[kicked].name> to the guild."

invite_to_guild:
  type: task
  definitions: guild|inviter|invited
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set pending_invitations:|:<[invited]>
  - yaml id:player.<[invited].uuid> set pending_guild_invitation:<[guild]>
  - if <[invited].is_online>:
    - narrate player:<[invited]> "<&6>You were invited to the guild '<yaml[guild.<[guild]>].read[name]>'."
    - narrate player:<[invited]> "<&6>To accept this invitation, type /guild accept"
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&6><[inviter].name> has invited <[invited].name> to the guild."

accept_guild_invitation:
  type: task
  definitions: player|guild
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set members:|:<[player]>
  - yaml id:player.<player.uuid> set pending_guild_invitation:!
  - yaml id:player.<player.uuid> set guild:<[guild]>
  - yaml id:player.<player.uuid> set guild_rank:<yaml[guild.<[guild]>].read[default_rank]>
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&6><[invited].as_player.name> has joined the guild."

create_guild:
  type: task
  definitions: guild|guild_name|guild_leader|guild_description
  script:
  - yaml create id:guild.<[guild]>
  - flag <player> guild:<[guild_name]>
  - flag <player> guild_rank:leader
  - yaml id:guild.<[guild]> set name:<[guild_name]>
  - yaml id:guild.<[guild]> set leader:<[guild_leader]>
  - yaml id:guild.<[guild]> set description:<[guild_description]>
  - yaml id:guild.<[guild]> set flag:i@white_banner
  - yaml id:guild.<[guild]> set members:|:<player>
  - foreach <list[manage_flags|edit_ranks|view_members|change_settings|place_flag|remove_flag|kick_members|invite_members]> as:perm:
    - yaml id:guild.<[guild]> set ranks.leader.permissions:|:<[perm]>
  - yaml id:guild.<[guild]> set ranks.leader.title:Leader
  - yaml id:guild.<[guild]> set ranks.leader.priority:1000
  - yaml id:guild.<[guild]> set default_rank:Peasent
  - yaml id:guild.<[guild]> set ranks.peasent.title:Peasent
  - yaml id:guild.<[guild]> set ranks.leader.priority:1
  - announce "<&6><[guild_leader].display_name> has created the guild <[guild_name]>"
  - yaml savefile:data/globalData/guilds/<server.flag[server.name]>/<[guild]>.yml id:guild.<[guild]>

disband_guild:
  type: task
  debug: true
  definitions: guild
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if <[guild]||null> == null:
    - stop
  - foreach <yaml[guild.<[guild]>].list_keys[flags]> as:flag:
    - run remove_guild_flag def:<[flag]>
  - foreach <yaml[guild.<[guild]>].read[members]> as:player:
    - flag <[player].as_player> guild:!
    - flag <[player].as_player> guild_rank:!
  - announce "<&6>The Guild <yaml[guild.<[guild]>].read[name]> has been disbanded!"
  - yaml unload id:guild.<[guild]>
  - adjust server delete_file:data/globalData/guilds/<server.flag[server.name]>/<[guild]>.yml

remove_guild_flag:
  type: task
  definitions: flag
  script:
    - define loc:<entity[<[flag]>].location.sub[l@0.5,0,0.5,entity[<[flag]>].location.world.name]>
    - modifyblock <[loc]> air
    - remove <entity[<[flag]>]>

guild_events:
  type: world
  debug: true
  events:
    on server starts:
    - yaml create id:server.guilds
    - foreach <server.list_files[data/globalData/guilds/<server.flag[server.name]>]> as:guild:
      - yaml load:data/globalData/guilds/<server.flag[server.name]>/<[guild]> id:guild.<[guild]>
      - yaml id:server.guilds set all_guilds:|:<[guild]>
    on shutdown:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalData/guilds/<server.flag[server.name]>/<[value].to_lowercase.replace[guild.].with[]>.yml id:<[value]>
    on script reload:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalData/guilds/<server.flag[server.name]>/<[value].to_lowercase.replace[guild.].with[]>.yml id:<[value]>
    on player places block:
    - if <context.item_in_hand.script.name> == guild_flag:
      - if <player.flag[guild]||null> != null:
        - define guild:<player.flag[guild]>
        - define location:<context.location>
        - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[200]>
        - foreach <[nearby_flags]> as:flag:
          - if <[flag].custom_name.strip_color> != <yaml[guild.<[guild]>].read[name]>:
            - narrate "<&6>You are too close to another guild's flag."
            - determine cancelled
            - stop
        - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[place_flag]>:
          - run place_guild_flag def:<[guild]>|<[location]>
      - else:
        - narrate "<&6>You are not in a guild."
        - determine passively cancelled
    - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[50]>
    - foreach <[nearby_flags]> as:flag:
      - if <[flag].custom_name.strip_color> != <yaml[guild.<player.flag[guild]>].read[name]>:
        - narrate "<&6>You cannot build in another guild's territory."
        - determine cancelled
        - stop
    on player breaks block:
    - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[50]>
    - foreach <[nearby_flags]> as:flag:
      - if <[flag].custom_name.strip_color> != <yaml[guild.<player.flag[guild]>].read[name]>:
        - narrate "<&6>You cannot break blocks in another guild's territory."
        - determine cancelled
        - stop
    on player clicks block:
    - define flags:<context.location.add[<l@0.5,0,0.5,<context.location.world.name>>].find.entities[guild_flag_indicator].within[0.1]>
    - if !<[flags].is_empty>:
      - define flag:<[flags].get[1].uuid>:
      - if <player.flag[guild]||null> != null:
        - define guild:<player.flag[guild]>
        - if <yaml[guild.<[guild]>].list_keys[flags].contains[<[flag]>]>:
          - if <yaml[guild.<[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
            - inventory open d:<inventory[guild_flag_<[guild]>_<context.location>]>
            - determine passively cancelled
    on player signs book:
    - if <context.book> == <item[new_guild_book]>:
      - if <player.flag[guild]||null> != null:
        - narrate <&6>You are already in a guild.
        - determine passively NOT_SIGNING
        - stop
      - run create_guild def:<context.title.to_lowercase.replace[<&sp>].with[_]>|<context.title>|<player>|<context.pages.get[1]>

new_guild_book:
  type: item
  material: writable_book

place_guild_flag:
  type: task
  definitions: guild|location
  script:
  - spawn guild_flag_indicator[custom_name=<&6><yaml[guild.<[guild]>].read[name]>] <[location].add[<l@0.5,0,0.5,<[location].world.name>>]>
  - note <inventory[guild_flag_gui]> as:guild_flag_<[guild]>_<[location]>
  - yaml id:guild.<[guild]> set flags.<[guild]>_flag_<[location]>.location:<[location].simple>
  - yaml id:guild.<[guild]> set flags.<[guild]>_flag_<[location]>.name:flag<yaml[guild.<[guild]>].list_keys[flags].size>
  - yaml id:guild.<[guild]> set flags.<[guild]>_flag_<[location]>.health:5000

guild_flag_indicator:
  type: entity
  entity_type: armor_stand
  gravity: false
  custom_name_visible: true
  invulnerable: true
  visible: false
  
guild_flag:
  type: item
  material: white_banner
  display name: <&7>Guild Flag

guilds_leave_btn:
  type: item
  material: snow
  display name: <&9>Leave Guild

guilds_manage_claim_flags:
  type: item
  material: snow
  guild_permission: manage_claim_flags
  display name: <&9>Manage Claim Flags

guilds_edit_ranks_btn:
  type: item
  material: snow
  guild_permission: edit_ranks
  display name: <&9>Edit Guild Ranks
  
guilds_view_info_btn:
  type: item
  material: snow
  display name: <&9>View Information

guilds_view_members_btn:
  type: item
  material: snow
  guild_permission: view_members
  display name: <&9>View Members

guilds_settings_btn:
  type: item
  material: snow
  guild_permission: change_settings
  display name: <&9>Change Settings

new_guild_btn:
  type: item
  material: snow
  equipment_rating: 0
  display name: "<&c>Create a new Guild"

new_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>No Guild<&r> <&6>◆
  size: 27
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [new_guild_btn] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
  
my_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆ <&a><&n><&l><yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[name]><&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

edit_guild_ranks_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Guild Ranks<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flag_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Flag<&r> <&6>◆
  size: 27
  procedural items:
    - define flag:<player.flag[context]>
    - define flag_health:<yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>
    - define flag_name:<yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>
    - define items:|:<item[guild_flag_health_icon].with[lore=<&c><&chr[2764]><&sp><[flag_health]>].with[display_name=<&r><&a><[flag_name]>]>|<item[guild_flag_rename_btn]>|<item[guild_flag_destroy_btn]>
    - determine <[items]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flag_health_icon:
  type: item
  material: snow

guild_flag_rename_btn:
  type: item
  material: snow
  display name: <&6>Rename Flag

guild_flag_destroy_btn:
  type: item
  material: snow
  display name: <&6>Destroy Flag

guild_gui_events:
  type: world
  events:
    on player opens edit_guild_ranks_gui:
    - define btns:<list[guilds_view_info_btn|guilds_view_members_btn|guilds_edit_ranks_btn|guilds_manage_claim_flags|guilds_settings_btn|guilds_leave_btn]>
    - foreach <[btns]> as:btn:
      - inventory add d:<context.inventory> o:<item[<[btn]>]>
    on player clicks in my_guild_gui:
    - if <context.raw_slot> < 36:
      - determine passively cancelled
    on player clicks guilds_view_info_btn in my_guild_gui:
    - if <context.raw_slot> < 36:
    on player clicks in new_guild_gui:
    - if <context.raw_slot> < 27:
      - determine passively cancelled
    on player clicks in guild_flag_gui:
    - if <context.raw_slot> < 27:
      - determine passively cancelled
    on player clicks new_guild_btn in new_guild_gui:
    - if <context.raw_slot> < 27:
      - inventory add d:<player.inventory> o:<item[new_guild_book]>
    on player clicks guild_flag_destroy_btn in guild_flag_gui:
    - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[destroy_flag]>:
    - foreach <yaml[guild.<[guild]>].read[members]> as:player:
      - narrate "<&6><yaml[guild.<[guild]>].read[flags.<[flag]>.name]> at <[loc].simple.formatted.split[ in world].get[1]> was destroyed!"
