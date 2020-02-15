ability_double_jump:
  type: world
  name: double_jump
  ability_tree: Acrobatics
  ability_type: passive
  points_to_unlock: 30
  power_cost: 10
  description: Sneaking in mid-air will jump again, shortly after an initial jump.
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player starts sneaking flagged:jumped:
      - if <player.location.material.name> == air:
        - adjust <player> velocity:<player.velocity.add[0,0.4,0]>
        - flag player jumped:!

    on player jumps:
      - if <yaml[player.<player.uuid>].read[skills.<script.yaml_key[ability_tree]>.current]> >= <script.yaml_key[points_to_unlock]>:
        - flag player jumped:true duration:1s

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