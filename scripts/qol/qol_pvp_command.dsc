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
  debug: true
  title: <&5>◆ <&c><&n><&l>Player Versus Player Settings<&r> <&5>◆
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    dmg_n: <item[qol_pvp_settings_damage_notifier]>
    fx_n: <item[qol_pvp_settings_effect_notifier]>
  slots:
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    - "[w_filler] [dmg_n] [fx_n] [] [] [] [] [] [w_filler]"
    - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
    
qol_pvp_settings_inventory_events:
  type: world
  debug: true
  events:
    on player clicks in qol_pvp_settings_inventory priority:10:
      - determine cancelled
    
    on player clicks in qol_pvp_settings_inventory:
      - if <context.item.script.yaml_key[setting]||null> != null && <context.item.script.yaml_key[options]||null> != null:
        - define setting:<context.item.script.yaml_key[setting]>
        - define options:<context.item.script.yaml_key[options]>
        - narrate <[setting]>
        - narrate <[options]>
        - if <yaml[player.<player.uuid>].read[pvp.<[setting]>]||null> == null:
          - yaml id:player.<player.uuid> set pvp.<[setting]>:<[options].get[1]>
        - define new:<[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].+[1]>
        - narrate <[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>]>
        - narrate <[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].+[1]>
        - yaml id:player.<player.uuid> set pvp.<[setting]>:<[new]||<[options].get[1]>>
        - narrate "<&d>Set PvP setting <&b><[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&5><[new].to_titlecase>."
        - inventory open d:<inventory[qol_pvp_settings_inventory]>

#Items
qol_pvp_settings_damage_notifier:
  type: item
  debug: true
  material: stone
  display name: <&c>Damage Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: damage_notifier
  options: <list[bossbar|chat|false]>

qol_pvp_settings_effect_notifier:
  type: item
  debug: true
  material: stone
  display name: <&e>Effect Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: effect_notifier
  options: <list[bossbar|chat|false]>
    
  
