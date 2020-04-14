
test_quest1:
  type: world
  quest_name: Test Quest 1
  on start:
    - narrate "Test Quest 1 Started"
  objectives:
    break_grass: 20
  events:
    on player breaks grass_block:
      - run modify_quest_progress def:<script.name>|break_grass|1

test_quest2:
  type: world
  quest_name: Test Quest 2
  on start:
    - narrate "Test Quest 2 Started"
  on complete:
    - narrate "Completed Test Quest 2"
  objectives:
    break_stone: 40
  prerequisites:
    - test_quest1
  events:
    on player breaks stone:
      - run modify_quest_progress def:<script.name>|break_stone|1

start_quest:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]>
  - foreach <[quest].yaml_key[prerequisites]||<list[]>> as:pre:
    - if !<proc[get_completed_quests].contains[<[pre]>]>:
      - define applicable:false
      - narrate "<&c>You have not completed the quest <script[<[pre]>].yaml_key[quest_name]>"
  - if <[applicable]||true>:
    - if <[quest].yaml_key[on<&sp>start]||null> != null:
      - run <[quest]> "path:on start"
    - title "title:<&6>Quest Started!" "subtitle:<&6><[quest].yaml_key[quest_name]>"
    - foreach <[quest].list_keys[objectives]> as:objective:
      - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:0

modify_quest_progress:
  type: task
  definitions: quest|objective|value
  script:
  - define quest:<script[<[quest]>]>
  - if <yaml[player.<player.uuid>].list_keys[quests.inprogress].contains[<[quest].name>]>:
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
  - define quest:<script[<[quest]>]>
  - if <[quest].yaml_key[on<&sp>completed]||null> != null:
    - run <[quest]> "path:on completed"
  - title "title:<&6>Quest Completed!" "subtitle:<&6><[quest].yaml_key[quest_name]>"
  - define quest:<script[<[quest]>]>
  - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>:!
  - yaml id:player.<player.uuid> set quests.completed:->:<[quest].name>

get_completed_quests:
  type: procedure
  definitions: player
  script:
  - determine <yaml[player.<[player].uuid||<player.uuid>>].read[quests.completed]>