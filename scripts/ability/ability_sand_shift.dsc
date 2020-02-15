ability_sand_shift:
  type: task
  name: sand_shift
  ability_tree: Elemental
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  distance: 25
  whitelist_materials: dirt|grass_block|sand
  description: Shift yourself 25 blocks forward, through the ground.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - flag <player> no_suffocate:true
    - define target:<player.location.forward_flat[<script.yaml_key[distance]>]>
    - repeat 10:
      - teleport <player.location.below[0.2]>
      - wait 1t
    - teleport <location[<[target].x>,<cuboid[<[target].with_y[1]>|<[target].with_y[255]>].blocks[<script.yaml_key[whitelist_materials]>].parse[y].highest>,<[target].z>,<[target].world>].below>
    - repeat 10:
      - teleport <player.location.above[0.2]>
      - wait 1t
    - flag <player> no_suffocate:!

no_suffocate:
  type: world
  events:
    on player damaged by suffocate flagged:no_suffocate:
      - determine cancelled
    
    