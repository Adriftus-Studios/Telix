ability_wind_blast:
  type: task
  name: wind_blast
  ability_tree: Elemental
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Launch a powerful blast of wind to push your opponents
  icon:
    material: stone
    custom_model_data: 1
  apply_effect:
    - foreach <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]>:
      - define original:<[value].location>
      - shoot <[value]> o:<[value].location> destination:<[value].location.with_pitch[0].with_yaw[<[loc].yaw>].forward[5]>
      - wait 1t
      - look <[value]> <[original].precise_cursor_on> duration:1t
  script:
    - inject abilities_check
    - define loc:<player.location>
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[1]>
    - repeat <[points].size> as:number:
      - playeffect sweep_attack at:<[points].get[<[number]>]> quantity:5 offset:1
      - if !<[points].get[<[number]>].find.living_entities.within[3].exclude[<player>].is_empty>:
        - inject locally apply_effect
      - if <[number].%[4]> == 0:
        - wait 1t
    