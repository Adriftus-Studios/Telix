mob_ability_fireball:
  type: task
  name: fireball
  ability_tree: Nether
  cooldown: 10s
  warmup: 2s
  requires_target: true
  requires_target_in_sight: true
  definitions: entity
  script:
    - shoot fireball d:<[entity].target.location> speed:2.10 height:0 shooter:<[entity]> script:mob_ability_fireball_script
    
mob_ability_fireball_script:
  type: task
  script:
    - define hit:<[hit_entities].get[1].location||<[location]>>
    - foreach <[hit].above.find.entities.within[3.5]>:
      #Replace hurt with calculate_damage proc
      - hurt <[value].location.distance[<[hit]>].*[1.25].round_to[1]> <[value]>
      #Replace burn with calculate_burn proc
      - burn <[value]> duration:10t
      - adjust <[value]> velocity:0,1,0
    - playeffect explosion_large at:<[hit]> quantity:1 visibility:50
