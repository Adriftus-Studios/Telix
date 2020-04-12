ability_sand_cacoon:
  type: task
  name: sand_cacoon
  ability_tree: Earth
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Retreat into a protective shell within the ground.
  icon:
    material: iron_nugget
    custom_model_data: 104
  script:
    - inject abilities_check
    - adjust <player> noclip:true
    - if !<cuboid[<player.location.below.with_yaw[<player.location.yaw.round_to_precision[90]>].forward_flat.right>|<player.location.below[10].with_yaw[<player.location.yaw.round_to_precision[90]>].backward_flat.left>].blocks[air].is_empty>:
      - narrate "<&c>Nope"
      - stop
    - inject abilities_cost
    - flag player no_suffocate:true duration:30s
    - showfake air <cuboid[<player.location.below.with_yaw[<player.location.yaw.round_to_precision[90]>].forward_flat.right>|<player.location.below[10].with_yaw[<player.location.yaw.round_to_precision[90]>].backward_flat.left>].blocks>  players:<player> duration:31s
    - wait 1t
    - showfake air <player.location.below[10].center.find.blocks.within[3]> players:<player> duration:30s
