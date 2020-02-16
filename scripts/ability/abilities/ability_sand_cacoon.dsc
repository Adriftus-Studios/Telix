ability_sand_cacoon:
  type: task
  name: sand_cacoon
  ability_tree: Elemental
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Retreat into a protective shell within the ground.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - adjust <player> noclip:true
    - if !<cuboid[<player.location.below.right.forward_flat>|<player.location.below[10].left.backward_flat>].blocks[air].is_empty>:
      - narrate "<&c>Nope"
      - stop
    - showfake air <cuboid[<player.location.below.right.forward_flat>|<player.location.below[10].left.backward_flat>].blocks>  players:<player> duration:31s
    - wait 1t
    - showfake air <player.location.below[10].center.find.blocks.within[3]> players:<player> duration:30s