ability_arcane_track:
  type: task
  name: high_jump
  ability_tree: Arcane
  ability_type: command
  points_to_unlock: 20
  power_cost: 10
  command_usage: arcane_track player_name
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
    - look <player> <[target].location> duration:1t

abilities_arcane_track:
  type: command
  name: arcane_track
  script:
    - inject ability_arcane_track