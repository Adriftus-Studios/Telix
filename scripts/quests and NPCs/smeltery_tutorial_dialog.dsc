
# NOTES and Standards:
# NPC Names -- <&a><&lb> <&1><npc.name> <&a><&rb><&6>
# Top Chat Dividers -- "<&l><&e><&sp><&sp><&sp><&sp>* * * * * * * <&d>Quest <&e>* * * * * * *"
# Bottom Chat Dividers -- "<&l><&e><&sp><&sp><&sp><&sp>* * * * * * * * * * * * * * * * *"
# Objective Updates -- "<&6><&lb><&a> New Objective <&6><&rb><&a><&co> <objective.text>"

smeltery_tutorial_dialog:
  type: yaml data
  character_name: <&a><&lb> <&1>Balgoth <&a><&rb><&6>
  dialog:
    start:
      actions:
      - say Hello there <&3><player.name>
      - offer quests
    smeltery_tutorial_quest_starting_dialog_1:
      actions:
      - say It seems that you want to learn the ways of making Telix Steel!
      # This was pseudo code. I'll get the legit command written for it
      # - playsound custom npc_hearty_laugh
      - say Sadly, you won't be making any Telix Steel today. Let's start off with some bronze.
      # Line 17 should be a new line to the same effect. And the chat dividers should be in place.
      - say Why don't you take this pickaxe and go mine some copper!
      - quest start smeltery_tutorial_quest_1
      # Linke 27 should fire only after they mine the first 6 copper.
    smeltery_tutorial_quest_starting_dialog_2:
      actions:
      - say What are you doing down there!? You know what. Since you're in the mine, why don't you pull up some tin as well?
      - quest start smeltery_tutorial_quest_2
    smeltery_tutorial_quest_starting_dialog_3:
      actions:
      - say You did it! Now get that raw ore up here, and let me show you what a real blacksmith can do!
      - quest start smeltery_tutorial_quest_3
  quests:
    smeltery_tutorial_quest_1:
      dialog: smeltery_tutorial_dialog
      dialog_start: smeltery_tutorial_quest_starting_dialog_1
    smeltery_tutorial_quest_2:
      dialog: smeltery_tutorial_dialog
      dialog_start: smeltery_tutorial_quest_starting_dialog_2

smeltery_tutorial_quest_1:
  type: world
  quest_name: Smeltery Tutorial 1
  description: Mine in the mine at spawn, and then bring Balgoth the ores. There he will tell you to take them to the smeltery, and smelt the ores together.
  repeatable: false
  on start:
  - give tutorial_pick
  on completed:
  - run play_dialog def:smeltery_tutorial_dialog|smeltery_tutorial_quest_starting_dialog_2
  objectives:
    mine_copper:
      value: 3
      description: Mine 3 Copper Ore
  events:
    on player mines custom_tutorial_copper_ore:
      - run modify_quest_progress def:<script.name>|mine_copper|1

smeltery_tutorial_quest_2:
  type: world
  quest_name: Smeltery Tutorial 2
  description: Mine in the mine at spawn, and then bring Balgoth the ores. There he will tell you to take them to the smeltery, and smelt the ores together.
  repeatable: false
  prerequisites:
    - smeltery_tutorial_quest_1
  on completed:
  - run play_dialog def:smeltery_tutorial_dialog|smeltery_tutorial_quest_starting_dialog_3
  objectives:
    mine_tin:
      value: 5
      description: Mine 5 Tin Ore
  events:
    on player mines custom_tutorial_tin_ore:
      - run modify_quest_progress def:<script.name>|mine_tin|1

smeltery_tutorial_quest_3:
  type: world
  quest_name: Smeltery Tutorial 3
  description: Mine in the mine at spawn, and then bring Balgoth the ores. There he will tell you to take them to the smeltery, and smelt the ores together.
  repeatable: false
  prerequisites:
    - smeltery_tutorial_quest_2
  objectives:
    talk_to_npc:
      value: 1
      description: Mine 5 Tin Ore
  events:
    on player interacts with npc balgoth_assignment:
      - run modify_quest_progress def:<script.name>|talk_to_npc|1

tutorial_pick:
  material: iron_pickaxe
  type: item
  display name: <&7>Tutorial Pickaxe

custom_tutorial_tin_ore:
  material: iron_ore
  display name: <&7>Tutorial Tin Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 10
      conditions:
      - <proc[get_quests_inprogress].contains[smeltery_tutorial_quest_2]>

custom_tutorial_copper_ore:
  material: iron_ore
  display name: <&7>Tutorial Copper Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 10
      conditions:
      - <proc[get_quests_inprogress].contains[smeltery_tutorial_quest_1]>
