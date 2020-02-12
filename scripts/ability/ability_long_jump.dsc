ability_long_jump:
  type: world
  name: Long Jump
  ability_tree: Acrobatics
  level: 2
  power_cost: 10
  display_item: GUI_long_jump
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