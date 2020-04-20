
smeltery_tutorial_dialog:
  type: yaml data
  character_name: <&a><&lb><&6>Balgoth<&a><&rb><&6>
  dialog:
    start:
      actions:
      - say Hello there <&3><player.name>
      - say It seems that you want to learn the ways of making Telix Steel!
      - playsound custom npc_hearty_laugh
      - say Sadly, you won't be making any Telix Steel today. Let's start off with some bronze.
      - say Why don't you take this pickaxe and go mine some copper!
      - give tutorial_pick
      - quest start smeltery_tutorial_1
      - say What are you doing down there!? You know what. Since you're in the mine, why don't you pull up some tin as well?

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
      - <proc[get_quests_inprogress].contains[smeltery_tutorial_1]>

custom_tutorial_copper_ore:
  material: iron_ore
  display name: <&7>Tutorial Copper Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 5
      conditions:
      - <proc[get_quests_inprogress].contains[smeltery_tutorial_1]>

smeltery_tutorial_1:
  type: world
  quest_name: Smeltery Tutorial 1
  description: Something
  repeatable: false
  objectives:
    mine_copper:
      value: 6
      description: Mine 6 Copper Ore
    mine_tin:
      value: 3
      description: Mine 3 Tin Ore
    talk_to_npc:
      value: 1
      description: Talk to the NPC
      prerequisites:
      - mine_copper
      - mine_tin
  events:
    on player breaks custom_tutorial_copper_ore:
      - run modify_quest_progress def:<script.name>|mine_copper|1
    on player breaks custom_tutorial_tin_ore:
      - run modify_quest_progress def:<script.name>|mine_tin|1
    on player interacts with npc balgoth_assignment:
      - run modify_quest_progress def:<script.name>|talk_to_npc|1