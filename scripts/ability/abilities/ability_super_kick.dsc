ability_super_kick:
  type: task
  name: super_kick
  ability_tree: Fisticuffs
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Create a 3x3 wall of sand infront of you.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - if <player.target.location.distance[<player.location>]||5> <= 3:
      - adjust <player.target> velocity:<player.location.direction.vector.with_y[0.1].mul[3]>
    
    