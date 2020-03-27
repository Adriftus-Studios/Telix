player_profile_events:
  type: world
  debug: false
  events:
    on player right clicks entity:
      - if <context.entity.type> == player:
        - if <player.is_sneaking>:
          - define inv:<inventory[player_profile_gui]>
          - inventory open d:<[inv]>
          - narrate <context.entity>
          - wait 1t
          - inventory set d:<[inv]> slot:11 o:<item[player_skull].with[skull_skin=<context.entity.uuid>]>
    on player opens player_profile_gui:
      - wait 2t
      - define player:<context.inventory.slot[1].nbt[player]>

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
