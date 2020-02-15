ability_ambush:
  type: task
  name: ambush
  ability_tree: Stealth
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Disappear and re-appear facing your target's back.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - if <player.target||null> == null:
      - stop
    - playeffect smoke <player.location> quantity:120 offset:1
    - teleport <player.target.location.backward_flat[1]>
    
    