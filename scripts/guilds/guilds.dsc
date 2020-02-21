create_guild:
  type: task
  script:
  - if <[guild]||<[guild_name]||<[guild_leader]||<[guild_description]||null>>>> == null:
    - stop
  - yaml id:player.<player.uuid> set guild:<[guild]>
  - yaml id:guild.<[guild]> set name:<[guild_name]>
  - yaml id:guild.<[guild]> set leader:<[guild_leader]>
  - yaml id:guild.<[guild]> set description:<[guild_description]>
  - yaml id:guild.<[guild]> set ranks.leader.permissions:manage_claim_flags|edit_ranks|view_members|change_settings

guilds_events:
  type: world
  debug: false
  events:
    on server stars:
    - foreach <server.list_files[data/globalLiveData/guilds/<server.flag[server.name]>]> as:guild:
      - yaml load:data/globalLiveData/guilds/<server.flag[server.name]>/<[guild]> id:guild.<[guild]>
    on shutdown:
      - foreach <yaml.list>:
        - if <def[value].substring[1,5]> == guild:
          - yaml savefile:data/globalLiveDataplayers/<def[value].substring[8]>.yml id:<def[value]>
    on player clicks in new_guilds_gui:
    - if <context.raw_slot> > 27:
      - determine passively cancelled
    on player clicks new_guild_btn in new_guilds_gui:
    - if <context.raw_slot> > 27:
      - inventory add d:<player.inventory> o:<item[new_guild_book]>
    on player signs book:
    - if <context.book> == <item[new_guild_book]>:
      - narrate <context.title>
      - define guild:<context.title.to_lowercase.replace[<&sp>].with[_]>
      - define guild_name:<context.title>
      - define guild_leader:<player>
      - define guild_description:<context.pages.get[1]>
      - inject create_guild

my_guild_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>My Guild<&r> <&6>◆
  size: 54
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    gui_top: <item[gui_equipment_top]>
    gui_bottom: <item[gui_equipment_bottom]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [guilds_view_info_btn] [guilds_edit_ranks_btn] [guilds_manage_claim_flags] [guilds_view_members_btn] [guilds_settings_btn] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

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
