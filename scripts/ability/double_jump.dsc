double_jump:
  type: world
  events:
    on player starts sneaking:
      - if <player.has_flag[jumped]> && <player.location.material.name> == air:
        - adjust <player> velocity:<player.velocity.add[0,0.4,0]>
        - flag Player jumped:!

    on player jumps:
      - flag Player jumped:true duration:1s