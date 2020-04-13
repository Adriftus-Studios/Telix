
test_quest:
  type: world
  quest_name: Test Quest
  on start:
    - narrate Test Quest Started
  objectives:
    break_grass: 20
  events:
    on player breaks grass_block:
      - run modify_quest_progress def:<script.name>|break_grass|1

start_quest:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]>
  - narrate "quest started"
  - foreach <[quest].list_keys[objectives]> as:objective:
    - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:0

modify_quest_progress:
  type: task
  definitions: quest|objective|value
  script:
  - define quest:<script[<[quest]>]>
  - if <yaml[player.<player.uuid>].list_keys[quests.inprogress].contains[<[quest].name>]>
    - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>].add[<[value]>]||<[value]>>
    - narrate <yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]>
    - run check_quest_progress def:<[quest]>
  
check_quest_progress:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]>
  - foreach <[quest].list_keys[objectives]> as:objective:
    - define value:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]>
    - define required_value:<[quest].yaml_key[objectives.<[objective]>]>
    - if <[value]> == <[required_value]>:
      - define objectives_complete:|:<[objective]>
  - if <[quest].list_keys[objectives].size> == <[objectives_complete].size||0>:
    - run complete_quest def:<[quest]>
  
complete_quest:
  type: task
  definitions: quest
  script:
  - narrate done
  - define quest:<script[<[quest]>]>
  - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>:!
  - yaml id:player.<player.uuid> set quests.completed:|:<[quest].name>

get_completed_quests:
  type: procedure
  definitions: player
  script:
  - determine <yaml[player.<player.uuid>].read[quests.completed]>