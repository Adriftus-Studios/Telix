
custom_guild_vault:
  type: item
  material: stick
  mechanisms:
    custom_model_data: 8
    flags: HIDE_ALL
  display name: <&b>Guild Vault
  lore:
    - <&6>The <&a>Guild Vault<&6> will store
    - <&6>your guilds items, given you have the
    - <&6>proper <&a><&l>guild permission<&r><&6>
    - <&7>
    - <&c>TIP<&co> Use <&a>Shift + Right-click<&c> to
    - <&c><&sp>rotate your vault 45°
    
guild_flag_indicator:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[custom_guild_vault]>
  gravity: false
  custom_name_visible: true
  invulnerable: true
  visible: false
  