guild_settings:
  type: yaml data
  default_stats:
    flag_health: 5000
  rank_permissions:
  - manage_flags
  - edit_ranks
  - manage_members
  - change_settings
  - place_flag
  - remove_flags
  - kick_members
  - invite_members
  - manage_relations
  - access_bank
  - set_member_rank
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
  - if <context.args.size||0> != 0:
    - if <context.args.size> == 1:
      - if <context.args.get[1]> == invite:
        - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name]>
      - define list:<list[invite|disband|kick|create|rank|accept|leave|accept|bank]>
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
            - if <context.args.size> == 2:
              - if <context.args.get[2].size||null> > 0:
                - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name].filter[starts_with[<context.args.get[2]>]]>
              - else:
                - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name]>
          - case kick:
            - if <context.args.size> == 2:
              - if <context.args.get[2].size||null> > 0:
                - determine <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[members].filter[is[!=].to[<player>]].filter[is_online].parse[name].filter[starts_with[<context.args.get[2]>]]>
              - else:
                - determine <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[members].filter[is[!=].to[<player>]].filter[is_online].parse[name]>
          - case relation:
            - if <context.args.size> == 2:
              - determine <list[neutral|ally|enemy|truce]>
            - else:
              - define g:<context.raw_args.replace[relation<&sp><context.args.get[2]><&sp>]>
              - foreach <yaml.list.filter[starts_with[guild.]]>:
                - define list:|:<yaml[<[value]>].read[name]>
              - if <[g].length> == 1:
                - determine <[list]>
              - else:
                - determine <[list].filter[to_lowercase.starts_with[<[g].to_lowercase>]]>
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
          - case decline:
            - if <yaml[player.<player.uuid>].read[pending_guild_invitation]||null> != null:
              - run decline_guild_invitation def:<player>|<yaml[player.<player.uuid>].read[pending_guild_invitation]>
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
            - narrate TODO
            - stop
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
          - case bank:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[access_bank]>:
              - inventory open d:<inventory[guild_<player.flag[guild]>_bank]>
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case setflag:
            - if <player.item_in_hand.patterns||null> != null:
              - yaml id:guild.<player.flag[guild]> set flag:<player.item_in_hand>
            - else:
              - narrate "<&c>You are not holding a banner"
          - case flags:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
              - inventory open d:<inventory[guild_<player.flag[guild]>_flags]>
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
          - case disband:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> == <player>:
              - run disband_guild def:<player.flag[guild].replace[<&sp>].with[_]>
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - case relation:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_relations]>:
              - if <context.args.size> == 2:
                - narrate "<&c>That is not a valid option."
              - else:
                - define guild:<context.raw_args.replace[relation<&sp><context.args.get[2]><&sp>].to_lowercase.replace[<&sp>].with[_]>
                - if <player.flag[guild]> == <[guild]>:
                  - narrate "<&c>You cannot change the relation to your own guild"
                  - stop
                - if <yaml[guild.<[guild]>].read[name]||null> != null:
                  - narrate <player.flag[guild]>
                  - narrate <[guild]>
                  - choose <context.args.get[2]>:
                    - case enemy:
                      - if <yaml[guild.<[guild]>].read[relations.enemy].contains[<player.flag[guild]>]||false>:
                        - narrate "Your guild is already at war with <yaml[guild.<[guild]>].read[name]>"
                      - else:
                        - run change_guild_relation def:<player.flag[guild]>|<[guild]>|enemy|<player>
                    - case truce:
                      - if <yaml[guild.<[guild]>].read[relations.truce].contains[<player.flag[guild]>]||false>:
                        - narrate "<&3>You already have a truce with <yaml[guild.<[guild]>].read[name]>"
                      - else:
                        - if <yaml[guild.<player.flag[guild]>].read[relations.request.truce].contains[<[guild]>]||false>:
                          - run change_guild_relation def:<player.flag[guild]>|<[guild]>|truce|<player>
                        - else:
                          - if <yaml[guild.<[guild]>].read[relations.request.truce].contains[<player.flag[guild]>]||false>:
                            - narrate "<&3>You have already requested a truce with <yaml[guild.<[guild]>].read[name]>"
                          - else:
                            - yaml id:guild.<[guild]> set relations.request.truce:->:<player.flag[guild]>
                            - foreach <yaml[guild.<player.flag[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&3><player.name> has requested a truce with <yaml[guild.<[guild]>].read[name]>"
                            - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&3><yaml[guild.<player.flag[guild]>].read[name]> has requested a truce with your guild."
                    - case ally:
                      - if <yaml[guild.<[guild]>].read[relations.ally].contains[<player.flag[guild]>]||false>:
                        - narrate "<&b>You already have an alliance with <yaml[guild.<[guild]>].read[name]>"
                      - else:
                        - if <yaml[guild.<player.flag[guild]>].read[relations.request.ally].contains[<[guild]>]||false>:
                          - run change_guild_relation def:<player.flag[guild]>|<[guild]>|ally|<player>
                        - else:
                          - if <yaml[guild.<[guild]>].read[relations.request.ally].contains[<player.flag[guild]>]||false>:
                            - narrate "<&b>You have already requested a alliance with <yaml[guild.<[guild]>].read[name]>"
                          - else:
                            - yaml id:guild.<[guild]> set relations.request.ally:->:<player.flag[guild]>
                            - foreach <yaml[guild.<player.flag[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&b><player.name> has requested an alliance with <yaml[guild.<[guild]>].read[name]>"
                            - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&b><yaml[guild.<player.flag[guild]>].read[name]> has requested an alliance with your guild."
                    - case neutral:
                      - if <yaml[guild.<[guild]>].read[relations.neutral].contains[<player.flag[guild]>]||false>:
                        - narrate "<&a>You are already at peace with <yaml[guild.<[guild]>].read[name]>"
                      - else:
                        - if <yaml[guild.<player.flag[guild]>].read[relations.request.ally].contains[<[guild]>]||false>:
                          - run change_guild_relation def:<player.flag[guild]>|<[guild]>|neutral|<player>
                        - else:
                          - if <yaml[guild.<[guild]>].read[relations.request.neutral].contains[<player.flag[guild]>]||false>:
                            - narrate "<&a>You have already requested peace with <yaml[guild.<[guild]>].read[name]>"
                          - else:
                            - yaml id:guild.<[guild]> set relations.request.neutral:->:<player.flag[guild]>
                            - foreach <yaml[guild.<player.flag[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&a><player.name> has requested peace with <yaml[guild.<[guild]>].read[name]>"
                            - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
                              - narrate player:<[value]> "<&a><yaml[guild.<player.flag[guild]>].read[name]> has requested peace with your guild."
                - else:
                  - narrate "That guild does not exist."
            - else:
              - narrate "<&c>You do not have permission to run that command."
          - default:
            - narrate "<&c>That is not a valid option."

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

player_transfer_guild_leadership:
  type: task
  definitions: from|to
  script:
  - flag <[to]> guild_rank:<[from].flag[guild_rank]>
  - yaml id:guild.<[to].flag[guild]> set leader:<[to]>
  - flag <[from]> guild_rank:<yaml[guild.<player.flag[guild]>].read[default_rank]>
  - foreach <yaml[guild.<[from].flag[guild]>].read[members].parse[as_player].filter[is_online]>:
    - narrate targets:<[value]> "<&6><[from].name> has transferred guild leadership to <[to].name>"

set_guild_member_rank:
  type: task
  definitions: member|guild_rank
  script:
  - flag <[member]> guild_rank:<[guild_rank]>
  - foreach <yaml[guild.<[member].flag[guild]>].read[members].parse[as_player].filter[is_online]>:
    - narrate targets:<[value]> "<&6><[member].name>'s guild rank was set to <[guild_rank]>."

player_leave_guild:
  type: task
  definitions: guild|player
  script:
  - if <yaml[guild.<[player].flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> == <[player]>:
    - stop
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set members:<-:<[player]>
  - flag <[player]> guild:!
  - flag <[player]> guild_rank:!
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&c><[player].name> has left the guild."
  - narrate "<&c>You have left the guild."

delete_guild_rank:
  type: task
  definitions: guild|rank
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - if <yaml[guild.<[guild]>].read[default_rank]> == <[rank]>:
    - stop
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>:!
  - foreach <yaml[guild.<[guild]>].read[members]> as:member:
    - if <[member].as_player.flag[guild_rank]> == <[rank]>:
      - flag <[member].as_player> guild_rank:<yaml[guild.<[guild]>].read[default_rank]>

create_guild_rank:
  type: task
  definitions: guild|rank
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>:!
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>.title:<[rank]>
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>.priority:1
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>.permissions:|:view_members

rename_guild_rank:
  type: task
  definitions: guild|rank|new_name
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - narrate <[guild]>
  - narrate <[rank]>
  - narrate <[new_name]>
  - yaml id:guild.<[guild]> set ranks.<[new_name].to_lowercase.replace[<&sp>].with[_]>.permissions:<yaml[guild.<[guild]>].read[ranks.<[rank]>.permissions]>
  - yaml id:guild.<[guild]> set ranks.<[new_name].to_lowercase.replace[<&sp>].with[_]>.priority:<yaml[guild.<[guild]>].read[ranks.<[rank]>.priority]>
  - yaml id:guild.<[guild]> set ranks.<[new_name].to_lowercase.replace[<&sp>].with[_]>.title:<[new_name]>
  - yaml id:guild.<[guild]> set ranks.<[rank].to_lowercase.replace[<&sp>].with[_]>:!
  - foreach <yaml[guild.<[guild]>].read[members]> as:member:
    - if <[member].as_player.flag[guild_rank]> == <[rank]>:
      - flag <[member].as_player> guild_rank:<[new_name].to_lowercase.replace[<&sp>].with[_]>

kick_from_guild:
  type: task
  definitions: guild|kicker|kicked
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
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
    - narrate player:<[invited]> "<&6>You were invited to the guild <&2><yaml[guild.<[guild]>].read[name]><&6>! <&nl><&6>Click<&co> <&click[/guild accept]><&a><&l>ACCEPT<&end_click><&r><&6> or <&click[/guild decline]><&c><&l>DECLINE<&end_click>"
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&6><[inviter].name> has invited <[invited].name> to the guild."

decline_guild_invitation:
  type: task
  definitions: player|guild
  script:
  - define guild:<[guild].to_lowercase.replace[<&sp>].with[_]>
  - yaml id:guild.<[guild]> set pending_invitations:<-:<[invited]>
  - yaml id:player.<player.uuid> set pending_guild_invitation:!
  - narrate "<&6>You have declined this guilds invitation."
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:member:
    - narrate player:<[member]> "<&6><[player].name> has refused to join the guild."

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
  - yaml id:guild.<[guild]> set ranks.leader.priority:100
  - yaml id:guild.<[guild]> set default_rank:member
  - yaml id:guild.<[guild]> set ranks.member.title:Member
  - yaml id:guild.<[guild]> set ranks.member.priority:1
  - yaml id:guild.<[guild]> set ranks.mod.title:Mod
  - yaml id:guild.<[guild]> set ranks.mod.priority:50
  - foreach <list[manage_flags|manage_members|place_flag|remove_flag|kick_members|invite_members|manage_relations|access_bank]> as:perm:
    - yaml id:guild.<[guild]> set ranks.mod.permissions:|:<[perm]>
  - note <inventory[guild_flags_gui]> as:guild_<[guild]>_flags
  - note <inventory[guild_bank_gui]> as:guild_<[guild]>_bank
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
    - run remove_guild_flag def:<[guild]>|<[flag]>
    - note remove as:<server.list_notables[inventories].filter[starts_with[in@flag_]].filter[ends_with[<[flag]>]].get[1]>
  - foreach <yaml[guild.<[guild]>].read[members]> as:player:
    - flag <[player].as_player> guild:!
    - flag <[player].as_player> guild_rank:!
  - note remove as:guild_<[guild]>_flags
  - note remove as:guild_<[guild]>_bank
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
  - yaml id:guild.<[guild]> set flags.<[location]>.entity:<entry[indicator].spawned_entity.uuid>
  - yaml id:guild.<[guild]> set flags.<[location]>.location:<[location].simple>
  - yaml id:guild.<[guild]> set flags.<[location]>.name:flag<yaml[guild.<[guild]>].list_keys[flags].size>
  - yaml id:guild.<[guild]> set flags.<[location]>.health:5000
  - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:player:
    - narrate player:<[player]> "<&6><[player].name> has placed a guild flag."
  - inventory add d:<inventory[guild_<[guild]>_flags]> o:<item[guild_flag].with[display_name=flag<yaml[guild.<[guild]>].list_keys[flags].size>]>
  - run update_guild_flags_gui def:<[guild]>

remove_guild_flag:
  type: task
  definitions: guild|location|player
  script:
  - define location:<location[<[location]>]>
  - modifyblock <[location]> air
  - remove <entity[<yaml[guild.<[guild]>].read[flags.<[location]>.entity]>]>
  - if <[player]||null> != null:
    - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]> as:player:
      - narrate player:<[player]> "<&c><[player].name> has removed a guild flag. (<yaml[guild.<[guild]>].read[flags.<[location]>.name]>)"
  - yaml id:guild.<[guild]> set flags.<[location]>:!
  - foreach <server.list_online_players.filter[open_inventory.notable_name.contains[<[location]>]]>:
    - inventory close d:<[value]>
  - note remove as:flag_<[guild]>_<[location]>
  - run update_guild_flags_gui def:<[guild]>
  
update_guild_flags_gui:
  type: task
  definitions: guild
  script:
  - note <inventory[guild_flags_gui]> as:guild_<[guild]>_flags
  - foreach <yaml[guild.<[guild]>].list_keys[flags]> as:location:
    - define lore:<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[location]>.health]>
    - define lore:|:X<&sp><[location].as_location.x.round>
    - define lore:|:Y<&sp><[location].as_location.y.round>
    - define lore:|:Z<&sp><[location].as_location.z.round>
    - define flag:<item[guild_flag].with[display_name=<yaml[guild.<[guild]>].read[flags.<[location]>.name]>;lore=<[lore]>]>
    - inventory add d:<inventory[guild_<[guild]>_flags]> o:<[flag]>

damage_guild_flag:
  type: task
  definitions: attacking_guild|defending_guild|location|player
  script:
  - define health:<yaml[guild.<[defending_guild]>].read[flags.<[location]>.health]>
  - define entity:<yaml[guild.<[defending_guild]>].read[flags.<[location]>.entity].as_entity>
  - if <[entity].flag[attacking]||null> == null:
    - foreach <yaml[guild.<[defending_guild]>].read[members]> as:defender:
      - narrate player:<[defender]> "<&4>Your flag '<yaml[guild.<[defending_guild]>].read[flags.<[location]>.name]>' is under attack by <yaml[guild.<[attacking_guild]>].read[name]>."
      - playsound <[defender]> sound:magic.warhorn custom
    - foreach <yaml[guild.<[attacking_guld]>].read[members]> as:attacker:
      - playsound <[attacker]> sound:magic.warhorn custom
    - announce "<&4><yaml[guild.<[defending_guild]>].read[name]> is under attack by <yaml[guild.<[attacking_guild]>].read[name]>"
    - flag <[entity]> attacking:d duration:5m
  - yaml id:guild.<[defending_guild]> set flags.<[location]>.health:--
  - inventory set d:<inventory[flag_<[defending_guild]>_<[location]>]> slot:13 o:<item[guild_flag_health_icon].with[display_name=<&r><&a><yaml[guild.<[defending_guild]>].read[flags.<[location]>.name]>;lore=<&c><&chr[2764]><&sp><yaml[guild.<[defending_guild]>].read[flags.<[location]>.health]>]>
  - run update_guild_flags_gui def:<[defending_guild]>
  - if <[health]> < 1:
    - announce "<&4><yaml[guild.<[attacking_guild]>].read[name]> has destroyed <yaml[guild.<[attacking_guild]>].read[name]>'s flag."
    - foreach <server.list_online_players>:
      - yaml id:guild.<[guild]> set flags.<[location]>:!
      - modifyblock <[location]> air
      - remove <entity[<yaml[guild.<[guild]>].read[flags.<[location]>.entity]>]>
    - note remove as:flag_<[defending_guild]>_<[location]>
    - foreach <server.list_online_players.filter[open_inventory.notable_name.contains[<[location]>]]>:
      - inventory close d:<[value]>

change_guild_relation:
  type: task
  definitions: guild|other|relation|initiator
  script:
  - yaml id:guild.<[guild]> set relations.request.truce:<-:<[other]>
  - yaml id:guild.<[other]> set relations.request.truce:<-:<[guild]>
  - yaml id:guild.<[guild]> set relations.request.ally:<-:<[other]>
  - yaml id:guild.<[other]> set relations.request.ally:<-:<[guild]>
  - yaml id:guild.<[guild]> set relations.request.neutral:<-:<[other]>
  - yaml id:guild.<[other]> set relations.request.neutral:<-:<[guild]>
  - choose <[relation]>:
    - case ally:
      - yaml id:guild.<[guild]> set relations.enemy:<-:<[other]>
      - yaml id:guild.<[other]> set relations.enemy:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.truce:<-:<[other]>
      - yaml id:guild.<[other]> set relations.truce:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.ally:->:<[other]>
      - yaml id:guild.<[other]> set relations.ally:->:<[guild]>
      - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&b>Your guild is now an ally of <yaml[guild.<[other]>].read[name]>!"
      - foreach <yaml[guild.<[other]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&b><yaml[guild.<[guild]>].read[name]> is now an ally of your guild!"
    - case truce:
      - yaml id:guild.<[guild]> set relations.enemy:<-:<[other]>
      - yaml id:guild.<[other]> set relations.enemy:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.truce:->:<[other]>
      - yaml id:guild.<[other]> set relations.truce:->:<[guild]>
      - yaml id:guild.<[guild]> set relations.ally:<-:<[other]>
      - yaml id:guild.<[other]> set relations.ally:<-:<[guild]>
      - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&3>Your guild is now in a truce with <yaml[guild.<[other]>].read[name]>!"
      - foreach <yaml[guild.<[other]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&3><yaml[guild.<[guild]>].read[name]> is now in a truce with your guild!"
    - case enemy:
      - yaml id:guild.<[guild]> set relations.enemy:->:<[other]>
      - yaml id:guild.<[other]> set relations.enemy:->:<[guild]>
      - yaml id:guild.<[guild]> set relations.truce:<-:<[other]>
      - yaml id:guild.<[other]> set relations.truce:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.ally:<-:<[other]>
      - yaml id:guild.<[other]> set relations.ally:<-:<[guild]>
      - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&4>You have just declared war against <yaml[guild.<[other]>].read[name]>!"
      - foreach <yaml[guild.<[other]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&4><yaml[guild.<[guild]>].read[name]> has just declared war against your guild!"
    - case neutral:
      - yaml id:guild.<[guild]> set relations.enemy:<-:<[other]>
      - yaml id:guild.<[other]> set relations.enemy:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.truce:<-:<[other]>
      - yaml id:guild.<[other]> set relations.truce:<-:<[guild]>
      - yaml id:guild.<[guild]> set relations.ally:<-:<[other]>
      - yaml id:guild.<[other]> set relations.ally:<-:<[guild]>
      - foreach <yaml[guild.<[guild]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&a>Your guild is now at peace with <yaml[guild.<[other]>].read[name]>!"
      - foreach <yaml[guild.<[other]>].read[members].filter[is_online]>:
        - narrate player:<[value]> "<&a><yaml[guild.<[guild]>].read[name]> is now at peace with your guild!"

guild_events:
  type: world
  events:
    on delta time minutely every:1:
    - foreach <yaml.list.filter[starts_with[guild.]]> as:guild:
      - yaml id:<[guild]> set age:++
    on server starts:
    - yaml create id:server.guilds
    - foreach <server.list_files[data/globalData/guilds/<server.flag[server.name]>]> as:guild:
      - yaml load:data/globalData/guilds/<server.flag[server.name]>/<[guild]> id:guild.<[guild].replace[.yml].with[]>
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
        - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[100]>
        - foreach <[nearby_flags]> as:flag:
          - if <[flag].custom_name.strip_color> != <yaml[guild.<[guild]>].read[name]>:
            - narrate "<&6>You are too close to another guild's flag."
            - determine cancelled
            - stop
        - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[place_flag]>:
          - run place_guild_flag def:<[guild]>|<[location]>|<player>
      - else:
        - narrate "<&6>You are not in a guild."
        - determine passively cancelled
    on player breaks block:
    - if <context.location.above.material.name.ends_with[banner]>:
      - if <server.list_notables[inventories].filter[notable_name.starts_with[flag_]].filter[notable_name.ends_with[<context.location.above>]].size> != 0:
        - determine cancelled
    - if <context.material.name.ends_with[banner]>:
      - if <server.list_notables[inventories].filter[notable_name.starts_with[flag_]].filter[notable_name.ends_with[<context.location>]].size> != 0:
        - define flag:<server.list_notables[inventories].filter[notable_name.starts_with[flag_]].filter[notable_name.ends_with[<context.location>]].get[1]>
        - determine passively cancelled
        - if <player.flag[guild]||null> != null:
          - if <[flag].notable_name.replace[flag_].with[].split[_l@].get[1]> != <player.flag[guild]>:
            - if <yaml[guild.<player.flag[guild]>].read[relations.enemy].contains[<[flag].notable_name.replace[flag_].with[].split[_l@].get[1]>]>:
              - run damage_guild_flag def:<player.flag[guild]>|<[flag].notable_name.replace[flag_].with[].split[_l@].get[1]>|<location[<[flag].notable_name.replace[flag_].with[].split[_l@].get[2]>]>|<player>
            - else:
              - narrate "<&c>You cannot attack a guild without declaring war"
          - else:
            - narrate "<&c>You cannot attack your own guild's flag."
    on player right clicks block:
    - if <inventory[flag_<player.flag[guild]||null>_<context.location||null>]||null> != null:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
        - inventory open d:<inventory[flag_<player.flag[guild]>_<context.location>]>
        - inventory set d:<inventory[flag_<player.flag[guild]>_<context.location>]> slot:13 o:<item[guild_flag_health_icon].with[display_name=<&r><&a><yaml[guild.<player.flag[guild]>].read[flags.<context.location>.name]>;lore=<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<context.location>.health]>]>
        - determine passively cancelled
      - else:
        - narrate "<&c>You do not have permission to manage guild flags."
    on player signs book:
    - if <player.item_in_offhand.script.name> == new_guild_book:
      - stop
      - determine passively NOT_SIGNING
      - wait 1t
      - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<item[new_guild_book]>
      - stop
    - if <context.book> == <item[new_guild_book]>:
      - if <player.flag[guild]||null> != null:
        - narrate "<&c>You are already in a guild."
        - determine passively NOT_SIGNING
        - wait 1t
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<item[new_guild_book]>
        - stop
      - if <yaml.list.contains[guild.<context.title.to_lowercase.replace[<&sp>].with[_]>]>:
        - narrate "<&c>That guild already exists"
        - determine passively NOT_SIGNING
        - wait 1t
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<item[new_guild_book]>
        - stop
      - wait 1t
      - run create_guild def:<context.title.to_lowercase.replace[<&sp>].with[_]>|<context.title>|<player>|<context.book.book_pages>

guild_flag_health_icon:
  type: item
  material: snow

new_guild_book:
  type: item
  material: writable_book
  display name: <&7>New Guild Book
  lore:
  - "<&b>Use the first page to write your guild description,"
  - "<&b>Then sign the book with the name of your guild."

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
  material: iron_nugget
  mechanisms:
    custom_model_data: 35
  display name: <&9>Leave Guild

guilds_manage_claim_flags:
  type: item
  material: snow
  guild_permission: manage_claim_flags
  display name: <&9>Manage Claim Flags

guilds_view_info_btn:
  type: item
  material: book_and_quill
  display name: <&9>View Information

guilds_view_members_btn:
  type: item
  material: player_head
  guild_permission: view_members
  display name: <&9>View Members

guilds_settings_btn:
  type: item
  material: iron_nugget
  mechanisms:
    custom_model_data: 36
  guild_permission: change_settings
  display name: <&9>Change Settings

new_guild_btn:
  type: item
  material: book_and_quill
  display name: "<&c>Create a new Guild"

guild_view_bank_btn:
  type: item
  material: ender_chest
  display name: "<&c>View guild bank"

list_all_guilds_btn:
  type: item
  material: white_banner
  display name: "<&c>View all guilds"

guild_leave_yes_btn:
  type: item
  material: green_wool
  display name: "<&a>Leave Guild"

guild_leave_no_btn:
  type: item
  material: red_wool
  display name: "<&c>Stay in Guild"

guild_leave_confirmation_gui:
  type: inventory
  title: <&6>◆ <&c><&n><&l>Leave Guild?<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[gui_leave_confirm_top] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_leave_confirm_bottom] [] [guild_leave_yes_btn] [] [] [] [guild_leave_no_btn] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

new_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>No Guild<&r> <&6>◆
  size: 36
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_no_guild_top] [] [new_guild_btn] [] [] [] [list_all_guilds_btn] [] [w_filler]"
  - "[gui_no_guild_bottom] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  
all_guilds_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>All Guilds<&r> <&6>◆
  size: 54
  procedural items:
  - repeat 35:
    - define guild:<yaml.list.filter[starts_with[guild.]].get[<[value]>]||null>
    - if <[guild]> != null:
      - define items:|:<item[white_banner].with[display_name=<&r><&b><[guild].replace[guild.].with[].to_titlecase>;lore=<list[<&b>Leader:<&sp><&a><yaml[<[guild]>].read[leader].as_player.name>|<&b>Members:<&sp><&a><yaml[<[guild]>].read[members].size>|<&b>Flags:<&sp><&a><yaml[<[guild]>].list_keys[flags].size||0>]>]||<item[air]>>
  - determine <[items]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_all_guilds_top] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_all_guilds_bottom] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

view_guild_members:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Guild Members<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_members_top] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_members_bottom] [] [] [] [] [] [] [] [w_filler]"
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

guild_bank_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Guild Bank<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_bank_top] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_bank_bottom] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flags_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Flags<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_flags_top] [] [] [] [] [] [] [] [w_filler]"
  - "[gui_guild_flags_bottom] [] [] [] [] [] [] [] [w_filler]"
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
  - "[w_filler] [] [] [guild_flag_health_icon] [guild_flag_rename_btn] [guild_flag_destroy_btn] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_flag_btn_icon:
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

guild_kick_member_btn:
  type: item
  material: snow
  display name: <&6>Kick Member

guild_set_member_rank_btn:
  type: item
  material: snow
  display name: <&6>Set Member Rank

guild_manage_member_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Member<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [guild_set_member_rank_btn] [] [guild_kick_member_btn] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_set_member_rank_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Set Member Rank<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_transfer_leadership_yes_btn:
  type: item
  material: green_wool
  display name: "<&a>Transfer Guild Leadership"

guild_transfer_leadership_no_btn:
  type: item
  material: red_wool
  display name: "<&c>Remain Guild Leader"

guild_leadership_transfer_confirmation_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Transfer Ownership?<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [guild_transfer_leadership_yes_btn] [] [] [] [guild_transfer_leadership_no_btn] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

my_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆ <&a><&n><&l><yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[name]><&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_my_guild_top] [] [guilds_view_info_btn] [] [guilds_manage_claim_flags] [] [guilds_leave_btn] [] [w_filler]"
  - "[gui_my_guild_bottom] [] [guilds_view_members_btn] [] [guild_view_bank_btn] [] [guilds_settings_btn] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guilds_edit_ranks_btn:
  type: item
  material: snow
  guild_permission: edit_ranks
  display name: <&9>Edit Guild Ranks
  
guild_settings_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Guild Settings<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [guilds_edit_ranks_btn] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_choose_rank_to_edit_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Edit Rank<&r> <&6>◆
  size: 36
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_edit_rank_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Edit Rank<&r> <&6>◆
  size: 45
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [rename_guild_rank_btn] [delete_guild_rank_btn] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

delete_guild_rank_btn:
  type: item
  material: barrier
  display name: <&c>Delete Rank

rename_guild_rank_btn:
  type: item
  material: barrier
  display name: <&b>Rename Rank

create_guild_rank_btn:
  type: item
  material: iron_nugget
  display name: <&a>Create new rank

guild_info_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Guild Info<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[gui_guild_info_top] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[gui_guild_info_bottom] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_gui_events:
  type: world
  events:
    on player clicks in guild_info_gui:
    - if <context.raw_slot> <= <player.open_inventory.size>:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[my_guild_gui]>
    on player opens guild_info_gui:
    - wait 1t
    - define desc:<yaml[guild.<player.flag[guild]>].read[description].as_list.get[1]>
    - define lore:|:<&a>Leader:<&sp><yaml[guild.<player.flag[guild]>].read[leader].as_player.name>
    - define lore:|:<&b>Members:<&sp><yaml[guild.<player.flag[guild]>].read[members].size>
    - define lore:|:<&b>
    - foreach <[desc].split[<&sp>]>:
      - define line:|:<&b><[value]>
      - if <[line].length> > 30:
        - define lore:|:<[line].space_separated.split[<n>]>
        - define line:!
    - define lore:|:<[line].space_separated.split[<n>]>
    - define line:!
    - inventory set d:<context.inventory> slot:11 o:<item[book_and_quill].with[display_name=<&6><yaml[guild.<player.flag[guild]>].read[name]>;lore=<[new_lore]>]>
    - inventory set d:<context.inventory> slot:12 o:<item[<yaml[guild.<player.flag[guild]>].read[flag].as_item.material>].with[display_name=<&b>Total<&sp>Flags:<&sp><yaml[guild.<player.flag[guild]>].read[flags].size||0>;patterns=<yaml[guild.<player.flag[guild]>].read[flag].as_item.patterns>;base_color=<yaml[guild.<player.flag[guild]>].read[flag].as_item.base_color>]>
    - define lore:!
    - foreach <yaml[guild.<player.flag[guild]>].read[relations.ally]||<list[]>>:
      - define lore:|:<yaml[guild.<[value]>].read[name]>
    - inventory set d:<context.inventory> slot:15 o:<item[light_blue_wool].with[display_name=<&b>Allies:<&sp><[lore].size||0>;lore=<[lore]||None>]>
    - define lore:!
    - foreach <yaml[guild.<player.flag[guild]>].read[relations.truce]||<list[]>>:
      - define lore:|:<yaml[guild.<[value]>].read[name]>
    - inventory set d:<context.inventory> slot:16 o:<item[cyan_wool].with[display_name=<&b>Truces:<&sp><[lore].size||0>;lore=<[lore]||None>]>
    - define lore:!
    - foreach <yaml[guild.<player.flag[guild]>].read[relations.enemy]||<list[]>>:
      - define lore:|:<yaml[guild.<[value]>].read[name]>
    - inventory set d:<context.inventory> slot:17 o:<item[red_wool].with[display_name=<&b>Enemies:<&sp><[lore].size||0>;lore=<[lore]||None>]>
    - define lore:!
    - define lore:|:<&6><yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.title]>
    - define lore:|:<&b>
    - define lore:|:<&b>Your<&sp>Permissions:
    - foreach <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions]> as:perm:
      - define lore:|:<&a><[perm].replace[_].with[<&sp>].to_titlecase>
    - inventory set d:<context.inventory> slot:13 o:<item[player_head].with[skull_skin=<player.uuid>;display_name=<&b><player.name>;lore=<[lore]>]>
    on player opens guild_edit_rank_gui:
    - wait 1t
    - define rank:<context.inventory.slot[1].nbt[rank]>
    - foreach <script[guild_settings].yaml_key[rank_permissions]> as:perm:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.permissions].contains[<[perm]>]>:
        - inventory add d:<context.inventory> o:<item[green_wool].with[display_name=<[perm].to_titlecase.replace[_].with[<&sp>]>;nbt=perm/<[perm]>;lore=<list[Click<&sp>to<&sp>disable.]>]>
      - else:
        - inventory add d:<context.inventory> o:<item[red_wool].with[display_name=<[perm].to_titlecase.replace[_].with[<&sp>]>;nbt=perm/<[perm]>;lore=<list[Click<&sp>to<&sp>enable.]>]>
    on player clicks in guild_edit_rank_gui:
    - if <context.raw_slot> <= 45:
      - determine passively cancelled
      - define rank:<context.inventory.slot[1].nbt[rank]>
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[guild_choose_rank_to_edit_gui]>
      - if <context.item.script.name> == delete_guild_rank_btn:
        - run delete_guild_rank def:<player.flag[guild]>|<[rank]>
        - inventory open d:<inventory[guild_choose_rank_to_edit_gui]>
      - if <context.item.script.name> == rename_guild_rank_btn:
        - flag <player> context:rename_guild_rank|<[rank]>
        - narrate "<&b>Type the new name of your rank here, or type 'cancel' to go back. (No one can see your chat)"
        - inventory close
      - if <context.item.nbt[perm]||null> != null:
        - if <context.item.material.name> == red_wool:
          - run edit_guild_rank_permission def:<player.flag[guild]>|<[rank]>|<context.item.nbt[perm]>|add
        - if <context.item.material.name> == green_wool:
          - run edit_guild_rank_permission def:<player.flag[guild]>|<[rank]>|<context.item.nbt[perm]>|remove
        - define inv:<inventory[guild_edit_rank_gui]>
        - inventory open d:<[inv]>
        - inventory adjust d:<[inv]> slot:1 nbt:rank/<[rank]>
    on player chats:
    - if <player.flag[context].starts_with[rename_guild_rank]||false> == true:
      - determine passively cancelled
      - define rank:<player.flag[context].split[|].get[2]>
      - define new_name:<context.message>
      - flag <player> context:!
      - if <context.message> == cancel:
        - narrate "<&b>Cancelled"
      - else:
        - narrate "<&b>Renamed rank to <[new_name]>."
        - run rename_guild_rank def:<player.flag[guild]>|<[rank]>|<[new_name]>
      - inventory open d:<inventory[guild_choose_rank_to_edit_gui]>
    - if <player.flag[context]||null> == create_guild_rank:
      - flag <player> context:!
      - determine passively cancelled
      - if <context.message> != cancel:
        - narrate "<&b>Created rank '<context.message>'."
        - run create_guild_rank def:<player.flag[guild]>|<context.message>
      - else:
        - narrate "<&b>Cancelled."
      - inventory open d:<inventory[guild_choose_rank_to_edit_gui]>
    on player clicks in guild_choose_rank_to_edit_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[guild_settings_gui]>
      - if <context.item.script.name> == create_guild_rank_btn:
        - narrate "<&b>Type the name of your rank here, or type 'cancel' to go back. (No one can see your chat)"
        - flag <player> context:create_guild_rank
        - inventory close
      - if <context.item.nbt[rank]||null> != null:
        - define inv:<inventory[guild_edit_rank_gui]>
        - inventory open d:<[inv]>
        - inventory adjust d:<[inv]> slot:1 nbt:rank/<context.item.nbt[rank]>
    on player opens guild_choose_rank_to_edit_gui:
    - foreach <yaml[guild.<player.flag[guild]>].list_keys[ranks]> as:rank:
      - define title:<yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.title]>
      - define permissions:<yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.permissions]||<list[]>>
      - inventory add d:<context.inventory> o:<item[iron_nugget].with[display_name=<&b><[title]>;lore=<list[<[permissions].parse[replace[_].with[<&sp>].to_titlecase]>|Click<&sp>to<&sp>edit<&sp><[title]>]>;nbt=rank/<[rank]>]>
    - inventory add d:<context.inventory> o:<item[create_guild_rank_btn]>
    on player clicks guilds_edit_ranks_btn in guild_settings_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - inventory open d:<inventory[guild_choose_rank_to_edit_gui]>
    on player clicks guilds_settings_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - inventory open d:<inventory[guild_settings_gui]>
    on player clicks gui_close_btn in guild_settings_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - inventory open d:<inventory[my_guild_gui]>
    on player clicks guild_transfer_leadership_yes_btn in guild_leadership_transfer_confirmation_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - run player_transfer_guild_leadership def:<player>|<context.inventory.slot[5].skin.as_player>
      - inventory open d:<inventory[my_guild_gui]>
    on player clicks guild_transfer_leadership_no_btn in guild_leadership_transfer_confirmation_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - define inv:<inventory[guild_set_member_rank_gui]>
      - inventory open d:<[inv]>
      - wait 1t
      - inventory set d:<[inv]> slot:1 o:<context.inventory.slot[5]>
    on player clicks gui_invisible_item in guild_leadership_transfer_confirmation_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
    on player clicks gui_invisible_item in guild_manage_member_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
    on player clicks gui_close_btn in guild_manage_member_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - inventory open d:<inventory[view_guild_members]>
    on player clicks guild_kick_member_btn in guild_manage_member_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[kick_members]>:
        - if !<yaml[guild.<context.inventory.slot[12].skin.as_player.flag[guild]>].read[ranks.<context.inventory.slot[12].skin.as_player.flag[guild_rank]>.permissions].as_list.contains[kick_members]>:
          - run kick_from_guild def:<player.flag[guild]>|<player>|<context.inventory.slot[12].skin.as_player>
          - inventory open d:<inventory[view_guild_members]>
    on player clicks guild_set_member_rank_btn in guild_manage_member_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[set_member_rank]>:
        - if !<yaml[guild.<context.inventory.slot[12].skin.as_player.flag[guild]>].read[ranks.<context.inventory.slot[12].skin.as_player.flag[guild_rank]>.permissions].as_list.contains[set_member_rank]> || <yaml[guild.<player.flag[guild]>].read[leader]> == <player>:
          - define inv:<inventory[guild_set_member_rank_gui]>
          - inventory open d:<[inv]>
          - inventory set d:<[inv]> slot:5 o:<context.inventory.slot[12]>
        - else:
          - narrate "<&c>You cannot edit this players permissions."
    on player opens guild_set_member_rank_gui:
    - repeat 14:
      - define rank:<yaml[guild.<player.flag[guild]>].list_keys[ranks].reverse.get[<[value]>]||null>
      - if <[rank]> != null:
        - define title:<yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.title]>
        - define permissions:<yaml[guild.<player.flag[guild]>].read[ranks.<[rank]>.permissions]||<list[]>>
        - inventory add d:<context.inventory> o:<item[iron_nugget].with[display_name=<&b><[title]>;lore=<[permissions].parse[replace[_].with[<&sp>].to_titlecase]>;nbt=rank/<[rank]>]>
    on player clicks in guild_set_member_rank_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - define gui:<inventory[guild_manage_member_gui]>
        - inventory open d:<[gui]>
        - wait 1t
        - inventory set d:<[gui]> slot:12 o:<context.inventory.slot[5]>
      - if <context.item.nbt[rank]||null> != null:
        - if <context.item.nbt[rank]> == <yaml[guild.<player.flag[guild]>].read[leader].as_player.flag[guild_rank]>:
          - define inv:<inventory[guild_leadership_transfer_confirmation_gui]>
          - inventory open d:<[inv]>
          - wait 1t
          - inventory set d:<[inv]> slot:5 o:<context.inventory.slot[5]>
        - else:
          - run set_guild_member_rank def:<context.inventory.slot[5].skin.as_player>|<context.item.nbt[rank]>
          - inventory open d:<inventory[view_guild_members]>
    on player clicks in view_guild_members:
    - if <context.raw_slot> <= 54:
      - determine passively cancelled
      - if <context.item.script.name||null> == gui_close_btn:
        - inventory open d:<inventory[my_guild_gui]>
      - if <context.item.material.name> == player_head:
        - if <context.item.skin.as_player> == <player>:
          - narrate "<&c>You cannot edit this players permissions."
          - stop
        - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[manage_members]>:
          - define gui:<inventory[guild_manage_member_gui]>
          - inventory open d:<[gui]>
          - wait 1t
          - inventory set d:<[gui]> slot:12 o:<context.item>
    on player opens view_guild_members:
    - wait 1t
    - foreach <yaml[guild.<player.flag[guild]>].read[members].as_list> as:member:
      - if <[member].as_player> == <player>:
        - inventory add d:<player.open_inventory> o:<item[player_head].with[skull_skin=<[member].as_player.uuid>;display_name=<&b><[member].as_player.name>;lore=<list[<&b>You|<&2><yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.title]>]>]>
      - else:
        - inventory add d:<player.open_inventory> o:<item[player_head].with[skull_skin=<[member].as_player.uuid>;display_name=<&b><[member].as_player.name>;lore=<list[<&2><yaml[guild.<[member].flag[guild]>].read[ranks.<[member].flag[guild_rank]>.title]>]>]>
    on player clicks in guild_leave_confirmation_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - if <context.item.script.name||null> == guild_leave_yes_btn:
        - run player_leave_guild def:<player.flag[guild]>|<player>
        - inventory close
      - if <context.item.script.name||null> == guild_leave_no_btn:
        - inventory open d:<inventory[my_guild_gui]>
    on player clicks in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - inventory close
    on player clicks guilds_view_info_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - inventory open d:<inventory[guild_info_gui]>
    on player clicks guilds_manage_claim_flags in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[manage_flags]>:
        - inventory open d:<inventory[guild_<player.flag[guild]>_flags]>
    on player clicks guilds_view_members_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - inventory open d:<inventory[view_guild_members]>
    on player clicks guild_view_bank_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[access_bank]>:
        - inventory open d:<inventory[guild_<player.flag[guild]>_bank]>
    on player opens my_guild_gui:
    - inventory adjust d:<context.inventory> slot:14 material:<yaml[guild.<player.flag[guild]>].read[flag].as_item.material>
    - inventory adjust d:<context.inventory> slot:14 patterns:<yaml[guild.<player.flag[guild]>].read[flag].as_item.patterns>
    - inventory adjust d:<context.inventory> slot:14 base_color:<yaml[guild.<player.flag[guild]>].read[flag].as_item.base_color>
    - inventory adjust d:<context.inventory> slot:21 skull_skin:<yaml[guild.<player.flag[guild]>].read[leader].as_player.uuid>
    on player clicks guilds_leave_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> != <player>:
        - inventory open d:<inventory[guild_leave_confirmation_gui]>
      - else:
        - narrate "<&c>You are the guild leader; to leave, you must disband the guild, or assign a new leader."
    on player clicks in all_guilds_gui:
    - determine passively cancelled
    - if <context.item.script.name> == gui_close_btn:
      - inventory open d:<inventory[new_guild_gui]>
    on player clicks in guild_flags_gui:
    - determine passively cancelled
    - if !<yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[manage_flags]>:
      - stop
    - if <context.item.script.name> == gui_close_btn:
      - inventory open d:<inventory[my_guild_gui]>
    on player clicks in guild_bank_gui:
    - if !<yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[access_bank]>:
      - inventory close
    - if <list[1|9|10|18|19|27|28|36|37|46|47|48|49|50|51|52|53|54].contains[<context.raw_slot>]>:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[my_guild_gui]>
    on player clicks in guild_flags_gui:
    - if <context.raw_slot> <= 54:
      - determine passively cancelled
      - if !<yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[manage_flags]>:
        - inventory close
        - stop
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[my_guild_gui]>
    on player clicks in new_guild_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
      - if <context.item.script.name> == gui_close_btn:
        - inventory close
      - if <context.item.script.name> == list_all_guilds_btn:
        - inventory open d:<inventory[all_guilds_gui]>
      - if <context.item.script.name> == new_guild_btn:
        - inventory add d:<player.inventory> o:<item[new_guild_book]>
    on player clicks in guild_flag_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
      - if !<yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].as_list.contains[manage_flags]>:
        - inventory close
        - stop
      - if <context.item.script.name> == gui_close_btn:
        - inventory open d:<inventory[guild_<player.flag[guild]>_flags]>
    on player clicks guild_flag_destroy_btn in guild_flag_gui:
    - if <player.flag[guild]> == <context.inventory.notable_name.replace[flag_].with[].split[_l@].get[1]>:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[remove_flags]>:
        - run remove_guild_flag def:<player.flag[guild]>|<context.inventory.notable_name.replace[flag_].with[].split[_l@].get[2]>