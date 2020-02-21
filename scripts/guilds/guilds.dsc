create_guild:
  type: task
  script:
  - if <[guild]||<[guild_name]||<[guild_leader]||<[guild_description]||null>>>> == null:
    - stop
  - yaml create id:guild.<[guild]>
  - yaml id:player.<player.uuid> set guild:<[guild]>
  - yaml id:player.<player.uuid> set guild_rank:leader
  - yaml id:guild.<[guild]> set name:<[guild_name]>
  - yaml id:guild.<[guild]> set leader:<[guild_leader]>
  - yaml id:guild.<[guild]> set description:<[guild_description]>
  - yaml id:guild.<[guild]> set flag:i@white_banner
  - yaml id:guild.<[guild]> set members:|:<player>
  - foreach <list[manage_flags|edit_ranks|view_members|change_settings|place_flag|remove_flag|kick_members|invite_members]> as:perm:
    - yaml id:guild.<[guild]> set ranks.leader.permissions:|:<[perm]>
  - yaml id:guild.<[guild]> set ranks.leader.title:Leader
  - announce "<&6><[guild_leader].display_name> has created the guild <[guild_name]>"

disband_guild:
  type: task
  script:
  - if <[guild]||null> == null:
    - stop
  - define flags:<yaml[guild.<[guild]>].list_keys[flags]>
  - foreach <[flags]> as:armorstand:
    - narrate <<[armorstand]>>

guild_disband_command:
  type: command
  name: disband
  description: disband
  usage: /disband
  script:
  - define guild:<yaml[player.<player.uuid>].read[guild]>
  - inject disband_guild

guild_events:
  type: world
  debug: false
  events:
    on server starts:
    - yaml create id:server.guilds
    - foreach <server.list_files[data/globalLiveData/guilds/<server.flag[server.name]>]> as:guild:
      - yaml load:data/globalLiveData/guilds/<server.flag[server.name]>/<[guild]> id:guild.<[guild]>
      - yaml id:server.guilds set all_guilds:|:<[guild]>
    on shutdown:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalLiveData/guilds/<server.flag[server.name]>/<[value].replace[guild.].with[]>.yml id:<[value]>
    on script reload:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalLiveData/guilds/<server.flag[server.name]>/<[value].replace[guild.].with[]>.yml id:<[value]>
    on player places block:
    - if <context.item_in_hand.script.name> == guild_flag:
      - if <yaml[player.<player.uuid>].read[guild]||null> != null:
        - define guild:<yaml[player.<player.uuid>].read[guild]>
        - define location:<context.location>
        - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[200]>
        - foreach <[nearby_flags]> as:flag:
          - if <[flag].custom_name.strip_color> != <yaml[guild.<[guild]>].read[name]>:
            - narrate "<&6>You are too close to another guild's flag."
            - determine cancelled
            - stop
        - if <yaml[guild.<yaml[player.<player.uuid>].read[guild]>].read[ranks.<yaml[player.<player.uuid>].read[guild_rank]>.permissions].contains[place_flag]>:
          - inject place_guild_flag
      - else:
        - narrate "<&6>You are not in a guild."
        - determine passively cancelled
    - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[50]>
    - foreach <[nearby_flags]> as:flag:
      - if <[flag].custom_name.strip_color> != <yaml[guild.<yaml[player.<player.uuid>].read[guild]>].read[name]>:
        - narrate "<&6>You cannot build in another guild's territory."
        - determine cancelled
        - stop
    on player breaks block:
    - define nearby_flags:<context.location.find.entities[guild_flag_indicator].within[50]>
    - foreach <[nearby_flags]> as:flag:
      - if <[flag].custom_name.strip_color> != <yaml[guild.<yaml[player.<player.uuid>].read[guild]>].read[name]>:
        - narrate "<&6>You cannot break blocks in another guild's territory."
        - determine cancelled
        - stop
    on player clicks block:
    - define flags:<context.location.add[<l@0.5,0,0.5,<context.location.world.name>>].find.entities[guild_flag_indicator].within[0.1]>
    - if !<[flags].is_empty>:
      - narrate <[flags].get[1]>
    on player signs book:
    - if <context.book> == <item[new_guild_book]>:
      - narrate <context.title>
      - define guild:<context.title.to_lowercase.replace[<&sp>].with[_]>
      - define guild_name:<context.title>
      - define guild_leader:<player>
      - define guild_description:<context.pages.get[1]>
      - inject create_guild

place_guild_flag:
  type: task
  script:
  - if <[guild]||<[location]||null>> == null:
    - stop
  - spawn guild_flag_indicator[custom_name=<&6><yaml[guild.<[guild]>].read[name]>] <[location].add[<l@0.5,0,0.5,<[location].world.name>>]>
  - define flag:<[location].add[<l@0.5,0,0.5,<[location].world.name>>].find.entities[guild_flag_indicator].within[0.1].get[1]>
  - yaml id:guild.<[guild]> set flags.<[flag].uuid>.location:<[location].simple>
  - yaml id:guild.<[guild]> set flags.<[flag].uuid>.name:flag<yaml[guild.<[guild]>].list_keys[flags].size>

guild_flag_indicator:
  type: entity
  entity_type: armor_stand
  gravity: false
  custom_name_visible: true
  invulnerable: true
  visible: false
  
my_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆
  size: 36
  procedural items:
  - define btns:<list[guilds_view_info_btn|guilds_view_members_btn|guilds_edit_ranks_btn|guilds_manage_claim_flags|guilds_settings_btn|guilds_leave_btn]>
  - foreach <[btns]> as:btn:
    - define items:|:<[btn]>
  - determine <[items]>
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

guild_gui_events:
  type: world
  events:
    on player clicks in my_guild_gui:
    - if <context.raw_slot> > 36:
      - determine passively cancelled
    on player clicks guilds_view_info_btn in my_guild_gui:
    - if <context.raw_slot> > 36:
    on player clicks in new_guild_gui:
    - if <context.raw_slot> > 27:
      - determine passively cancelled
    on player clicks new_guild_btn in new_guild_gui:
    - if <context.raw_slot> > 27:
      - inventory add d:<player.inventory> o:<item[new_guild_book]>
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
  
guilds_command:
  type: command
  name: guilds
  description: guilds
  usage: /guilds
  script:
    - if <yaml[player.<player.uuid>].read[guild]||null> != null:
      - narrate <yaml[player.<player.uuid>].read[guild]>
      - inventory open d:my_guild_gui
    - else:
      - inventory open d:new_guild_gui

new_guild_btn:
  type: item
  material: snow
  equipment_rating: 0
  display name: "<&c>Create a new Guild"

new_guild_book:
  type: item
  material: writable_book
