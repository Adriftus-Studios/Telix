setPlayerData:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:<[dataValue]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:<[dataValue]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>

setGlobalPlayerData:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:global.player.<player.uuid> set <[dataName]>:<[dataValue]>
      - yaml savefile:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>

getPlayerData:
  type: procedure
  debug: false
  definitions: dataName
  script:
    - if <player.is_online>:
      - determine <yaml[player.<player.uuid>].read[<[dataName]>]||null>
    - else:
      - yaml load:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - define result <yaml[player.<player.uuid>].read[<[dataName]>]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>
      - determine <def[result]||null>

getGlobalPlayerData:
  type: procedure
  debug: false
  definitions: dataName
  script:
    - if <player.is_online>:
      - determine <yaml[global.player.<player.uuid>].read[<[dataName]>]||null>
    - else:
      - yaml load:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
      - define result <yaml[global.player.<player.uuid>].read[<[dataName]>]>
      - yaml savefile:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
      - yaml unload id:global.player.<player.uuid>
      - determine <def[result]||null>

getPlayerData_Keys:
  type: procedure
  debug: false
  definitions: dataName
  script:
    - if <player.is_online>:
      - determine <yaml[player.<player.uuid>].list_keys[<[dataName]>]||null>
    - else:
      - yaml load:data/players/<player.uuid>.yml id:player.<player.uuid>
      - define result <yaml[player.<player.uuid>].list_keys[<[dataName]>]>
      - yaml savefile:data/players/<player.uuid>.yml id:player.<player.uuid>
      - determine <def[result]||null>


setPlayerData_appendList:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:|:<[dataValue]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:|:<[dataValue]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>

setPlayerData_removeList:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:!|:<yaml[player.<player.uuid>].read[<[dataName]>].exclude[<[dataValue]>]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:!|:<yaml[player.<player.uuid>].read[<[dataName]>].exclude[<[dataValue]>]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>

setPlayerData_increment:
  type: task
  debug: false
  definitions: dataName|amount
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:+:<[amount]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:+:<[amount]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>

setPlayerData_decrement:
  type: task
  debug: false
  definitions: dataName|amount
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:-:<[amount]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:-:<[amount]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>


playerData_events:
  type: world
  debug: false
  events:

    on player logs in priority:-2000 bukkit_priority:LOWEST:
      - if <server.has_file[data/globalLiveData/players/<server.flag[server.name]>/<player.uuid>.yml]>:
        - yaml load:data/globalLiveData/players/<server.flag[server.name]>/<player.uuid>.yml id:player.<player.uuid>
      - else:
        - yaml create id:player.<player.uuid>
      - if <server.has_file[data/globalLiveData/players/global/<player.uuid>.yml]>:
        - yaml load:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
      - else:
        - yaml create id:global.player.<player.uuid>
        - yaml savefile:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>



    on player quit priority:2000 bukkit_priority:HIGHEST:
      - if <yaml.list.contains[player.<player.uuid>]>:
        - yaml savefile:data/globalLiveData/players/<server.flag[server.name]>/<player.uuid>.yml id:player.<player.uuid>
        - yaml unload id:player.<player.uuid>
      - if <yaml.list.contains[global.player.<player.uuid>]>:
        - yaml savefile:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
        - yaml unload id:global.player.<player.uuid>

    on shutdown:
      - foreach <yaml.list>:
        - if <def[value].substring[1,6]> == player:
          - yaml savefile:data/globalLiveDataplayers/<def[value].substring[8]>.yml id:<def[value]>
