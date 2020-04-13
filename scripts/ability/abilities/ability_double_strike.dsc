ability_double_strike:
  type: task
  name: double_strike
  ability_tree: Fisticuffs
  ability_type: slotted
  points_to_unlock: 10
  power_cost: 12
  description: Strike twice with the slotted weapon.
  icon:
    material: iron_nugget
    custom_model_data: 105
  script:
    - if <player.target.distance[<player.location>]||5> <= 3:
      - stop
    - inject abilities_check
    - inject abilities_cost
    - playeffect sweep_attack at:<player.location.forward.above> quantity:2
    - hurt <player.target> <player.item_in_hand.damage.*[2]>