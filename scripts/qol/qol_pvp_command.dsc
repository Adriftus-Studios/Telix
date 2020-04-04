##PvP Command (Help/Settings)
qol_pvp_command:
  type: command
  debug: false
  name: pvp
  tab complete:
    - define arguments:<list[help|settings]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  script:
    - narrate "Work in Progress! -Kyu"
    
##Settings
#Inventory
qol_pvp_settings_inventory:
  type: inventory
  debug: false
  title: <&5>◆ <&c><&n><&l>Player Versus Player Settings<&r> <&5>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    #setting1:
    #setting2:
  slots:
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    
qol_pvp_settings_inventory_events:
  type: world
  debug: false
  events:
    on player clicks in qol_pvp_settings_inventory priority:10:
      - determine cancelled
    
    on player clicks in qol_pvp_settings_inventory:
      - if <context.item.has_nbt[setting]> && <context.item.has_nbt[options]>:
        - define new:<context.item.nbt[options].find[<yaml[player.<player.uuid>].read[pvp.<context.item.nbt[setting]>]>].+[1]>
        - yaml id:player.<player.uuid> set pvp.<context.item.nbt[setting]>:<[new]||<context.item.nbt[options].get[1]>>
        - narrate "<&d>Set PvP setting <&b><context.item.nbt[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&5><>"
        - inventory open d:<inventory[qol_pvp_settings_inventory]>
