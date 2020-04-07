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
         - inventory open d:new_guild_gui