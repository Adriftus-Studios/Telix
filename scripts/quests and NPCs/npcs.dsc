
#    /npc assign --set guild_master_assignment

balgoth_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - run play_dialog def:smeltery_tutorial_dialog|start

guide_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    #- trigger name:proximity state:true
    on click:
    - define "lines:|:<&a><&lb><&6>Guide<&a><&rb><&6> What would you like to know? (Click One)"
    on enter proximity:
    - define "lines:|:<&a><&lb><&6>Guide<&a><&rb><&6> Need to know something?"
    - define "lines:|:<&a><&lb><&6>Guide<&a><&rb><&6> I know it all! Just ask."
    - define "lines:|:<&a><&lb><&6>Guide<&a><&rb><&6> Knowledge is power."
    - define "lines:|:<&a><&lb><&6>Guide<&a><&rb><&6> Smeltery, Guilds, Bosses; It's all here."
    - narrate <[lines].random>

guild_master_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - define "lines:|:<&a><&lb><&6>Guild Master<&a><&rb><&6> Make sure to watch your guild funds!"
    - define "lines:|:<&a><&lb><&6>Guild Master<&a><&rb><&6> When I was a young lad, I tried to start a guild too."
    - define "lines:|:<&a><&lb><&6>Guild Master<&a><&rb><&6> You look like a person of character!"
    - define "lines:|:<&a><&lb><&6>Guild Master<&a><&rb><&6> HAHA! So, you want to start a guild, eh?"
    - narrate "<[lines].random>"
    # Drew, I hate unorganized code... so I redid yours... -AJ-
  interact scripts:
  - 1 guild_master_interact_handler

guild_master_interact_handler:
  type: interact
  steps:
    1:
      Click trigger:
        script:
        - if <player.has_flag[guild]>:
          - inventory open d:my_guild_gui
        - else:
          - inventory open d:new_guild_gui

cannoneer_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - define "lines:|:<&a><&lb><&6>Cannoneer<&a><&rb><&6> Ever wondered what it's like beyond this tiny spec of sand?"
    - define "lines:|:<&a><&lb><&6>Cannoneer<&a><&rb><&6> I 'ear that Captain Barbossa's got 14 pound cannon balls... 14 POUND BALLS..."
    - narrate <[lines].random>

mysterious_person_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - define "lines:|:<&4><&lb><&5>Strange Being<&4><&rb><&6> Get away!"
    - define "lines:|:<&4><&lb><&5>Strange Being<&4><&rb><&6> I don't want to hurt you."
    - define "lines:|:<&4><&lb><&5>Strange Being<&4><&rb><&6> GET OUT OF MY HEAD!"
    - define "lines:|:<&4><&lb><&5>Strange Being<&4><&rb><&6> Leave now!"
    - narrate <[lines].random>

mysterious_person_command:
  type: command
  name: mysterious_person
  script:
  - if <player.location.find.npcs.within[10].filter[script.name.is[==].to[mysterious_person_assignment]].size> != 0:
    - stop
    # TODO
    # What was this guy going to do? Maybe like, if time is night, then offer items for sale? #MoneySink (In game money, obviously)
  
  
portal_tender_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> Where would you like to go to? (Click One)"
    - narrate "<element[<&6> - I would like to use the altars.].on_click[/portal_tender altars]>"
    - narrate "<element[<&6> - I want to fly.].on_click[/portal_tender rtp]>"
  test: 1

portal_tender_command:
  type: command
  name: portal_tender
  script:
  - if <player.location.find.npcs.within[10].filter[script.name.is[==].to[portal_tender_assignment]].size> != 0:
    - if <context.args.get[1]> == altars:
      - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> Talk to the Temple Guardian when your ready to leave."
      - teleport <player> <location[altars]>
      - wait 6s
      - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> Welcome traveler!"
    - if <context.args.get[1]> == rtp:
      - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> Safe Travels."
      - wait 2s
      - inject rtp_task

temple_guardian_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> How may I help you? (Click One)"
    - narrate "<element[<&6> - I am ready to leave.].on_click[/temple_guardian leave]>"

temple_guardian_command:
  type: command
  name: temple_guardian
  script:
  - if <player.location.find.npcs.within[10].filter[script.name.is[==].to[temple_guardian_assignment]].size> != 0:
    - if <context.args.get[1]> == leave:
      - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> Farewell, and safe travels."
      - teleport <player> <location[spawn]>
      - wait 3s
      - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> I trust you got what you needed."

# This is the stray dog at spawn. When you right click on him with an item, it will take that item, and give the player the item that was stored previously.
# What that means is it's kinda like a community drop box of sorts.
stray_dog_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    # this should take the item that they have in hand and give them the item that was previously stored in the dogs inventory.
    - define "lines:|:<&a><&lb><&2><context.display.name>><&a><&rb><&6> *Bark Bark!*"
    - define "lines:|:<&a><&lb><&2><context.display.name><&a><&rb><&6> If you see this message, please alert an admin."
    - narrate <[lines].random>