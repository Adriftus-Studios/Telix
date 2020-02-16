## Nations Core Systems

## Main /nation command

#Join a Nation (- inject)
system_nations_join:
  type: task
  debug: false
  script:
    - inventory open d:<inventory[gui_nations_join]>


#Open the Nation Menu (- inject)
system_nations_menu:
  type: task
  debug: false
  script:
    - flag <player> nation:<yaml[player.<player.uuid>].read[nations.nation]> duration:1m
    - inventory open d:<inventory[gui_nations_menu]>


#Get Nations, sorted (action: list|count | sort: all|open|closed|event)
#Example Denizen Tag: <proc[system_nations_getnations].context[list|all]>
system_nations_getnations:
  type: procedure
  debug: false
  definitions: action|sort
  script:
    #Initial Check
    - if <yaml[nations].list_keys[nations].size> == 0:
      - determine NONE

    #Sanitization
    - if <[action]||null> == null:
      - define action:list
    - else:
      - define action:<[action].to_lowercase>

    - if <[sort]||null> == null:
      - define sort:all
    - else:
      - define sort:<[sort].to_lowercase>
    
    #All list = <[openlist]> + <[closedlist]>
    #All count = <[openlist].size> + <[closedlist].size>
    - define openlist:<list[]>
    - define closedlist:<list[]>
    - define eventlist:<list[]>
    
    #Loop for every nation in "nations_config.yml" (YAML ID of "nations") and add to the respective list + increment the respective counter
    - foreach <yaml[nations].list_keys[nations]>:
      #Check if nation is open or closed (joinable: true OR false)
      - if <proc[getNationData].context[<[value]>|status.joinable]>:
        #Nation is OPEN
        - define openlist:|:<[value]>
      - else:
        #Nation is CLOSED
        - define closedlist:|:<[value]>
      - if <proc[getNationData].context[<[value]>|status.event]>:
        #Nation is an EVENT NATION
        - define eventlist:|:<[value]>

    
    #Determine the output
    #Enabled
    - if <[sort]> == open:
      #List
      - if <[action]> == list:
        - determine <[openlist]>
      #Count
      - else:
        - determine <[openlist].size>
    #Disabled
    - else if <[sort]> == closed:
      #List
      - if <[action]> == list:
        - determine <[closedlist]>
      #Count
      - else:
        - determine <[closedlist].size>
    #Event
    - else if <[sort]> == event:
      #List
      - if <[action]> == list:
        - determine <[eventlist]>
      #Count
      - else:
        - determine <[eventlist].size>
    #All
    - else:
      #List
      - if <[action]> == list:
        - determine <[openlist].include[<[closedlist]>]>
      #Count
      - else:
        - determine <[openlist].size.+[<[closedlist].size>]>


#Get NXT plugins, sorted (action: list|count | sort: all|enabled|disabled)
#Example Denizen Tag: <proc[system_nations_getnxt].context[list|all]>
system_nations_getnxt:
  type: procedure
  debug: true
  definitions: action|sort
  script:
    #Initial Check
    - if <yaml[nations].list_keys[nxt].size> == 0:
      - determine NONE

    #Sanitization
    - if <[action]||null> == null:
      - define action:list
    - else:
      - define action:<[action].to_lowercase>

    - if <[sort]||null> == null:
      - define sort:all
    - else:
      - define sort:<[sort].to_lowercase>
    
    #All list = <[enabledlist]> + <[disabledlist]>
    #All count = <[enabledcount]> + <[disabledcount]>
    - define enabledlist:<list[]>
    - define enabledcount:0

    - define disabledlist:<list[]>
    - define disabledcount:0
    
    #Loop for every plugin in "nations_config.yml" (YAML ID of "nations") and add to the respective list + increment the respective counter
    - foreach <yaml[nations].list_keys[nxt]>:
      #Check if plugin is enabled or disabled (true OR false)
      - if <yaml[nations].read[nxt.<[value]>]>:
        #Plugin is ENABLED
        - define enabledlist:|:<[value]>
        - define enabledcount:++
      - else:
        #Plugin is DISABLED
        - define disabledlist:|:<[value]>
        - define disabledcount:++
    
    #Determine the output
    #Enabled
    - if <[sort]> == enabled:
      #List
      - if <[action]> == list:
        - determine <[enabledlist]>
      #Count
      - else:
        - determine <[enabledcount]>
    #Disabled
    - else if <[sort]> == disabled:
      #List
      - if <[action]> == list:
        - determine <[disabledlist]>
      #Count
      - else:
        - determine <[disabledcount]>
    #All
    - else:
      #List
      - if <[action]> == list:
        - determine <[enabledlist].include[<[disabledlist]>]>
      #Count
      - else:
        - determine <[enabledcount].+[<[disabledcount]>]>


## Information/Administrator /nr command

#Narrate general information (- inject)
system_nations_about:
  type: task
  debug: false
  script:
    - narrate "<&e><&6>----<&3><&l>Nations <&a>Redux<&6>----<&e>"


#Narrate version information (- inject)
system_nations_version:
  type: task
  debug: false
  script:
    - narrate "<&3><&l>Nations <&a><&l>Redux"
    - narrate "<&6>Author <&e>- <&6><script[system_nations_info].yaml_key[author]>"
    - narrate "<&6>Contributors <&e>- <&6><script[system_nations_info].yaml_key[contributors]>"
    - narrate "<&6>Version <&e>- <&6><script[system_nations_info].yaml_key[version]>"


#Narrate Nations Extended Task(s) (NXT) information (- inject)
system_nations_nxt:
  type: task
  debug: false
  script:
    - narrate "<&b><&l>NXT Information"