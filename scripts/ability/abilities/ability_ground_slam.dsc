ability_ground_slam:
  type: task
  name: ground_slam
  ability_tree: Fisticuffs
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Slam the ground and knock back players in a 4 block radius.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #/ex teleport <[value]> <[value].location.with_pitch[0]>
    #/ex shoot <player> speed:-2.0 height:2.5
    - inject abilities_check
    - define walk_speed:<player.walk_speed>
    - adjust <player> velocity:0,1,0
    - wait 18t
    - teleport <player> <player.location.with_pitch[75]>
    - adjust <player> velocity:0,-1,0
    - wait 8t
    - playeffect explosion_huge at:<player.location.below> quantity:2 visibility:15 targets:<server.list_online_players>
    - foreach <player.location.find.players.within[4].exclude[<player>]>:
      - teleport <[value]> <[value].location.with_pitch[45]>
      - shoot <[value]> o:<[value].location> speed:-2.0
    - adjust <player> walk_speed:0
    - wait 2s
    - adjust <player> walk_speed:<[walk_speed]>