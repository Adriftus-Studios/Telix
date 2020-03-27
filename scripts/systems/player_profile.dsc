player_profile_events:
  type: world
  debug: false
  events:
    on player right clicks entity:
      - if <context.entity.type> == player:
        - if <player.is_sneaking>:
          - define inv:<inventory[player_profile_gui]>
          - inventory open d:<[inv]>
          - inventory set d:<[inv]> slot:11 o:<item[player_head].with[skull_skin=<context.entity.uuid>]>
    on player opens player_profile_gui:
      - wait 1t
      - define playr:<context.inventory.slot[11].skin.as_player>
      - if <[playr].flag[guild]||null> != null:
        - inventory set d:<context.inventory> slot:17 o:<yaml[guild.<[playr].flag[guild]>].read[flag].as_item.with[nbt=guild/<[playr].flag[guild]>]>
        - inventory adjust d:<context.inventory> slot:17 display_name:<&a><&l>Guild:<&sp><&r><&b><yaml[guild.<[playr].flag[guild]>].read[name]>
      - else:
        - inventory set d:<context.inventory> slot:17 o:<item[player_profile_no_guild_btn]>
    on player clicks in player_profile_gui:
      - if <context.raw_slot> <= 27:
        - determine passively cancelled
        - define playr:<context.inventory.slot[11].skin.as_player>
        - if <context.raw_slot> == 17:
          - if <context.inventory.slot[17].script.name||null> == player_profile_no_guild_btn:
            - if <yaml[guild.<player.flag[guild]>].read[ranks.<player.flag[guild_rank]>.permissions].contains[invite_members]||false>:
              - run invite_to_guild def:<player.flag[guild]>|<player>|<[playr]>
            - else:
              - narrate "<&c>You do not have permission to invite players."
          - else:
            - if <context.inventory.slot[17].nbt[guild]> == <player.flag[guild]||null>:
              - inventory open d:<inventory[my_guild_gui]>

invite_to_guild:
  type: task
  definitions: guild|inviter|invited

player_profile_no_guild_btn:
  type: item
  material: white_banner
  display name: <&a>No Guild
  lore:
  - <&b>Click to Invite.

player_profile_gui:
  type: inventory
  title: <&6>◆ <&a><&n><&l>Player Profile<&r> <&6>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
