ability_high_jump:
  type: world
  name: high_jump
  ability_tree: Acrobatics
  ability_type: passive
  points_to_unlock: 20
  power_cost: 10
  description: Jumping while sneaking, will jump extra high.
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player jumps:
      - if <player.is_sneaking> && !<player.is_sprinting>:
        - inject ability_check:
          - determine passively cancelled
          - adjust <player> velocity:<location[0,0.7,0]>