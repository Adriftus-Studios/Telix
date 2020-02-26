create_guild:
  type: task
  definitions: guild|guild_name|guild_leader|guild_description
  script:
  - if <[guild]||<[guild_name]||<[guild_leader]||<[guild_description]||null>>>> == null:
    - stop
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
  - announce "<&6><[guild_leader].display_name> has created the guild <[guild_name]>"

disband_guild:
  type: task
  debug: true
  definitions: guild
  script:
  - if <[guild]||null> == null:
    - stop
  - foreach <yaml[guild.<[guild]>].list_keys[flags]> as:flag:
    - inject remove_guild_flag
  - foreach <yaml[guild.<[guild]>].read[members]> as:player:
    - flag <[player]> guild:!
    - flag <[player]> guild_rank:!
  - announce "<&6>The Guild <yaml[guild.<[guild]>].read[name]> has been disbanded!"
  - yaml unload id:guild.<[guild]>
  - adjust server delete_file:data/globalLiveData/guilds/<server.flag[server.name]>/<[guild]>.yml

remove_guild_flag:
  type: task
  definitions: flag
  script:
    - define loc:<entity[<[flag]>].location.sub[l@0.5,0,0.5,entity[<[flag]>].location.world.name]>
    - modifyblock <[loc]> air
    - remove <entity[<[flag]>]>

guild_disband_command:
  type: command
  name: disband
  description: disband
  usage: /disband
  script:
  - run disband_guild def:<yaml[player.<player.uuid>].read[guild]>

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
          - yaml savefile:data/globalLiveData/guilds/<server.flag[server.name]>/<[value].to_lowercase.replace[guild.].with[]>.yml id:<[value]>
    on script reload:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalLiveData/guilds/<server.flag[server.name]>/<[value].to_lowercase.replace[guild.].with[]>.yml id:<[value]>
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
      - define flag:<[flags].get[1].uuid>
      - if <player.flag[guild]||null> != null:
        - define guild:<player.flag[guild]>
        - if <yaml[guild.<[guild]>].list_keys[flags].contains[<[flag]>]>:
          - if <yaml[guild.<[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[manage_flags]>:
            - flag <player> context:<[flag]>
            - inventory open d:guild_flag_gui
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
  - define flag:<[location].add[<l@0.5,0,0.5,<[location].world.name>>].find.entities[guild_flag_indicator].within[0.1].get[1]>
  - yaml id:guild.<[guild]> set flags.<[flag].uuid>.location:<[location].simple>
  - yaml id:guild.<[guild]> set flags.<[flag].uuid>.name:flag<yaml[guild.<[guild]>].list_keys[flags].size>
  - yaml id:guild.<[guild]> set flags.<[flag].uuid>.health:5000

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

guild_command:
  type: command
  name: guild
  description: guild
  usage: /guild
  aliases:
  - "g"
  script:
    - if <player.flag[guild]||null> != null:
      - inventory open d:my_guild_gui
    - else:
      - inventory open d:new_guild_gui

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
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆ <&a><&n><&l><yaml[guild.<player.flag[guild]>].read[name]><&r> <&6>◆
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
    - define flag:<player.context[guild_flag]>
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
