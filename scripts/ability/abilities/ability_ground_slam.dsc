ability_ground_slam:
  type: task
  name: ground_slam
  ability_tree: Fisticuffs
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Knockback/Stun players in a 5/3 block radius.
  usage: Grounded/Midair
  icon:
    material: iron_nugget
    custom_model_data: 116
  explosion:
    - playeffect explosion_huge at:<player.location.below> quantity:2 visibility:50
    - flag player no_jump:true duration:1s
    - foreach <player.location.find.players.within[5].exclude[<player>]>:
      - look <[value]> <player.location>
      - teleport <[value]> <[value].location.with_pitch[45]>
      - shoot <[value]> o:<[value].location> speed:-2.0
    - cast slow <player> duration:2s power:255
  stun:
    - foreach <player.location.find.players.within[3].exclude[<player>]>:
      - look <[value]> <player.location>
      - playeffect crit at:<[value].location> quantity:10 targets:<[value]>
      - cast slow <[value]> duration:5s power:255
      - flag <[value]> no_jump:true duration:5s
    #- run bb_status stun|5s|<player.location.find.players.within[3].exclude[<player>]>
    - playeffect flash at:<player.location> quantity:1 visibility:50
    - cast slow <player> duration:15t power:6
  script:
    #/ex teleport <[value]> <[value].location.with_pitch[0]>
    #/ex shoot <player> speed:-2.0 height:2.5
    - inject abilities_check
    - inject abilities_cost
    #Check if player is in the air, if they aren't, perform standard ground slam, explosion
    - define blocks:2
    - repeat <[blocks]>:
      - if <player.location.below[<[value]>].backward.material.name> != air || <player.location.below[<[value]>].material.name> != air:
        - adjust <player> velocity:0,1,0
        - wait 18t
        - teleport <player> <player.location.with_pitch[75]>
        - adjust <player> velocity:0,-1,0
        - waituntil <player.location.below.material.name> != air
        - inject locally explosion
        - stop
    #Foreach passed, player must be in the air. Execute mid-air ground slam, stun
    - if <player.location.below.material.name> == air:
      - adjust <player> velocity:0,-1,0
      - waituntil <player.location.below.material.name> != air
      - inject locally stun
      - stop
