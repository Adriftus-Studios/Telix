ability_double_jump:
  type: world
  name: double_jump
  ability_tree: Acrobatics
  ability_type: passive
  points_to_unlock: 30
  power_cost: 10
  description: Jump again in mid-air, shortly after an initial jump.
  usage: Mid-Air > Sneak
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player starts sneaking flagged:jumped:
      - inject abilities_cost
      - if <player.location.material.name> == air && <player.location.below[0.2].material.name> != air:
        - adjust <player> velocity:<player.velocity.add[0,0.4,0]>
        - flag player jumped:!

    on player jumps:
      - inject abilities_check
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
