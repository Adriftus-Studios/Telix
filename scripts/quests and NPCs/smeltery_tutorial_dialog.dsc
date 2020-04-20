
test_dialog:
  type: yaml data
  character_name: <&a><&lb><&6>Balgoth<&a><&lb><&6>
  dialog:
    start:
      actions:
      - say Hello there <&3><player.display.name>
      - say It seems that you want to learn the ways of making Telix Steel!
      - playsound custom npc_hearty_laugh
      - say Sadly, you won't be making any Telix Steel today. Let's start off with some bronze.
      - say Why don't you take this pickaxe and go mine some copper!

      - say What are you doing down there!? You know what. Since you're in the mine, why don't you pull up some tin as well?
      options:
      - Tell me the basics|basics1
    basics1:
      actions:
      - say todo

custom_tutorial_copper_ore:
  material: iron_ore
  display name: <&7>Copper Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 100
      conditions:
      - <proc[get_quests_inprogress].contains[]>

smeltery_tutorial_1:
  type: world
  quest_name: Smeltery Tutorial 1
  description: Something
  repeatable: false
  on start:
    - narrate "Test Quest 1 Started"
  objectives:
    mine_copper:
      value: 20
      description: Mine 6 Copper Ore
  events:
    on player mines custom ore:
      - narrate <context.item>
      - run modify_quest_progress def:<script.name>|break_grass|1
