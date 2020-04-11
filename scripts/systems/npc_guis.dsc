#    /npc assign --set guild_master_assignment

guild_master_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - define "words:<list[<&a><&lb><&6>Guild Master<&a><&rb><&6> Make sure to watch your guild funds!|<&a><&lb><&6>Guild Master<&a><&rb><&6> When I was a young lad, I tried to start a guild too.|<&a><&lb><&6>Guild Master<&a><&rb><&6> You look like a person of character!|<&a><&lb><&6>Guild Master<&a><&rb><&6> HAHA! So, you want to start a guild, eh?].random>"
    - narrate "<[words]>"
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

mysterious_person_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - define "lines:|:<&4><&lb><&5>Mysterious Person<&4><&rb><&6> Get away!"
    - define "lines:|:<&4><&lb><&5>Mysterious Person<&4><&rb><&6> I don't want to hurt you."
    - define "lines:|:<&4><&lb><&5>Mysterious Person<&4><&rb><&6> GET OUT OF MY HEAD!"
    - define "lines:|:<&4><&lb><&5>Mysterious Person<&4><&rb><&6> Leave now!"
    - narrate <[lines].random>

mysterious_person_command:
  type: command
  name: mysterious_person
  script:
  - if <player.location.find.npcs.within[10].filter[script.name.is[==].to[portal_tender_assignment]].size> != 0:
    - stop
    # TODO
  
portal_tender_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> Where would you like to go to? (Click One)"
    - narrate "<element[<&6> - I would like to use the altars.].on_click[/portal_tender altars]>"
    - narrate "<element[<&6> - I want to fly.].on_click[/portal_tender rtp]>"

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
