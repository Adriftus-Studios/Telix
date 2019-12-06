setGuildData:
  type: task
  definitions: guild|dataName|dataValue
  script:
    - yaml id:guild.<[guild]> set <[dataName]>:<[dataValue]>
    - yaml savefile:data/GlobalLiveData/server/Telix/guilds/<[guild]>.yml id:guild.<[guild]>

getGuildData:
  type: procedure
  definitions: guild|dataName
  script:
    - determine <yaml[guild.<[guild]>].read[<[dataName]>]>

setGuildData_listAppend:
  type: task
  definitions: guild|dataName|dataValue
    - yaml id:guild.<[guild]> set <[dataName]>:|:<[dataValue]>

setGuildData_listRemove:
  type: task
  definitions: guild|dataName|dataValue
    - yaml id:guild.<[guild]> set <[dataName]>:!|:<yaml[guild.<[guild]>].read[<[dataName]>].exclude[<[dataValue]>]>

dataSystem_guilds:
  type: world
  events:
    on server start:
      - foreach <server.flag[guilds]>:
        - yaml load:data/GlobalLiveData/server/Telix/guilds/<[value]>.yml id:guild.<[value]>


guilds_createGuild:
  type: task
  definitions: guildName
  script:
    - flag server guilds:|:<[guildName]>
    - yaml create id:guild.<[guildName]>
    - run setGuildData def:<[guildName]>|display.name|<[guildName]>
    - run setGuildData def:<[guildName]>|members.count|0
    - run setGuildData def:<[guildName]>|members.leader|NONE
    - run setGuildData def:<[guildName]>|skills|!

guilds_deleteGuild:
  type: task
  definitions: guildName
  script:
    - flag server guilds:!|:<server.flag[guilds].exclude[<[guildName]>]>
    - yaml unload id:guild.<[guildName]>

guilds_addSkill:
  type: task
  definitions: guildName|SkillName
  script:
    - if !<proc[getGuildData].context[<[guildName]>|skills]>].contains[<[skillName]>]>:
      - run setGuildData_listAppend def:<[guildName]>|skills|<[skillName]>

guilds_removeSkill:
  type: task
    - if <proc[getGuildData].context[<[guildName]>|skills]>].contains[<[skillName]>]>:
      - run setGuildData_listRemove def:<[guildName]>|skills|<[skillName]>
