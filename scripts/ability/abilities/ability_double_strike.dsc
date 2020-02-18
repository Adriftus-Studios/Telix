ability_double_strike:
  type: task
  script:
    - if <player.target.distance[<player.location>]||5> <= 3:
      - stop
    - inject abilities_check
    - inject abilities_cost
    - playeffect sweep_attack at:<player.location.forward.above> quantity:2
    - hurt <player.target> <player.item_in_hand.damage.*[2]>