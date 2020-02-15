ability_fire_blast:
  type: task
  name: fire_blast
  ability_tree: Elemental
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Launch a powerful fire blast to burn your opponents
  icon:
    material: stone
    custom_model_data: 1
  apply_damage:
    - burn <[points].get[<[number]>].find.entities.within[0.5]> <script.yaml_key[duration]>
  script:
    - inject abilities_check
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    - repeat <[points].size> as:number:
      - playeffect redstone at:<[points].get[<[number]>]> quantity:30 offset:0.25 special_data:0.5|red
      - if !<[points].get[<[number]>].find.entities.within[0.5].is_empty>:
        - inject locally apply_damage
        - stop
      - if <[number].%[4]> == 0:
        - wait 1t
    