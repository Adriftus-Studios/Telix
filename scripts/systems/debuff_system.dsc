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
    - yaml id:player.<player.uuid> set debuffs:->:encumbered
    - flag player no_jump:->:encumbered
    - while <yaml[player.<player.uuid>].read[stats.weight.current]./[<yaml[player.<player.uuid>].read[stats.weight.max]>]> >= 0.8 && <player.is_online>:
      - wait 1s
    - flag player no_jump:<-:encumberede
    - if !<player.is_online>:
      - stop
    - yaml id:player.<player.uuid> set debuffs:<-:encumbered

debuff_full_encumbered:
  type: task
  script:
    - yaml id:player.<player.uuid> set debuffs:->:full_encumbered
    - flag player no_move:->:full_encumbered
    - while <yaml[player.<player.uuid>].read[stats.weight.current]./[<yaml[player.<player.uuid>].read[stats.weight.max]>]> >= 1.1 && <player.is_online>:
      - wait 1s
    - flag player no_move:<-:full_encumbered
    - if !<player.is_online>:
      - stop
    - yaml id:player.<player.uuid> set debuffs:<-:full_encumbered

debuff_no_jump:
  type: world
  events:
    on player jumps flagged:no_jump priority:-2000 bukkit_priority:LOWEST:
      - determine cancelled

debuff_no_move:
  type: world
  events:
    on player walks flagged:no_move priority:-2000 bukkit_priority:LOWEST:
      - determine cancelled

debuffs_on_join:
  type: world
  events:
    on player join:
      - foreach <yaml[player.<player.uuid>].read[debuffs]>:
        - inject debuff_<[value]>