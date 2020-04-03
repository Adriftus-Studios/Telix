ability_scald:
  type: task
  name: scald
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 0
  description: Burn your opponents with a beam of water.
  usage: Underwater > Damage for 4HP, Slow for 2s
  icon:
    material: stone
    custom_model_data: 1
  burn:
    - foreach <[points].get[<[number]>].find.living_entities.within[1].exclude[<player>]>:
      - if <[value].location.material.name> == water:
        - hurt 4 <[value]>
        - cast slow duration:2s power:1 <[value]>
        - stop
      #Replace burn with calculate_burn proc
      - burn <[value]> 5s
  script:
    #Target Skill Tree: Ocean, Target Points Requirement: 15, Target Power Cost: 10
    - inject abilities_check
    - inject abilities_cost
    - define points:<player.eye_location.points_between[<player.location.forward[25]>].distance[1]>
    - repeat <[points].size> as:number:
      - playeffect bubble_pop at:<[points].get[<[number]>].below[0.5]> quantity:1 visibility:50
      - if !<[points].get[<[number]>].find.living_entities.within[2].exclude[<player>].is_empty>:
        - inject locally burn
      - wait 1t
