ability_wind_blade:
  type: task
  name: wind_blade
  ability_tree: Aer
  ability_type: active
  points_to_unlock: 15
  power_cost: 10
  description: Launch a blade of wind to cut through opponents.
  icon:
    material: stone
    custom_model_data: 1
  damage:
    - foreach <[points].get[<[number]>].find.living_entities.within[2].exclude[<player>]>:
      #Replace hurt with calculate_damage proc
      - hurt <[decay].*[<[number]>].+[<[base]>]> <[value]>
      - cast slow duration:<[decay].*[<[number]>].+[<[base]>]./[2]> power:2 <[value]> hide_particles
      #- adjust <[value]> velocity:<player.location.direction.vector>
  script:
    #Target Skill Tree: Aer, Target Points Requirement: 15, Target Power Cost: 10
    - inject abilities_check
    - inject abilities_cost
    - define base:6
    - define decay:-0.24
    - define points:<player.eye_location.points_between[<player.location.forward[25]>].distance[2]>
    - playeffect sweep_attack at:<[points].get[2].below[0.75]> quantity:1 visibility:50
    - repeat <[points].size> as:number:
      - if !<[points].get[<[number]>].find.living_entities.within[3].exclude[<player>].is_empty>:
        - playeffect sweep_attack at:<[points].get[<[number]>].below[0.75]> quantity:1 visibility:50
        - inject locally damage
      - wait 1t
