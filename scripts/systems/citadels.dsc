Citadel_System_Break:
  type: world
  events:
    on player breaks block:
      - inject Citadel_BlockCheck
          
Citadel_loadData:
  type: task
  definitions: loc
  script:
    - yaml load:data/CITADEL/<[loc]>.yml id:citadel.<[loc]>
    - flag server <[loc]>:true duration:9s
    - wait 10s
    - if !<server.has_flag[<[loc]>]>:
      - yaml savefile:data/CITADEL/<[loc]>.yml id:citadel.<[loc]>
      - yaml unload id:citadel.<[loc]>

Citadel_BlockCheck:
  type: task
  scripts:
    - define loc:<context.location.simple>
    - if !<yaml.list.contains[citadel.<[loc]>]>:
      - if <server.has_file[data/CITADEL/<[loc]>.yml]||false>:
        - run Citadel_loadData def:<[loc]>
      - else:
        - stop
    - define group:<yaml[citadel.<[loc]>].read[group]>
    # TODO
    # Group Check
    # False for no break permission.
    # (Damage Block Instead)
    - if false:
      - inject Citadel_DamageBlock
    - else:
      - adjust server delete_file:data/CITADEL/<[loc].simple>.yml

Citadel_DamageBlock:
  type: task
  script:
    - yaml id:citadel.<[loc]> set health:-:<[amount]||1>
    - if <yaml[citadel.<[loc]>].read[health]> <= 0:
      - adjust server delete_file:data/CITADEL/<[loc]>.yml
      - yaml unload id:citadel.<[loc]>
    - else:
      - determine cancelled
      - narrate "<&2>Block Health Remaining<&co><&e> <yaml[citadel.<[loc]>].read[health]>"

Citadel_ReinforceBlock_events:
  type: world
  events:
    on player places block:
      - if <yaml[player.<player.uuid>].read[citadel.reinforcing.group]||null> == null:
        - stop
      - if <yaml[player.<player.uuid>].read[citadel.reinforcing.block_type]||null> == null:
        - stop
      - if !<player.inventory.contains.scriptname[<yaml[player.<player.uuid>].read[citadel.reinforcing.block_type]>]>:
        - narrate "<&c>You have no <yaml[player.<player.uuid>].read[citadel.reinforcing.block_type].as_item.display_name><&c> to reinforce this block with."
        - stop
      - inject Citadel_PlaceBlock
    on player places block:
      - if <context.item_in_hand.script.yaml_key[citadel_reinforcement]>:
        - narrate "<&c>You cannot place reinforcement blocks."
        - determine cancelled

Citadel_PlaceBlock:
  type: task
  script:
    - yaml create id:citadel.<context.location.simple>
    - yaml id:citadel.<context.location.simple> set health:<yaml[player.<player.uuid>].read[citadel.reinforcing.block_type].as_script.yaml_key[citadel_reinforcement]>
    - yaml id:citadel.<context.location.simple> set group:<yaml[player.<player.uuid>].read[citadel.reinforcing.group]>
    - take <yaml[player.<player.uuid>].read[citadel.reinforcing.block_type].as_item>
      

Bastion_Creation_PlacementCheck:
  type: task
  definitions: location|size
  script:
    - if <[location.y]> != 2:
      # TODO
      # Potential Narration Spot
      # Bastion must be on Bedrock
      - stop
    - define thisCuboid:<cuboid[<location[<[location].x.-[<[size]>]>,0,<[location].z.-[<[size]>]>,<[location].world>]>|<location[<[location].x.+[<[size]>]>,255,<[location].z.+[<[size]>]>,<[location].world>]>]>
    - if <server.list_notables[cuboid].filter[starts_with[bastion_<yaml[player.<player.uuid>].read[group.reinforcing]>].not].filter[starts_with[bastion_]].filter[intersects[<[thisCuboid]>]].size> > 0:
    - if <cuboid[bastion_<yaml[player.<player.uuid>].read[group.reinforcing]>]||null> == null:
      - note <[thisCuboid]> as:bastion_<yaml[player.<player.uuid>].read[group.reinforcing]>
      - note <[location]> as:bastionBlock_<yaml[player.<player.uuid>].read[group.reinforcing]>_1
    - else:
      - 
    # TODO
    # Place actual Bastion block & initialize stuff.

Bastion_PlaceBlock_Check:
  type: world
  events:
    on player places BastionBlock bukkit_priority:LOWEST:
      - define bastions <context.location.cuboids.filter[notable_name.starts_with[bastion_]]>
      - if <[bastions].size> > 0:
        - foreach <[bastions]>:
          # TODO
          # Group Check Below
          - if PLAYER NOT IN GROUP:
            - determine cancelled