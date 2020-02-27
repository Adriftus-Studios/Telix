guild_settings:
  type: yaml data
  default_stats:
    flag_health: 5000
  rank_permissions:
  - manage_flags
  - edit_ranks
  - view_members
  - change_settings
  - place_flag
  - remove_flags
  - kick_members
  - invite_members
  rank_properties:
  - title
  - priority
  guild_properties:
  - blocks_owned
  - total_kills
  - total_flags_destroyed
  - total_heads_collected
  - age

guild_command:
  type: command
  name: guild
  description: guild
  usage: /guild
  aliases:
  - "g"
  tab complete:
  - if <context.args.size||-1> != -1:
    - if <context.args.size> == 1:
      - define list:<list[invite|disband|kick|create|rank|accept|leave|accept]>
      - determine <[list].filter[starts_with[<context.args.get[1]>]]>
    - else:
      - if <player.flag[guild]||null> != null:
        - choose <context.args.get[1]>:
          - case rank:
            - if <context.args.size> == 2:
              - determine <yaml[guild.<player.flag[guild]>].list_keys[ranks].filter[contains[<context.args.get[2]>]]>
            - else:
              - if <context.args.size> == 3:
                - determine <list[title|priority|permission]>
              - else:
                - if <context.args.get[3]> == permission:
                  - if <context.args.size> == 4:
                    - determine <list[add|remove]>
                  - else:
                    - if <context.args.get[4]> == add:
                      - determine <script[guild_settings].yaml_key[rank_permissions]>
                    - else if <context.args.get[4]> == remove:
                      - determine <yaml[guild.<player.flag[guild]>].read[rank.<context.args.get[2]>.permissions]>
          - case invite:
            - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name]>
          - case kick:
            - determine <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[members].filter[is[!=].to[<player>]].parse[name]>
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
            - narrate "<&c>That is not a valid option."
      - else:
        - choose <context.args.get[1]>:
          - case leave:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> != <player>:
              - run player_leave_guild def:<player.flag[guild]>|<player>
            - else:
              - narrate "<&c>You are the guild leader, you must disband in order to leave."
          - case rank:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_ranks]>:
              - if <context.args.size> == 2:
                - narrate "<&c>Not enough arguments."
              - else:
                - if <context.args.size> >= 3:
                  - define rank:<context.args.get[2]>
                  - if <context.args.get[3]> == create:
                    - run create_guild_rank def:<player.flag[guild]>|<[rank]>
                    - narrate "<&6>You have successfully created the guild rank '<[rank]>'."
                    - stop
                  - if !<yaml[guild.<player.flag[guild]>].list_keys[ranks].contains[<[rank]>]>:
                    - narrate "<&c>That rank does not exist."
                    - stop
                  - choose <context.args.get[3]>:
                    - case title:
                      - if <context.args.get[4]||null> != null:
                        - run edit_guild_rank_property def:<player.flag[guild]>|<[rank]>|title|<context.args.get[4]>
                        - narrate "<&6>You set the title for rank '<[rank]>' to <context.args.get[4]>."
                      - else:
                        - narrate "<&c>That is not a valid option."
                    - case priority:
                      - if <context.args.get[4]||null> != null:
                        - if <context.args.get[4].sub[0]||null> != null:
                          - run edit_guild_rank_property def:<player.flag[guild]>|<[rank]>|priority|<context.args.get[4]>
                          - narrate "<&6>You set the priority for rank '<[rank]>' to <context.args.get[4]>."
                        - else:
                          - narrate "<&c>That is not a valid number."
                      - else:
                        - narrate "<&c>That is not a valid option."
                    - case permission:
                      - if <context.args.get[4]||null> != null:
                        - if <script[guild_settings].yaml_key[rank_permissions].contains[<context.args.get[5]>]>:
                          - if <context.args.get[4]> == add:
                            - if !<yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.permissions].contains[<context.args.get[4]>]>:
                              - run edit_guild_rank_permission def:<player.flag[guild]>|<context.args.get[2]>|<context.args.get[5]>|add
                              - narrate "<&6>You gave the permission '<context.args.get[5]>' to '<[rank]>'."
                            - else:
                              - narrate "<&c>The rank '<context.args.get[4]>' already has that permission."
                          - else if <context.args.get[4]> == remove:
                            - if <yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.permissions].contains[<context.args.get[4]>]>:
                              - run edit_guild_rank_permission def:<player.flag[guild]>|<context.args.get[2]>|<context.args.get[5]>|remove
                              - narrate "<&6>You removed the permission '<context.args.get[5]>' from '<[rank]>'."
                            - else:
                              - narrate "<&c>The rank '<context.args.get[4]>' does not have that permission."
                          - else:
                            - narrate "<&c>That is not a valid option."
                        - else:
                          - narrate "<&c>That is not a valid permission."
                    - default:
                      - narrate "<&c>That is not a valid option."
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case kick:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[kick_members]>:
              - if <server.match_player[<context.args.get[2]>]||<server.match_offline_player[<context.args.get[2]>]||null>> != null:
                - define kicked:<server.match_player[<context.args.get[2]>]||<server.match_offline_player[<context.args.get[2]>]>>
                - if <player.flag[guild]> == <[kicked].flag[guild]>:
                  - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.priority]> > <yaml[guild.<[kicked].flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<[kicked].flag[guild_rank]>.priority]>:
                    - run kick_from_guild def:<player.flag[guild]>|<player>|<[kicked]>
                  - else:
                    - narrate "<&c>You cannot kick that player."
                - else:
                  - narrate "<&c>That player is not in your guild."
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
          - case flags:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
              - inventory open d:guild_flags_gui
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case disband:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> == <player>:
              - run disband_guild def:<player.flag[guild].replace[<&sp>].with[_]>
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - default:
            - narrate "<&c>That is not a valid option."

player_leave_guild:
  type: task
  definitions: guild|player
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set members:<-:<[player]>
  - flag <[player]> guild:!
  - flag <[player]> guild_rank:!
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&c><[player].name> has left the guild."
  - narrate "<&c>You have left the guild."

create_guild_rank:
  type: task
  definitions: guild|rank
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase>.title:<[rank]>
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase>.priority:1
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase>.permissions:|:view_members

edit_guild_rank_property:
  type: task
  definitions: guild|rank|property|value
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if !<yaml[guild.<[guild]>].list_keys[ranks].contains[<[rank]>]>:
    - stop
  - if !<script[guild_settings].yaml_key[rank_properties].contains[<[property]>]>:
    - stop
  - yaml id:guild.<[guild]> set ranks.<[rank]>.<[property]>:<[value]>

edit_guild_rank_permission:
  type: task
  definitions: guild|rank|permission|value
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if <list[add|remove].contains[<[value]>]>:
    - if <[value]> == remove:
      - yaml id:guild.<[guild]> set ranks.<[rank]>.permissions:<-:<[permission]>
    - else:
      - yaml id:guild.<[guild]> set ranks.<[rank]>.permissions:->:<[permission]>


kick_from_guild:
  type: task
  definitions: guild|kicker|kicked
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - narrate <yaml[guild.<[guild]>].read[members].exclude[<[kicked]>]>
  - yaml id:guild.<[guild]> set members:<-:<[kicked]>
  - flag <[kicked]> guild_rank:!
  - flag <[kicked]> guild:!
  - if <[kicked].is_online>:
    - narrate player:<[kicked]> "<&c>You were kicked from the guild."
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&c><[kicker].name> has kicked <[kicked].name> from the guild."

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
  - flag <[player]> guild:<[guild]>
  - flag <[player]> guild_rank:<yaml[guild.<[guild]>].read[default_rank]>
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&6><[player].name> has joined the guild."

create_guild:
  type: task
  definitions: guild|guild_name|guild_leader|guild_description
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml create id:guild.<[guild]>
  - flag <player> guild:<[guild]>
  - flag <player> guild_rank:leader
  - yaml id:guild.<[guild]> set name:<[guild_name]>
  - yaml id:guild.<[guild]> set leader:<[guild_leader]>
  - yaml id:guild.<[guild]> set description:<[guild_description]>
  - yaml id:guild.<[guild]> set flag:i@white_banner
  - yaml id:guild.<[guild]> set members:|:<player>
  - foreach <script[guild_settings].yaml_key[rank_permissions]> as:perm:
    - yaml id:guild.<[guild]> set ranks.leader.permissions:|:<[perm]>
  - yaml id:guild.<[guild]> set ranks.leader.title:Leader
  - yaml id:guild.<[guild]> set ranks.leader.priority:1000
  - yaml id:guild.<[guild]> set default_rank:Peasent
  - yaml id:guild.<[guild]> set ranks.peasent.title:Peasent
  - yaml id:guild.<[guild]> set ranks.peasent.priority:1
  - announce "<&6><[guild_leader].display_name> has created the guild <[guild_name]>"
  - yaml savefile:data/globalData/guilds/<server.flag[server.name]>/<[guild]>.yml id:guild.<[guild]>

disband_guild:
  type: task
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

place_guild_flag:
  type: task
  definitions: guild|location|player
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - spawn guild_flag_indicator[custom_name=<&6><yaml[guild.<[guild]>].read[name]>] <[location].add[<l@0.5,0,0.5,<[location].world.name>>]> save:indicator
  - note <inventory[guild_flag_gui]> as:flag_<[guild]>_<[location]>
  - narrate <entry[indicator].spawned_entity.uuid>
  - yaml id:guild.<[guild]> set flags.<[location]>.entity:<entry[indicator].spawned_entity.uuid>
  - yaml id:guild.<[guild]> set flags.<[location]>.location:<[location].simple>
  - yaml id:guild.<[guild]> set flags.<[location]>.name:flag<yaml[guild.<[guild]>].list_keys[flags].size>
  - yaml id:guild.<[guild]> set flags.<[location]>.health:5000
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:player:
    - narrate player:<[player]> "<&6><[player].name> has placed a guild flag."

remove_guild_flag:
  type: task
  definitions: guild|location|player
  script:
  - define location:<location[<[location]>]>
  - modifyblock <[location]> air
  - remove <entity[<yaml[guild.<[guild]>].read[flags.<location[<[location]>]>.entity]>]>
  - yaml id:guild.<[guild]> set flags.<[location]>:!
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:player:
    - narrate player:<[player]> "<&c><[player].name> has removed a guild flag. (<yaml[guild.<[guild]>].read[flags.<location[<[location]>]>.name]>)"

damage_guild_flag:
  type: task
  definitions: attacking_guild|defending_guild|flag|player
  script:


guild_events:
  type: world
  events:
    on delta time minutely every:1:
    - foreach <yaml.list.filter[starts_with[guild.]]> as:guild:
      - yaml id:<[guild]> set age:++
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
    - if <context.item_in_hand.script.name||null> == guild_flag:
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
          - run place_guild_flag def:<[guild]>|<[location]>|<player>
          - determine passively cancelled
      - else:
        - narrate "<&6>You are not in a guild."
        - determine passively cancelled
    on player breaks block:
    - if <context.material.name.ends_with[banner]>:
      - if <server.list_notables[inventories].filter[notable_name.starts_with[flag_]].filter[notable_name.ends_with[<context.location>]].size> != 0:
        - determine passively cancelled
        - define flag:<server.list_notables[inventories].filter[notable_name.starts_with[flag_]].filter[notable_name.ends_with[<context.location>]].get[1]>
        - narrate <[flag]>
        - define guild:<[flag].notable_name.replace[flag_].with[].split[_l@].get[1]>
        - define location:<location[<[flag].notable_name.replace[flag_].with[].split[_l@].get[2]>]>
        - define health:<yaml[guild.<[guild]>].read[flags.<[location]>.health]>
        - narrate <[health]>
    on player right clicks block:
    - if <inventory[flag_<player.flag[guild]||null>_<context.location||null>]||null> != null:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
        - inventory open d:<inventory[flag_<player.flag[guild]>_<context.location>]>
        - determine passively cancelled
      - else:
        - narrate "<&c>You do not have permission to manage guild flags."
    on player signs book:
    - if <context.book> == <item[new_guild_book]>:
      - narrate <context.title.to_lowercase.replace[<&sp>].with[_]>
      - if <player.flag[guild]||null> != null:
        - narrate "<&c>You are already in a guild."
        - determine passively NOT_SIGNING
        - stop
      - if <yaml.list.contains[guild.<context.title.to_lowercase.replace[<&sp>].with[_]>]>:
        - narrate "<&c>That guild already exists"
        - determine passively NOT_SIGNING
        - stop
      - narrate <context.title.to_lowercase.replace[<&sp>].with[_]>|<context.title>|<player>|<context.pages.get[1]>
      - run create_guild def:<context.title.to_lowercase.replace[<&sp>].with[_]>|<context.title>|<player>|<context.pages.get[1]>

new_guild_book:
  type: item
  material: writable_book

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
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flags_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Flags<&r> <&6>◆
  size: 54
  procedural items:
  - foreach <yaml[guild.<player.flag[guild]>].list_keys[flags]> as:flag:
    - define h:<yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>
    - if <yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]> < <script[guild_settings].yaml_key[default_stats.flag_health]>:
      - define flags:|:<item[guild_flag_btn_icon].with[display_name=<&a><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>;lore=<list[<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>]>;nbt=<[flag]>]>
    - else:
      - define flags:|:<item[guild_flag_btn_icon].with[display_name=<&c><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>;lore=<list[<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>]>;nbt=<[flag]>]>
  - determine <[flags]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flag_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Flag<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [guild_flag_health_icon] [guild_flag_rename_btn] [guild_flag_destroy_btn] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flag_btn_icon:
  type: item
  material: snow

guild_flag_health_icon:
  type: item
  material: snow
  display name: <&r><&a><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>
  lore:
  - "<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>"

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
    on player clicks in guild_flags_gui:
    - if <context.raw_slot> < 54:
      - determine passively cancelled
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
    - if <player.flag[guild]> == <context.inventory.notable_name.replace[flag_].with[].split[_l@].get[1]>:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[remove_flags]>:
        - run remove_guild_flag def:<player.flag[guild]>|<context.inventory.notable_name.replace[flag_].with[].split[_l@].get[2]>