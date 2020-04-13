
test_quest:
  type: world
  quest_name: Test Quest
  on start:
    - narrate Test Quest Started
  objectives:
    break_stone: 20
  events:
    on player breaks block:
      - if <context.material.name> == stone:
        - run modify_quest_progress def:<script.name>|break_stone|1

start_quest:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]>
  - narrate quest started
  - foreach <[quest].list_keys[objectives]> as:objective:
    - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:0

modify_quest_progress:
  type: task
  definitions: quest|objective|value
  script:
  - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>].add[<[value]>]>
  - narrate <yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]>
  - run check_quest_progress def:<[quest]>
  
check_quest_progress:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]>
  - foreach <yaml[player.<player.uuid>].list_keys[quests.in_progress.<[quest].name>.objectives]> as:objective:
    - define value:<yaml[player.<player.uuid>].read[quests.in_progress.<[quest].name>.objectives.<[objective]>]>
    - define required_value:<[quest].yaml_key[objectives.<[objective]>]>
    - if <[value]> == <[required_value]>:
      - define objectives_complete:|:<[objective]>
  - if <[quest].list_keys[objectives].size> == <[objectives_complete].size>:
    - run complete_quest def:<[quest]>
  
complete_quest:
  type: task
  definitions: quest
  script:
  - narrate done
  - define quest:<script[<[quest]>]>
  - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>:!
  - yaml id:player.<player.uuid> set quests.completed:|:<[quest].name>
