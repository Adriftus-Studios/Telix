ability_sonar:
  type: task
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
    - if <player.location.find.entities.within[50].exclude[<player>].size> == 0:
      - narrate "<&6>There are no entities within 50 blocks of you."
      - stop
    - inject abilities_check
    - inject abilities_cost
    - define base:3
    - define interval:0.25
    - cast glowing d:<[interval].*[6]> p:255
    - foreach <player.location.find.entities.within[50].exclude[<player>]>:
      - wait <[interval]./[4]>
      - cast glowing d:<element[<[interval].*[6]>].-[<[interval].*[<[value].location.distance[<player.location>]./[10].round_down>]>].+[<[base]>]> p:255 <[value]>