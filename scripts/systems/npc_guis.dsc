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

portal_tender_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> Talk to the Temple Guardian when your ready to leave."
    - teleport <player> <location[altars]>
    - wait 6s
    - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> Welcome traveler!"

temple_guardian_assignment:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> How may I help you?"
    - narrate "<element[<&6>1. I am ready to leave.].on_click[/temple_guardian_confirm leave]>"

temple_guardian_confirm_command:
  type: command
  name: temple_guardian_confirm
  script:
  - narrate 1
  - if <player.location.find.npcs.within[10].filter[script.is[==].to[temple_guardian_assignment]].size> != 0:
    - narrate 2
    - if <context.args.get[1]> == leave:
      - narrate "<&a><&lb><&6>Temple Guardian<&a><&rb><&6> Farewell, and safe travels."
      - teleport <player> <location[spawn]>
      - wait 3s
      - narrate "<&a><&lb><&6>Portal Tender<&a><&rb><&6> I trust you got what you needed."
