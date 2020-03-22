ability_aer_strike:
  type: task
  name: aer_strike
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 0
  description: Launch a blade of wind to cut through opponents
  icon:
    material: stone
    custom_model_data: 1
  damage:
    - foreach <[points].get[<[number]>].find.living_entities.within[2].exclude[<player>]>:
      #Replace hurt with calculate_damage proc
      - hurt <[decay].*[<[number]>].+[<[base]>]> <[value]>
      - adjust <[value]> velocity:<player.location.direction.vector./[2]>
      - narrate <[decay].*[<[number]>].+[<[base]>]>
  script:
    #Target Skill Tree: Aer, Target Points Requirement: 10, Target Power Cost: 10
    - inject abilities_check
    - inject abilities_cost
    - define base:4
    - define decay:-0.16
    - define points:<player.eye_location.points_between[<player.location.forward[25]>].distance[2]>
    - repeat <[points].size> as:number:
      - playeffect sweep_attack at:<[points].get[<[number]>].below[0.5]> quantity:1 visibility:50
      - if !<[points].get[<[number]>].find.living_entities.within[3].exclude[<player>].is_empty>:
        - inject locally damage
      - wait 1t
