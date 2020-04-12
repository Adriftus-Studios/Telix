ability_find:
  type: task
  name: find
  ability_tree: Perception
  ability_type: command
  points_to_unlock: 20
  power_cost: 10
  command_usage: find (player Name)
  description: Will face you in the direction of a specified player.
  icon:
    material: iron_nugget
    custom_model_data: 112
  script:
    - inject abilties_check
    - inject abilities_cost
    - define target:<server.match_player[<context.args.get[1]>]||null>
    - if <[target]> == null:
      - narrate "Unknown Target."
      - stop
    - look <player> <[target].eye_location> duration:1t

abilities_track:
  type: command
  name: find
  script:
    - inject ability_find