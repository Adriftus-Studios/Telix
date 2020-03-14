ability_fireball:
  type: task
  debug: false
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
    - inject abilities_check
    - inject abilities_cost
    - shoot fireball d:<player.location.cursor_on> speed:2.20 height:0 shooter:<player> script:ability_fireball_script
    
ability_fireball_script:
  type: task
  debug: true
  script:
    - define hit:<[hit_entities].get[1].location||<[location]>>
    - foreach <[hit].above.find.entities.within[3.5].exclude[<player>]>:
      - hurt <[value].location.distance[<[hit]>].*[1.25].round_to[1]> <[value]>
      - adjust <[value]> velocity:0,1,0
    - playeffect explosion_large at:<[hit]> quantity:1 visibility:50
