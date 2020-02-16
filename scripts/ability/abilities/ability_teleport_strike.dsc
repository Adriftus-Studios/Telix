ability_teleport_strike:
  type: task
  name: teleport_strike
  ability_tree: Stealth
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  damage: 10
  description: Teleport into the air and strike at the target
  icon:
    material: stone
    custom_model_data: 1
  teleport:
  script:
    - if <player.target||null> == null:
      - stop
    - define target:<player.target>
    - teleport <[target].location.find.blocks[air].within[16].exclude[<[target].location.find.blocks[air].within[8]>].filter[y.is[MORE].than[<[target].location.y>]].random>
    - wait 1t
    - ~push <player> origin:<player.location> destination:<[target].location> speed:1.5 ignore_collision
    - hurt <[target]> <script.yaml_key[damage]>