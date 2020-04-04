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
  help:
    - narrate "<&a>Use <&e>/pvp settings <&a>to change your PvP settings!"
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&c>Command argument missing! (Argument #1)"
    - else if <context.args.get[1].to_lowercase> == help:
      - inject locally help
    - else if <context.args.get[1].to_lowercase> == settings:
      - inventory open d:<inventory[qol_pvp_settings_inventory]>
    - else:
      - narrate "<&c>Command argument invalid! (Argument #1)"
    
##Settings
#Inventory
qol_pvp_settings_inventory:
  type: inventory
  debug: false
  title: <&5>◆ <&c><&n><&l>Player VS Player<&r> <&5>◆
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
  debug: false
  events:
    on player clicks in qol_pvp_settings_inventory priority:10:
      - determine cancelled
    
    on player clicks in qol_pvp_settings_inventory:
      - if <context.item.script.yaml_key[setting]||null> != null && <context.item.script.yaml_key[options]||null> != null:
        - define setting:<context.item.script.yaml_key[setting]>
        - define options:<context.item.script.yaml_key[options].as_list>
        - if !<[options].contains[<yaml[player.<player.uuid>].read[pvp.<[setting]>]||null>]>:
          - yaml id:player.<player.uuid> set pvp.<[setting]>:<[options].get[1]>
        - define next:<[options].find[<yaml[player.<player.uuid>].read[pvp.<[setting]>]>].+[1]>
        - define new:<[options].get[<[next]>]||<[options].get[1]>>
        - yaml id:player.<player.uuid> set pvp.<[setting]>:<[new]>
        - narrate "<&d>Set PvP setting <&b><[setting].replace[_].with[<&sp>].to_titlecase> <&d>to <&5><[new].to_titlecase>."
        - inventory open d:<inventory[qol_pvp_settings_inventory]>

#Items
qol_pvp_settings_damage_notifier:
  type: item
  debug: false
  material: stone
  display name: <&c>Damage Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: damage_notifier
  options: bossbar|chat|false

qol_pvp_settings_effect_notifier:
  type: item
  debug: false
  material: stone
  display name: <&d>Effect Notifier
  lore:
    - "<&a>Current Setting: <yaml[player.<player.uuid>].read[pvp.damage_notifier]||<script.as_item.nbt[options].get[1]>>"
  mechanisms:
    custom_model_data: 0
  setting: effect_notifier
  options: chat|bossbar|false
