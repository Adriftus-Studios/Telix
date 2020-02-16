## Nations Data Interface & Management Package

## Data Events
dataSystem_nations:
  type: world
  debug: true
  events:
    on server start:
      # Load the "nations_config.yml" file.
        - inject loadNationData
    on script reload:
      # (Re)load the "nations_config.yml" file.
      - inject loadNationData


## Data Actions

#Nation Data Actions

#Load Nation Data
loadNationData:
  type: task
  debug: true
  script:
    # Check for "nations_config.yml" file and "nations_menu.dsc" file.
    - if !<server.has_file[data/nations_config.yml]>:
      - announce to_console "[Nations Redux] nations_config.yml has not been found from |/plugins/Denizen/data/|."
      - stop
    - else if !<server.list_scripts.parse[name].contains[gui_nations_menu]>:
      - announce to_console "[Nations Redux] nations_menu.dsc has not been found from |/plugins/Denizen/scripts/Telix/nations/|."
      - stop
    - announce to_console "[Nations Redux] nations_config.yml is being loaded from |/plugins/Denizen/data/GlobalLiveData/server/Telix/nations/|."
    #Unload Nations YAML if it already exists
    - if <yaml.list.contains[nations]>:
      - yaml unload id:nations
    #Load file from storage, generate inventories, and narrate information
    - yaml load:data/nations_config.yml id:nations
    - announce to_console "[Nations Redux] nations_config.yml has been loaded from |/plugins/Denizen/data| as YAML ID: nations."


#Set Nation Data (Probably should not be used as one can set data values in "nations_config.yml" and /ex reload)
setNationData:
  type: task
  debug: true
  definitions: nation|dataName|dataValue
  script:
    - yaml id:nations set nations.<[nation]>.<[dataName]>:<[dataValue]>
    - yaml savefile:data/nations_config.yml id:nations


#Get Nation Data
getNationData:
  type: procedure
  debug: true
  definitions: nation|dataName
  script:
    - determine <yaml[nations].read[nations.<[nation]>.<[dataName]>]>


#Nations Extended Task(s) (NXT) Data Actions

#Get NXT Data (From script nxt_<[nxtPlugin]>_info)
getNXTData:
  type: procedure
  debug: true
  definitions: nxtPlugin|dataName
  script:
    - if <server.list_scripts.contains[nxt_<[nxtPlugin]>_info]>:
      - if <script[nxt_<[nxtPlugin]>_info].list_keys.contains[<[dataName]>]>:
        - determine <script[nxt_<[nxtPlugin]>_info].yaml_key[<[dataName]>]>