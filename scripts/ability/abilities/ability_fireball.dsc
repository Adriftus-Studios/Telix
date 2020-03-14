ability_fireball:
  type: task
  name: fireball
  ability_tree: Test
  ability_type: active
  points_to_unlock: 0
  power_cost: 1
  description: Shoot a fireball towards your targeted location.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #Definitions
    - inject abilities_check
    - inject abilities_cost
    - shoot fireball d:<player.location.cursor_on> speed:2 height:0 shooter:<player> script:ability_fireball_script
    
ability_fireball_script:
  type: task
  debug: true
  script:
    - foreach <[location].above.find.entities.within[3]>:
      - hurt <[value].location.distance[<[location]>].*[1.25].round_to[1]> <[value]>
      - adjust <[value]> velocity:0,1,0
    - playeffect explosion_large at:<[location]> quantity:1 visibility:50
