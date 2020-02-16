ability_frost_blast:
  type: task
  name: scape_shift
  ability_tree: Elemental
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  distance: 25
  whitelist_materials: dirt|grass_block|sand|coarse_dirt|red_sand|mycelium|podzol|soul_sand|farmland|gravel
  description: Shift yourself 25 blocks forward, through the ground.
  icon:
    material: stone
    custom_model_data: 1
  apply_effect:
    - hurt <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> 5
    - burn <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> <script.yaml_key[duration]>
  script:
    - inject abilities_check
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    - repeat <[points].size> as:number:
      - playeffect snowball at:<[points].get[<[number]>]> quantity:10 offset:0.1
      - playeffect blockdust_ice at:<[points].get[<[number]>]> quantity:10 offset:0.2
      - if !<[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>].is_empty>:
        - inject locally apply_effect
        - stop
      - if <[number].%[4]> == 0:
        - wait 1t
