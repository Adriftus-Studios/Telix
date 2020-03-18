ability_explosive_blast:
  type: task
  debug: false
  name: explosive_blast
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 20
  power_cost: 15
  description: Cast an explosion at your targeted location.
  usage: Power increases as the target distance increases.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #Definitions
    - define min:1
    - define max:5
    - define target:<player.location.cursor_on>
    - define power:<player.location.cursor_on.distance[<player.location>].round_to[1]>
    #Target Skill Tree: Nether, Target Points Requirement: 20, Target Power Cost: 15
    - if <[target].distance[<player.location>]> > 50 || <[target].material.name> == air:
      - narrate "<&e>Your target is too far away!"
      - stop
    - inject abilities_check
    - inject abilities_cost
    - if <[power]> < <[min]>:
      - define power:<[min]>
    - else if <[power]> > <[max]>:
      - define power:<[max]>
    - foreach <[target].find.entities.within[<[power]>]>:
      #Replace burn with calculate_burn proc
      - burn <[value]> duration:<[value]./[2]>
      #Replace hurt with calculate_damage proc
      - hurt <[power].*[1.20].round_down> <[value]>
    - playeffect explosion_huge at:<[target]> quantity:<[power]./[2].round_up> visibility:50
    - playeffect flash at:<[target]> quantity:5 visibility:50
