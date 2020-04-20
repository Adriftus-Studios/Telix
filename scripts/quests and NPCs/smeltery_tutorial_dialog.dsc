
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

test_quest3:
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
    on player breaks block:
      - narrate <context.item>
      - run modify_quest_progress def:<script.name>|break_grass|1
