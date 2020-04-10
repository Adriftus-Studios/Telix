ability_scape_shift:
  type: task
  name: scape_shift
  ability_tree: Earth
  ability_type: active
  points_to_unlock: 10
  power_cost: 10
  distance: 25
  whitelist_materials: dirt|grass_block|sand|coarse_dirt|red_sand|mycelium|podzol|soul_sand|farmland|gravel
  description: Shift yourself 25 blocks forward, through the ground.
  icon:
    material: iron_nugget
    custom_model_data: 3
  script:
    - inject abilities_check
    - if !<script.yaml_key[whitelist_materials].contains[<player.location.below.material.name>]>:
      - narrate "Unsuitable location"
      - stop
    - flag <player> no_suffocate:true
    - define firstblock:<player.location.below.material.name>
    - define target:<player.location.forward_flat[<script.yaml_key[distance]>]||null>
    - define y_target:<cuboid[<[target].with_y[1]>|<[target].with_y[255]>].blocks[<script.yaml_key[whitelist_materials]>].filter[above.material.name.is[==].to[air]].parse[y].highest||null>
    - if <[y_target]> == null:
      - narrate "<&c>Unsuitable Location."
      - stop
    - define block_target:<location[<[target].x>,<[y_target]>,<[target].z>,<[target].world>]||null>
    - if <[block_target]> == null:
      - narrate "<&c>Unsuitable Target Location"
      - stop
    - inject abilities_cost
    - repeat 10:
      - playeffect blockdust_<[firstblock]> at:<player.location.above> quantity:10 offset:0.25
      - teleport <player.location.below[0.2]>
      - wait 1t
    - define target:<location[<[target].x>,<cuboid[<[target].with_y[1]>|<[target].with_y[255]>].blocks[<script.yaml_key[whitelist_materials]>].filter[above.material.name.is[==].to[air]].parse[y].highest>,<[target].z>,<[target].world>]>
    - teleport <[target].below.center>
    - define secondblock:<[target].material.name>
    - repeat 10:
      - playeffect blockdust_<[secondblock]> at:<player.location.above> quantity:10 offset:0.25
      - teleport <player.location.above[0.2]>
      - wait 1t
    - flag <player> no_suffocate:!

no_suffocate:
  type: world
  events:
    on player damaged by suffocation flagged:no_suffocate:
      - determine cancelled
    
    