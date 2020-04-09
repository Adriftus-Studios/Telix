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
    material: iron_nugget
    custom_model_data: 14
  teleport:
  script:
    - if <player.target||null> == null:
      - stop
    - inject abilities_check
    - inject abilities_cost
    - define target:<player.target>
    - define point:<[target].location.find.blocks[air].within[16].exclude[<[target].location.find.blocks[air].within[8]>].filter[y.is[MORE].than[<[target].location.y>]].random>
    
    - while !<[point].line_of_sight[<[target].location>]>:
      - define point:<[target].location.find.blocks[air].within[16].exclude[<[target].location.find.blocks[air].within[8]>].filter[y.is[MORE].than[<[target].location.y>]].random>
    - teleport <[point]>
    - ~push <player> origin:<player.location> destination:<[target].location> speed:1.5 ignore_collision no_damage
    - hurt <[target]> <script.yaml_key[damage]>