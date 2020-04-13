gold_block_teleport_events:
  type: world
  events:
    on player jumps:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
    - if <player.location.below.material.name> == gold_block:
      - define y_loc:<cuboid[<context.location.above>|<context.location.above[26]>].blocks[gold_block].parse[y].lowest||null>
      - if <[y_loc]> != null && <context.location.with_y[<[y_loc].+[1]>].material.name> == air:
        - teleport <context.location.with_y[<[y_loc].+[1]>].center>
        - playeffect effect:dragon_breath at:<player.location> quantity:30
        - playsound <player.location> sound:entity_ender_eye_launch volume:2
      - else:
        - narrate "<&c>There is no destination block within range above you!"
        - playeffect effect:smoke at:<player.location> quantity:30
        - playsound <player.location> sound:entity_villager_no volume:2
        - wait 2s
    on player starts sneaking:
    # teleport players to first gold block within 25 blocks. If they are not standing on the block,
    - if <player.location.below.material.name> == gold_block:
      - define y_loc:<cuboid[<player.location.below[2]>|<player.location.below[26]>].blocks[gold_block].parse[y].highest||null>
      - if <[y_loc]> != null && <player.location.with_y[<[y_loc].+[1]>].material.name> == air:
        - teleport <player.location.with_y[<[y_loc].+[1]>].center>
        - playeffect effect:dragon_breath at:<player.location> quantity:30
        - playsound <player.location> sound:entity_ender_eye_launch volume:2
      - else:
        - narrate "<&c>There is no destination block within range below you!"
        - playeffect effect:smoke at:<player.location> quantity:30
        - playsound <player.location> sound:entity_villager_no volume:2
        - wait 2s