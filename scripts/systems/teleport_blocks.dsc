gold_block_teleport_events:
  type: world
  events:
    on player jumps:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
    - if <player.location.below.material.name> == gold_block:
      - define y_loc:<cuboid[<context.location.above>|<context.location.above[26]>].blocks[gold_block].parse[y].lowest||null>
      - if <[y_loc]> != null && <context.location.with_y[<[y_loc].+[1]>].material.name> == air:
        - teleport <context.location.with_y[<[y_loc].+[1]>].center>
      - else:
        - narrate "<&c>There is no destination block above you!"
    on player starts sneaking:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
    - if <player.location.below.material.name> == gold_block:
      - define y_loc:<cuboid[<player.location.below>|<context.location.below[26]>].blocks[gold_block].parse[y].highest||null>
      - if <[y_loc]> != null && <context.location.with_y[<[y_loc].+[1]>].material.name> == air:
        - teleport <context.location.with_y[<[y_loc].+[1]>].center>
      - else:
        - narrate "<&c>There is no destination block below you!"