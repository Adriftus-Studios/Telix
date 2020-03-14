ability_crimson_blast:
  type: task
  name: crimson_blast
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 10
  description: Cast an explosion targeting your mouse location.|Power increases as the target distance increases.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - inject abilities_cost
    #/ex explode <player.location.cursor_on.above> power:<player.location.cursor_on.distance[<player.location>].round_to[1]>
    - define power:<player.location.cursor_on.distance[<player.location>].round_to[1]>
    - if <[power]> > 5:
      - define power:5
    - explode explode <player.location.cursor_on.backward> power:<[power]>
    - narrate "Planned ability tree: Nether"
