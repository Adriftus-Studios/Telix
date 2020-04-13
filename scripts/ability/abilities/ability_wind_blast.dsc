ability_wind_blast:
  type: task
  name: wind_blast
  ability_tree: Aer
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Launch a powerful blast of wind to push your opponents
  icon:
    material: iron_nugget
    custom_model_data: 102
  apply_effect:
    - foreach <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]>:
      - adjust <[value]> velocity:<[loc].direction.vector.with_y[0.25]>
  script:
    - inject abilities_check
    - inject abilities_cost
    - define loc:<player.location>
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[1]>
    - repeat <[points].size> as:number:
      - playeffect sweep_attack at:<[points].get[<[number]>]> quantity:5 offset:1
      - if !<[points].get[<[number]>].find.living_entities.within[3].exclude[<player>].is_empty>:
        - inject locally apply_effect
      - wait 1t
    
