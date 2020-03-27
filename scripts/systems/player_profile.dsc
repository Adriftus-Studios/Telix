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
        - inventory set <context.inventory> slot:17 o:<yaml[guild.<[playr].flag[guild]>].read[flag].as_item>
    on player clicks in player_profile_gui:
      - if <context.raw_slot> <= 27:
        - determine passively cancelled

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
