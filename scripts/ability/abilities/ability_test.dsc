ability_beam_spline:
  type: task
  name: beam_spline
  ability_tree: Test
  ability_type: active
  points_to_unlock: 1000
  power_cost: 9
  description: beam_spline
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    #- inject abilities_check
    #- inject abilities_cost
    - define points:<proc[define_circle].context[<player.location.above.forward[1]>|1]>
    - repeat 1:
      - define num:<util.random.int[1].to[12]>
      - define start:<[points].get[<[num]>]>
      - define end:<[points].get[<[num].add[<[points].size.div[2].round>]>]>
      - narrate <[num]>
      - define curve:<proc[define_curve1].context[<[start]>|<[end]>|9|0|0.2]>
      - foreach <[curve]> as:point:
        - playeffect spell_witch at:<[point]> quantity:1 offset:0 visibility:100
        - wait 1t