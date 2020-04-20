
test_quest1:
  type: world
  quest_name: Test Quest 1
  description: This is just a test
  repeatable: false
  on start:
    - narrate "Test Quest 1 Started"
  objectives:
    break_grass:
      value: 20
      description: Break 20 Grass Blocks
    break_stone:
      value: 20
      description: Break 20 Stone Blocks
      prerequisites:
      - break_grass
  events:
    on player breaks grass_block:
      - run modify_quest_progress def:<script.name>|break_grass|1
    on player breaks stone:
      - run modify_quest_progress def:<script.name>|break_stone|1

test_quest2:
  type: world
  quest_name: Test Quest 2
  description: This is also a test
  repeatable: true
  repeatable_every: 1d
  completion_xp: 100
  additional_conditions:
  on start:
    - narrate "Test Quest 2 Started"
  on complete:
    - narrate "Completed Test Quest 2"
  objectives:
    break_stone:
      value: 40
      description: Break 40 Stone Blocks
  prerequisites:
    - test_quest1
  level_requirement: 5
  events:
    on player breaks stone:
      - run modify_quest_progress def:<script.name>|break_stone|1

test_quest_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "something something something"
    - run offer_quests def:<script>
  quests:
    test_quest1:
      dialog: smeltery_tutorial_dialog
    test_quest2:
      dialog: none

offer_quests:
  type: task
  definitions: assignment
  script:
  - foreach <script[<[assignment]>].list_keys[quests]||<list[]>> as:quest:
    - if <proc[applicable_for_quest].context[<[quest]>]> == true || <proc[applicable_for_quest].context[<[quest]>]> == level:
      - narrate <script[<[assignment]>].yaml_key[quests.<[quest]>.dialog]>
      - define el:<element[<script[<[quest]>].yaml_key[quest_name]>]>
      - foreach <script[<[quest]>].list_keys[objectives]||<list[]>> as:obj:
        - define objectives:|:<script[<[quest]>].yaml_key[objectives.<[obj]>.description]>
      - if <script[<[assignment]>].yaml_key[quests.<[quest]>.dialog]||none> != none:
        - define "el:lvl <script[<[quest]>].yaml_key[level_requirement]||1> - <[el].on_hover[<[objectives].separated_by[<&nl>]||<list[]>>].on_click[/dialog <script[<[assignment]>].yaml_key[quests.<[quest]>.dialog]> start]>"
      - else:
        - define "el:lvl <script[<[quest]>].yaml_key[level_requirement]||1> - <[el].on_hover[<[objectives].separated_by[<&nl>]||<list[]>>].on_click[/dialog <script[<[assignment]>].yaml_key[quests.<[quest]>.dialog]||quest_start> <[quest]>]>"
      - if <proc[applicable_for_quest].context[<[quest]>]> == level:
        - define el:<&c><[el]>
      - else:
        - define el:<&9><[el]>
      - narrate <[el]>

start_quest:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
     - stop
  - if <[quest].yaml_key[additional_conditions].parse[parsed].contains[false]||false>:
    - define applicable:false
    - narrate "<&c>You have unmet conditions"
  - foreach <[quest].yaml_key[prerequisites]||<list[]>> as:pre:
    - if !<proc[get_completed_quests].contains[<[pre]>]>:
      - define applicable:false
      - narrate "<&c>You have not completed the quest <script[<[pre]>].yaml_key[quest_name]>"
  - if <yaml[player.<player.uuid>].read[stats.level]||1> < <[quest].yaml_key[level_requirement]||1>:
    - define applicable:false
    - narrate "<&c>Your level is not high enough. Required Level: <[quest].yaml_key[level_requirement]>"
  - if !<[quest].yaml_key[repeatable]||false> && <proc[get_completed_quests].contains[<[quest].name>]>:
    - define applicable:false
    - narrate "<&c>You cannot repeat this quest."
  - if <[quest].yaml_key[repeatable]||false> && <player.has_flag[<[quest].name>]>:
    - define applicable:false
    - narrate "<&c>You cannot start this quest right now. You must wait <player.flag[<[quest].name>].expiration.formatted>"
  - if <[applicable]||true>:
    - if <[quest].yaml_key[on<&sp>start]||null> != null:
      - run <[quest]> "path:on start"
    - title "title:<&6>Quest Started!" "subtitle:<&6><[quest].yaml_key[quest_name]>"
    - event "player starts quest" context:quest|<[quest]>
    - foreach <[quest].list_keys[objectives]> as:objective:
      - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:0

modify_quest_progress:
  type: task
  definitions: quest|objective|value
  script:
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
     - stop
  - if <proc[get_quests_inprogress].contains[<[quest].name>]||false>:
    - foreach <[quest].yaml_key[objectives.<[objective]>.prerequisites]||<list[]>> as:pre:
      - if !<proc[get_completed_objectives].context[<[quest]>].as_list.contains[<[pre]>]>:
        - stop
    - if <yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]||0> != <[quest].yaml_key[objectives.<[objective]>.value]>:
      - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>.objectives.<[objective]>:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>].add[<[value]>]||<[value]>>
      - run check_quest_progress def:<[quest]>
      - if <yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]||0> == <[quest].yaml_key[objectives.<[objective]>.value]>:
        - event "player completes quest objective" context:quest|<[quest]>|objective|<[objective]>
        - narrate "<&b>Objective Complete: <[quest].yaml_key[objectives.<[objective]>.description]>"
  
check_quest_progress:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
    - stop
  - foreach <[quest].list_keys[objectives]> as:objective:
    - define value:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]||0>
    - define required_value:<[quest].yaml_key[objectives.<[objective]>.value]>
    - if <[value]> == <[required_value]>:
      - define objectives_complete:|:<[objective]>
  - if <[quest].list_keys[objectives].size> == <[objectives_complete].size||0>:
    - run complete_quest def:<[quest]>
  
complete_quest:
  type: task
  definitions: quest
  script:
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
     - stop
  - if <[quest].yaml_key[on<&sp>completed]||null> != null:
    - run <[quest]> "path:on completed"
  - if <[quest].yaml_key[completion_xp]||null> != null:
    - run playerLevel_GiveXP def:<[quest].yaml_key[completion_xp]>
  - title "title:<&6>Quest Completed!" "subtitle:<&6><[quest].yaml_key[quest_name]>"
  - define quest:<script[<[quest]>]>
  - yaml id:player.<player.uuid> set quests.inprogress.<[quest].name>:!
  - yaml id:player.<player.uuid> set quests.completed:->:<[quest].name>
  - event "player completes quest" context:quest|<[quest]>
  - if <[quest].yaml_key[repeatable]||false>:
    - flag <player> <[quest].name> duration:<[quest].yaml_key[repeatable_every]||1d>

get_completed_quests:
  type: procedure
  definitions: player
  script:
  - determine <yaml[player.<[player].uuid||<player.uuid>>].read[quests.completed]||<list[]>>

get_quests_inprogress:
  type: procedure
  definitions: player
  script:
  - determine <yaml[player.<[player].uuid||<player.uuid>>].list_keys[quests.inprogress]||<list[]>>

get_completed_objectives:
  type: procedure
  definitions: quest
  script:
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
     - stop
  - foreach <[quest].list_keys[objectives]> as:objective:
    - define value:<yaml[player.<player.uuid>].read[quests.inprogress.<[quest].name>.objectives.<[objective]>]||0>
    - define required_value:<[quest].yaml_key[objectives.<[objective]>.value]>
    - if <[value]> == <[required_value]>:
      - define objectives_complete:|:<[objective]>
  - determine <[objectives_complete]||<list[]>>

applicable_for_quest:
  type: procedure
  definitions: quest|player
  script:
  - adjust <queue> linked_player:<[player]||<player>>
  - define quest:<script[<[quest]>]||null>
  - if <[quest]> == null:
     - stop
  - if <[quest].yaml_key[additional_conditions].parse[parsed].contains[false]||false>:
    - define "applicable:unmet conditions"
  - if <proc[get_quests_inprogress].contains[<[quest].name>]||false>:
    - define "applicable:already started"
  - foreach <[quest].yaml_key[prerequisites]||<list[]>> as:pre:
    - if !<proc[get_completed_quests].contains[<[pre]>]>:
      - define "applicable:prerequisites"
  - if <yaml[player.<player.uuid>].read[stats.level]> < <[quest].yaml_key[level_requirement]||1>:
    - define "applicable:level"
  - if !<[quest].yaml_key[repeatable]||false> && <proc[get_completed_quests].contains[<[quest].name>]>:
    - define "applicable:cannot repeat"
  - if <[quest].yaml_key[repeatable]||false> && <player.has_flag[<[quest].name>]>:
    - define "applicable:cooldown"
  - determine <[applicable]||true>