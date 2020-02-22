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
    - foreach <player.location.find.entities.within[50]>:
      - cast glowing d:3s p:255 <[value]>