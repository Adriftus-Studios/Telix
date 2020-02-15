ability_high_jump:
  type: world
  name: high_jump
  ability_tree: Acrobatics
  ability_type: passive
  points_to_unlock: 3
  power_cost: 10
  description: Sneaking in mid-air will jump again, shortly after an initial jump.
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player jumps:
      - if <player.is_sneaking> && !<player.is_sprinting>:
        - if <yaml[player.<player.uuid>].read[skills.<script.yaml_key[ability_tree]>.current]> >= <script.yaml_key[points_to_unlock]>::
          - determine passively cancelled
          - adjust <player> velocity:<location[0,0.7,0]>

GUI_high_jump:
  type: item
  material: leather_boots
  display name: <&a>High Jump
  lore:
  - "<&a>---------------------------"
  - "<&e>Some Witty Ass Lore"
  - "<&e>Probably an explanation too"
  - "<&c>Don't forget power cost!"
  - "<&e>Stuff."
  - "<&a>---------------------------"