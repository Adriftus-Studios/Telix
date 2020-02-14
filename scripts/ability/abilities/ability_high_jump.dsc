ability_high_jump:
  type: world
  name: high_jump
  ability_tree: Acrobatics
  level: 1
  power_cost: 10
  display_item: GUI_high_jump
  events:
    on player jumps1:
      - if <player.is_sneaking> && !<player.is_sprinting>:
        - if <yaml[player.<player.uuid>].read[skills.<script.yaml_key[ability_tree]>.skills].contains[<script.yaml_key[name]>]>:
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