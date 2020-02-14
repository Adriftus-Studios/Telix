ability_double_jump:
  type: world
  name: double_jump
  ability_tree: Acrobatics
  level: 3
  power_cost: 10
  display_item: GUI_double_jump
  events:
    on player starts sneaking1 flagged:jumped:
      - if <player.location.material.name> == air:
        - adjust <player> velocity:<player.velocity.add[0,0.4,0]>
        - flag Player jumped:!

    on player jumps1:
      - if <yaml[player.<player.uuid>].read[<script.yaml_key[ability_tree]>.skills].contains[<script.yaml_key[name]>]>:
        - flag Player jumped:true duration:1s

GUI_double_jump:
  type: item
  material: leather_boots
  display name: <&a>Double Jump
  lore:
  - "<&a>---------------------------"
  - "<&e>Some Witty Ass Lore"
  - "<&e>Probably an explanation too"
  - "<&c>Don't forget power cost!"
  - "<&e>Stuff."
  - "<&a>---------------------------"