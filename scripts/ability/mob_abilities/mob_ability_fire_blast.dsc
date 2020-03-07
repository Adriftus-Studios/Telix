mob_ability_fire_blast:
  type: task
  name: fire_blast
  ability_tree: Nether
  cooldown: 10s
  warmup: 2s
  requires_target: true
  requires_target_in_sight: true
  definitions: entity
  script:
    - define points:<[entity].eye_location.points_between[<[entity].location.cursor_on>].distance[0.5]>
    - repeat <[points].size> as:number:
      - playeffect flame at:<[points].get[<[number]>]> quantity:5 offset:0.1 visibility:40
      - if !<[points].get[<[number]>].find.surface_blocks.within[2.5].is_empty>:
        - modifyblock <[points].get[<[number]>].find.surface_blocks.within[1.5].parse[above]> fire
      - if !<[points].get[<[number]>].find.living_entities.within[1.5].exclude[<[entity]>].is_empty>:
        - hurt <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<[entity]>]> 5
        - stop
      - if <[number].%[4]> == 0:
        - wait 1t
    - modifyblock <[points].get[<[number]>].find.surface_blocks.within[2.5].parse[above]> fire
    