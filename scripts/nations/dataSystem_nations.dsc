## Nations Data Interface & Management Package
## Hasn't been tested yet, of course.

#Data Events
dataSystem_nations:
  type: world
  debug: true
  events:
    on server start:
      # Check for "nations_config.yml" file.
      - if <server.has_file[data/GlobalLiveData/server/Telix/nations/nations_config.yml]>:
        - inject loadNationData
      - else:
        - announce to_console "[Nations Redux] |nations_config.yml| has not been found from |/plugins/Denizen/data/GlobalLiveData/server/Telix/nations/|."
    on script reload:
      - inject loadNationData


#Load Nation Data
loadNationData:
  type: task
  debug: true
  script:
    - announce to_console "[Nations Redux] |nations_config.yml| is being loaded from |/plugins/Denizen/data/GlobalLiveData/server/Telix/nations/|."
    - if <yaml.list.contains[nations]>:
      - yaml unload id:nations
    - yaml load:data/GlobalLiveData/server/Telix/nations/nations_config.yml id:nations
    - announce to_console "[Nations Redux] |nations_config.yml| has been loaded from |/plugins/Denizen/data/GlobalLiveData/server/Telix/nations/| as YAML ID |nations|."


#Get Nation Data
getNationData:
  type: procedure
  debug: true
  definitions: nation|dataName
  script:
    - determine <yaml[nations].read[nations.<[nation]>.<[dataName]>]>