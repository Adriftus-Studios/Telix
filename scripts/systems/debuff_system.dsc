debuff_dehydration:
  type: task
  script:
    - cast confusion duration:6h
    - while <yaml[player.<player.uuid>].read[stats.thirst.current]> <= 0 && <player.is_online>:
      - wait 1s
    - if !<player.is_online>:
      - stop
    - flag player effects:<-:dehydrated
    - cast remove confusion


debuffs_on_join:
  type: world
  events:
    on player join:
      - foreach <yaml[player.<player.uuid>].read[debuffs]>:
        - inject debuff_<[value]>