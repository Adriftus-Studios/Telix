setGuildData:
  type: task
  definitions: guild|dataName|dataValue
  script:
    - yaml id:guild.<[guild]> set <[dataName]>:<[dataValue]>
    - yaml savefile:data/GlobalLiveData/server/Telix/guilds/<[guild]>.yml id:guild.<[guild]>

setGuildData_multiple:
  type: procedure
  definitions: guild|dataList
  script:
    - foreach <[dataList].unescaped> as:map:
      - yaml id:guild.<[guild]> set <[map].before[/]>:<[map].after[/]>
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
    - define guildDataDump:display.name/<[guildName]>
    - define guildDataDump:members.count/0
    - define guildDataDump:members.leader/NONE
    - define guildDataDump:skills/!
    - run setGuildData_multiple def:<[guildName]>|<[guildDataDump].escaped>

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
