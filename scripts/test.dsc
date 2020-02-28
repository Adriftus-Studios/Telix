ability_test_spell:
  type: command
  name: test_spell
  ability_tree: Nether
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Test Spell
  icon:
    material: iron_nugget
    custom_model_data: 100
  animation:
    - narrate 1
  apply_damage:
    - hurt <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> 5
    - burn <[points].get[<[number]>].find.living_entities.within[1.5].exclude[<player>]> <script.yaml_key[duration]>
  script:
    - inject abilities_check
    - inject abilities_cost
    - define points:<player.eye_location.points_between[<player.location.cursor_on>].distance[0.5]>
    
    - run locally path:animation