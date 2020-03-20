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
  - manage_relations
  - access_bank
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
            - determine <server.list_online_players.filter[is[!=].to[<player>]].parse[name]>
          - case kick:
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
          - case bank:
            - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[access_bank]>:
              - inventory open d:<inventory[guild_<player.flag[guild]>_bank]>
            - else:
              - narrate "<&c>You do not have permission to run that command."
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
    - run remove_guild_flag def:<[flag]>
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
  - narrate <[guild]>
  - narrate <[location]>
  - narrate <[player]>
  - define location:<location[<[location]>]>
  - modifyblock <[location]> air
  - remove <entity[<yaml[guild.<[guild]>].read[flags.<[location]>.entity]>]>
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
      - yaml id:guild.<[guild]> set relation.enemy:<-:<[other]>
      - yaml id:guild.<[other]> set relation.enemy:<-:<[guild]>
      - yaml id:guild.<[guild]> set relation.truce:<-:<[other]>
      - yaml id:guild.<[other]> set relation.truce:<-:<[guild]>
      - yaml id:guild.<[guild]> set relation.ally:<-:<[other]>
      - yaml id:guild.<[other]> set relation.ally:<-:<[guild]>
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
    - if <context.book> == <item[new_guild_book]>:
      - if <player.flag[guild]||null> != null:
        - narrate "<&c>You are already in a guild."
        - determine passively NOT_SIGNING
        - stop
      - if <yaml.list.contains[guild.<context.title.to_lowercase.replace[<&sp>].with[_]>]>:
        - narrate "<&c>That guild already exists"
        - determine passively NOT_SIGNING
        - stop
      - run create_guild def:<context.title.to_lowercase.replace[<&sp>].with[_]>|<context.title>|<player>|<context.pages.get[1]>

guild_flag_health_icon:
  type: item
  material: snow

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
  display name: "<&c>Create a new Guild"

guild_view_bank_btn:
  type: item
  material: snow
  display name: "<&c>View guild bank"

list_all_guilds_btn:
  type: item
  material: snow
  display name: "<&c>View all guilds"

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
  - "[w_filler] [] [new_guild_btn] [] [] [] [list_all_guilds_btn] [] [w_filler]"
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
  - "[w_filler] [guilds_view_members_btn] [guilds_view_info_btn] [guild_view_bank_btn] [guilds_manage_claim_flags] [guilds_settings_btn] [guilds_leave_btn] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
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
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [closeitem]"

guild_flags_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Manage Flags<&r> <&6>◆
  size: 54
  procedural items:
  - foreach <yaml[guild.<player.flag[guild]>].list_keys[flags]||<list[]>> as:flag:
    - define h:<yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>
    - if <yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]> < <script[guild_settings].yaml_key[default_stats.flag_health]>:
      - define flags:|:<item[guild_flag_btn_icon].with[display_name=<&a><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>;lore=<list[<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>]>;nbt=<[flag]>]>
    - else:
      - define flags:|:<item[guild_flag_btn_icon].with[display_name=<&c><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.name]>;lore=<list[<&c><&chr[2764]><&sp><yaml[guild.<player.flag[guild]>].read[flags.<[flag]>.health]>]>;nbt=<[flag]>]>
  - determine <[flags]||<list[]>>
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

guild_gui_events:
  type: world
  events:
    on player opens edit_guild_ranks_gui:
    - define btns:<list[guilds_view_info_btn|guilds_view_members_btn|guilds_edit_ranks_btn|guilds_manage_claim_flags|guilds_settings_btn|guilds_leave_btn]>
    - foreach <[btns]> as:btn:
      - inventory add d:<context.inventory> o:<item[<[btn]>]>
    on player clicks in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - determine passively cancelled
    on player clicks guilds_view_info_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
    on player clicks guilds_manage_claim_flags in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - inventory open d:<inventory[guild_<player.flag[guild]>_flags]>
    on player clicks guilds_view_members_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - inventory open d:<inventory[view_guild_members]>
    on player clicks guild_view_bank_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - inventory open d:<inventory[guild_<player.flag[guild]>_bank]>
    on player clicks guilds_leave_btn in my_guild_gui:
    - if <context.raw_slot> <= 36:
      - if <yaml[guild.<player.flag[guild].to_lowercase.replace[<&sp>].with[_]>].read[leader]> != <player>:
        - run player_leave_guild def:<player.flag[guild]>|<player>
        - inventory close
      - else:
        - narrate "<&c>You are the guild leader, you must disband in order to leave."
    on player clicks in guild_bank_gui:
    - if <context.raw_slot> <= 54 && <context.raw_slot> > 45:
      - determine passively cancelled
    on player clicks in view_guild_members:
    - if <context.raw_slot> <= 54:
      - determine passively cancelled
    on player opens view_guild_members:
    - wait 1t
    - foreach <yaml[guild.<player.flag[guild]>].read[members].as_list> as:member:
      - inventory add d:<player.open_inventory> o:<item[player_head].with[skull_skin=<[member].as_player.uuid>;display_name=<&b><[member].as_player.name>]>
    on player clicks in guild_flags_gui:
    - if <context.raw_slot> <= 54:
      - determine passively cancelled
    on player clicks in new_guild_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
    on player clicks in guild_flag_gui:
    - if <context.raw_slot> <= 27:
      - determine passively cancelled
    on player clicks new_guild_btn in new_guild_gui:
    - if <context.raw_slot> <= 27:
      - inventory add d:<player.inventory> o:<item[new_guild_book]>
    on player clicks guild_flag_destroy_btn in guild_flag_gui:
    - if <player.flag[guild]> == <context.inventory.notable_name.replace[flag_].with[].split[_l@].get[1]>:
      - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[remove_flags]>:
        - run remove_guild_flag def:<player.flag[guild]>|<context.inventory.notable_name.replace[flag_].with[].split[_l@].get[2]>