apply_debuff:
  type: task
  definitions: debuff
  # TODO
  # THIS SYSTEM IS NOT YET COMPLETE
  # DO NOT USE IT.
  script:
    - yaml id:player.<player.uuid> set debuffs:->:<[debuff]>
    - run <script[debuff_<[debuff]>].yaml_key[impact]> save:debuff
    - while <script[debuff_<[debuff]>].yaml_key[conditional]> && <player.is_online>:
      - wait 1s
    - if !<player.is_online>:
      - queue <entry[debuff].created_queue> clear
      - stop
    - yaml id:player.<player.uuid> set debuffs:<-:<[debuff]>
    - inject <script[debuff_<[debuff]>].yaml_key[cured]>

debuff_dehydrated:
  type: task
  script:
    - yaml id:player.<player.uuid> set debuffs:->:dehydrated
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
    - flag player no_jump:<-:encumbered
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
      - foreach <yaml[player.<player.uuid>].read[debuffs]||<list[]>>:
        - run debuff_<[value]>