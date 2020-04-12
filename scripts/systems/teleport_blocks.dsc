gold_block_teleport_events:
  type: world
  events:
    on player right clicks gold_block:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
      - determine passively cancelled
      - define y_loc:<cuboid[<context.location.above>|<context.location.above[26]>].blocks[gold_block].parse[y].lowest||null>
      - if <[y_loc]> != null:
        - teleport <context.location.with_y[<[y_loc].+[1]>]>
      - else:
        - narrate "nope"
    on player left clicks gold_block:
      - if <player.is_sneaking>:
        - stop
      - else:
        - determine passively cancelled