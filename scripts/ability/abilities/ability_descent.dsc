ability_descent:
  type: task
  name: descent
  ability_tree: Aer
  ability_type: active
  points_to_unlock: 0
  power_cost: 0
  description: Use air to slowly descend towards the ground
  usage: Sneak to cancel this skill
  icon:
    material: stone
    custom_model_data: 1
  check:
    - waituntil <player.location.below.material.name> != air || <player.is_sneaking>
    - flag player descending:!
  script:
    #Target Skill Tree: Aer, Target Points Requirement: 15, Target Power Cost: 15
    - inject abilities_check
    - inject abilities_cost
    - flag player descending:true
    - run locally check
    - while <player.has_flag[descending]>:
      - playeffect sweep_attack at:<player.location.below> quantity:1 visibility:50
      - cast slow_falling duration:1s power:2 <player> hide_particles
      - cast speed duration:0.5s power:1 <player> hide_particles
      - wait 0.5s
