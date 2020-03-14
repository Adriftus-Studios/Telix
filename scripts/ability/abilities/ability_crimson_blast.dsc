ability_crimson_blast:
  type: task
  name: crimson_blast
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 1
  description: Cast an explosion targeting your mouse location.|Power increases as the target distance increases.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - inject abilities_cost
    #Definitions
    - define min:0.5
    - define max:3
    - define power:<player.location.cursor_on.distance[<player.location>].round_to[1]>
    - narrate <[power]>
    - if <[power]> < <[min]>:
      - define power:<[min]>
    - else if <[power]> > <[max]>:
      - define power:<[max]>
    - narrate <[power]>
    - explode <player.location.cursor_on.above> power:<[power]>
    - narrate "Planned ability tree: Nether"
