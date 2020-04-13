ability_quicksand:
  type: task
  name: quicksand
  ability_tree: Earth
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Turn the ground around you into soul sand.
  icon:
    material: iron_nugget
    custom_model_data: 113
  script:
    - inject abilities_check
    - inject abilities_cost
    - showfake soul_sand <player.location.find.surface_blocks.within[3]> players:<server.list_online_players.exclude[<player>]> duration:6s
    - showfake brown_terracotta <player.location.find.surface_blocks.within[3]> players:<player> duration:6s