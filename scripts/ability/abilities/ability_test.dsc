ability_beam_spline:
  type: task
  name: beam_spline
  ability_tree: Test
  ability_type: active
  points_to_unlock: 1000
  power_cost: 9
  description: Lashes out with the Whip Blade twice to deal damage to enemies
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    #- inject abilities_check
    #- inject abilities_cost
    - define points:<proc[define_circle].context[<player.location.forward[1]>|2]>
    - repeat 1:
      - define num:<util.random.int[1].to[<[points].size.div[2]>]>
      - define start:<[points].get[<[num]>]>
      - define end:<[points].get[<[num].add[<[points].size.div[2]>]>]>
      - narrate <[num]>
      - narrate <[start]>
      - narrate <[end]>
      - define curve:<proc[define_curve1].context[<[start]>|<[end]>|3|<util.random.int[0].to[360]>|0.2]>
      - foreach <[curve]> as:point:
        - playeffect spell_witch at:<[point]> quantity:1 offset:0 visibility:100
        - wait 1t