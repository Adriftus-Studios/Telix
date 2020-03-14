ability_crimson_blast:
  type: task
  name: crimson_blast
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 1
  description: Cast an explosion targeting your mouse location.
  usage: Power increases as the target distance increases.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #Definitions
    - define min:0.5
    - define max:2.5
    - define target:<player.location.cursor_on>
    - define power:<player.location.cursor_on.distance[<player.location>].round_to[1]>
    - if <[target].distance[<player.location>]> > 50 || <[target].material.name> == air:
      - narrate "<&e>Your target is too far away!"
      - stop
    - inject abilities_check
    - inject abilities_cost
    - if <[power]> < <[min]>:
      - define power:<[min]>
    - else if <[power]> > <[max]>:
      - define power:<[max]>
    - foreach <[target].backward.find.entities.within[<[power]>]>:
      - hurt <[power].*[1.25]> <[value]>
    - playeffect explosion_huge at:<[target].backward>
