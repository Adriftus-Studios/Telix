ability_arcane_track:
  type: task
  name: arcane_track
  ability_tree: Arcane
  ability_type: command
  points_to_unlock: 20
  power_cost: 10
  command_usage: arcane_track (player Name)
  description: Will face you in the direction of a specified player.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilties_check
    - define target:<server.match_player[<context.args.get[1]>]||null>
    - if <[target]> == null:
      - narrate "Unknown Target."
      - stop
    - look <player> <[target].eye_location> duration:1t

abilities_arcane_track:
  type: command
  name: arcane_track
  script:
    - inject ability_arcane_track