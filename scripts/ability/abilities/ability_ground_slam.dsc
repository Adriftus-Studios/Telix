ability_ground_slam:
  type: task
  debug: true
  name: ground_slam
  ability_tree: Fisticuffs
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: ON GROUND<&co> Knock back players in a 5 block radius.<&nl>IN AIR<&co> Stun players in a 3 block radius for 5 seconds.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #/ex teleport <[value]> <[value].location.with_pitch[0]>
    #/ex shoot <player> speed:-2.0 height:2.5
    - inject abilities_check
    #Check if player is in the air, if they aren't, perform standard ground slam
    - foreach <list[below|below.forward.left|below.forward|below.forward.right|below.left|below.right|below.back.left|below.back|below.back.right]> as:relative:
      - if <player.location.<[relative]>.material.name||air> != air:
        - inject abilities_cost
        - adjust <player> velocity:0,1,0
        - wait 18t
        - teleport <player> <player.location.with_pitch[75]>
        - adjust <player> velocity:0,-1,0
        - wait 10t
        - inject ability_ground_slam_explode
        - stop
    #Foreach passed, player must be in the air. Execute mid-air ground slam
    - repeat 50:
      - if <player.location.below.material.name> == air:
        - inject abilities_cost
        - wait 10t
        - inject ability_ground_slam_stun
        - stop
      - adjust <player> velocity:0,-1,0
      - wait 1s

ability_ground_slam_explode:
  type: task
  debug: true
  script:
    - playeffect explosion_huge at:<player.location.below> quantity:2 visibility:15 targets:<server.list_online_players>
    - flag player no_jump:true duration:1s
    - foreach <player.location.find.players.within[5].exclude[<player>]>:
      - look <[value]> <player.location>
      - teleport <[value]> <[value].location.with_pitch[45]>
      - shoot <[value]> o:<[value].location> speed:-2.0
    - cast slow <player> duration:2s power:255

ability_ground_slam_stun:
  type: task
  debug: true
  script:
    - foreach <player.location.find.players.within[3].exclude[<player>]>:
      - look <[value]> <player.location>
      - cast slow <[value]> duration:5s power:255
      - flag <[value]> no_jump:true duration:5s