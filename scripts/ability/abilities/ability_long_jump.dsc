ability_long_jump:
  type: world
  name: long_jump
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
      - if <player.is_sneaking> && <player.is_sprinting>:
        - if <yaml[player.<player.uuid>].read[skills.<script.yaml_key[ability_tree]>.skills].contains[<script.yaml_key[name]>]>:
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