ability_beam_spline:
  type: task
  name: Beam Spline
  ability_tree: Test
  ability_type: active
  points_to_unlock: 1000
  power_cost: 9
  description: Lashes out with the Whip Blade twice to deal damage to enemies
  icon:
    material: iron_nugget
    custom_model_data: 1000
  script:
    - inject abilities_check
    - inject abilities_cost
    - define points:<proc[define_circle].context[<player.location.forward[1]>|2]>
    - define curve:<proc[define_curve1].context[<[points].random>|<[points].random>|3|<util.random.int[0].to[360]>|0.2]>
    - repeat 3:
      - foreach <[curve]> as:point:
        - playeffect spell_witch at:<[point]> quantity:5 offset:0 visibility:100
        - wait 1t