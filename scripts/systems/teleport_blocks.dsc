gold_block_teleport_events:
  type: world
  events:
    on player right clicks gold_block:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
      - determine passively cancelled
      - if <cuboid[<player.location.below.with_yaw[<player.location.yaw.round_to_precision[90]>].forward_flat.right>:
    on player left clicks gold_block:
      - if <player.is_sneaking>:
        - stop
      - else:
        - determine passively cancelled