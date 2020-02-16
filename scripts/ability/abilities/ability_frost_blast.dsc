ability_frost_blast:
  type: task
  name: frost_blast
  ability_tree: Elemental
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Shoot a blast that freezes a player in place
  icon:
    material: stone
    custom_model_data: 1
  apply_effect:
    - foreach <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]>:
      - showfake ice <[value].location.find.blocks.within[3]> players:<server.list_online_players> duration:10s
  apply_environmental_effect:
    - showfake ice <[points].get[<[number]>].find.blocks.within[4].filter[material.name.contains[water]]> players:<server.list_online_players> duration:10s
  script:
    - inject abilities_check
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    - repeat <[points].size> as:number:
      - playeffect snowball at:<[points].get[<[number]>]> quantity:10 offset:0.1
      - playeffect blockdust_ice at:<[points].get[<[number]>]> quantity:10 offset:0.2
      - if !<[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>].is_empty>:
        - inject locally apply_effect
        - stop
      - if <[points].get[<[number]>].find.blocks.within[2].parse[material.name].contains[water]>:
          - inject locally apply_environmental_effect
          - stop
      - if <[number].%[4]> == 0:
        - wait 1t
