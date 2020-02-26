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
      - determine <yaml[player.<player.uuid>].read[<[dataName]>]>
    - else:
      - yaml load:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - define result <yaml[player.<player.uuid>].read[<[dataName]>]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>
      - determine <def[result]>

getGlobalPlayerData:
  type: procedure
  debug: false
  definitions: dataName
  script:
    - if <player.is_online>:
      - determine <yaml[global.player.<player.uuid>].read[<[dataName]>]>
    - else:
      - yaml load:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
      - define result <yaml[global.player.<player.uuid>].read[<[dataName]>]>
      - yaml savefile:data/globalLiveData/players/global/<player.uuid>.yml id:global.player.<player.uuid>
      - yaml unload id:global.player.<player.uuid>
      - determine <def[result]>

getPlayerData_Keys:
  type: procedure
  debug: false
  definitions: dataName
  script:
    - if <player.is_online>:
      - determine <yaml[player.<player.uuid>].list_keys[<[dataName]>]>
    - else:
      - yaml load:data/players/<player.uuid>.yml id:player.<player.uuid>
      - define result <yaml[player.<player.uuid>].list_keys[<[dataName]>]>
      - yaml savefile:data/players/<player.uuid>.yml id:player.<player.uuid>
      - determine <def[result]>


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

setPlayerData_appendItem:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:->:<[dataValue]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:->:<[dataValue]>
      - yaml savefile:data/globalLiveData/players/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml unload id:player.<player.uuid>

setPlayerData_removeItem:
  type: task
  debug: false
  definitions: dataName|dataValue
  script:
    - if <player.is_online>:
      - yaml id:player.<player.uuid> set <[dataName]>:<-:<[dataValue]>
    - else:
      - yaml load:data/players/globalLiveData/<bungee.server>/<player.uuid>.yml id:player.<player.uuid>
      - yaml id:player.<player.uuid> set <[dataName]>:<-:<[dataValue]>
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

