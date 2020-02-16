ability_quicksand:
  type: task
  name: quicksand
  ability_tree: Earth
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: turn the ground around you into soul sand for other players.
  icon:
    material: iron_nugget
    custom_model_data: 10
  script:
    - showfake soul_sand <player.location.find.surface_blocks.within[3]> players:<server.list_online_players.exclude[<player>]> duration:15s