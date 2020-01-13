debuff_dehydrated:
  type: task
  script:
    - cast confusion duration:6h
    - while <yaml[player.<player.uuid>].read[stats.thirst.current]||100> <= 0 && <player.is_online>:
      - wait 1s
    - if !<player.is_online>:
      - stop
    - yaml id:player.<player.uuid> set debuffs:<-:dehydrated
    - cast remove confusion

debuff_encumbered:
  type: task
  script:
    - flag player no_jump:->:encumbered
    - while <yaml[player.<player.uuid>].read[stats.weight.current]./[<yaml[player.<player.uuid>].read[stats.weight.max]>]> >= 0.8 && <player.is_online>:
      - wait 1s
    - if !<player.is_online>:
      - flag player no_jump:<-:encumbered
      - stop
    - yaml id:player.<player.uuid> set debuffs:<-:encumbered

debuff_no_jump:
  type: world
  events:
    on player jumps flagged:no_jump priority:-2000 bukkit_priority:LOWEST:
      - determine cancelled


debuffs_on_join:
  type: world
  events:
    on player join:
      - foreach <yaml[player.<player.uuid>].read[debuffs]>:
        - inject debuff_<[value]>