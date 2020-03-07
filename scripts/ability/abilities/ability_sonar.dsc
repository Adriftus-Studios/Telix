ability_sonar:
  type: task
  debug: true
  name: sonar
  ability_tree: Perception
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  description: Reveal entity locations in a 50 block radius.
  icon:
    material: stone
    custom_model_data: 1
  script:
    #Stop ability usage if there are no entities within 50 blocks of the player.
    - if <player.location.find.entities.within[50].exclude[<player>].size> == 0:
      - narrate "<&6>There are no entities within 50 blocks of you."
      - stop
    - inject abilities_check
    - inject abilities_cost
    #Change variables to balance the ability. Y = mx + b. Default: [interval] m = 0.25, [base] b = 3.
    - define interval:0.25
    - define base:3
    #Cast glowing on the user
    - cast glowing d:<[interval].*[6].+[<[base]>]> p:255
    #Cast glowing on entities within range
    - foreach <player.location.find.entities.within[50].exclude[<player>].sort_by_number[location.distance[<player.location>]]>:
      - cast glowing d:<element[<[interval].*[6]>].-[<[interval].*[<[value].location.distance[<player.location>]./[10].round_down>]>].+[<[base]>]> p:255 <[value]>