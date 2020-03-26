ability_explosive_blast:
  type: task
  debug: false
  name: explosive_blast
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 20
  power_cost: 0
  description: Cast an explosion at your targeted location
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
    #Keep power in bounds
    - if <[power]> < <[min]>:
      - define power:<[min]>
    - else if <[power]> > <[max]>:
      - define power:<[max]>
    #Warmup
    - define points:<player.location.cursor_on.points_between[<player.location.cursor_on.above[25]>].distance[3]>
    - repeat <[points].size> as:number:
      - playeffect flame at:<[points].get[<[number]>]> quantity:1 visibility:50
      - wait 1t
    #Damage
    - foreach <[target].find.entities.within[<[power]>]>:
      #Replace burn with calculate_burn proc
      - burn <[value]> duration:<[power].*[1.5]>
      #Replace hurt with calculate_damage proc
      - hurt <[power].*[1.25].round_down> <[value]> cause:block_explosion
      - cast slow <[value]> duration:<[power].*[6].round_down>t power:2
    - playeffect explosion_huge at:<[target]> quantity:<[power]./[2].round_up> visibility:50
    - playeffect flash at:<[target]> quantity:5 visibility:50
