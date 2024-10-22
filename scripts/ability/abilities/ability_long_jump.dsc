ability_long_jump:
  type: world
  name: long_jump
  ability_tree: Acrobatics
  ability_type: passive
  points_to_unlock: 10
  power_cost: 10
  description: Clear greater gaps using a long jump.
  usage: Sprint + Sneak + Jump
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player jumps:
      - if <player.is_sneaking> && <player.is_sprinting>:
        - inject abilities_check
        - inject abilities_cost
        - determine passively cancelled
        - shoot <player> d:<player.location.forward_flat[20]> height:2

GUI_long_jump:
  type: item
  material: leather_boots
  display name: <&a>Long Jump
  lore:
  - "<&a>---------------------------"
  - "<&e>Some Witty Ass Lore"
  - "<&e>Probably an explanation too"
  - "<&c>Don't forget power cost!"
  - "<&e>Stuff."
  - "<&a>---------------------------"
