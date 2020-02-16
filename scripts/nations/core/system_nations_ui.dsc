## Nations Interface Systems

## Commands ##

#/nation (/n)
system_nations_maincmd:
  type: command
  debug: true
  name: nation
  aliases:
    - n
  tab complete:
    - define arguments:<list[join|menu]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && !<context.raw_args.ends_with[<&sp>]>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  script:
    - if <context.args.get[1]||null> == null:
      - if <yaml[player.<player.uuid>].read[nations.nation]||null> == null || <yaml[player.<player.uuid>].read[nations.nation]||null> == none:
        - inject system_nations_join
      - else:
        - inject system_nations_menu
    - define arg1:<context.args.get[1].to_lowercase>
    - if <[arg1]> == join || <[arg1]> == menu:
      - if <yaml[player.<player.uuid>].read[nations.nation]||null> == null || <yaml[player.<player.uuid>].read[nations.nation]||null> == none:
        - inject system_nations_join
      - else:
        - inject system_nations_menu


#/nr (/nations)
system_nations_infocmd:
  type: command
  debug: false
  name: nr
  aliases:
    - nations
  tab complete:
    - define adminarguments:<list[reload]>
    - define arguments:<list[about|version]>
    - if <player.has_permission[aurora.server.telix.nr.admin]>:
      - define arguments:<list[about|version].include[<[adminarguments]>]>

    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && !<context.raw_args.ends_with[<&sp>]>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  script:
    #Default task (system_nations_version)
    - if <context.args.get[1]||null> == null:
      - inject system_nations_version
    #No permission tasks
    - else if <context.args.get[1].to_lowercase> == about:
      - inject system_nations_about
    - else if <context.args.get[1].to_lowercase> == version:
      - inject system_nations_version
    - else if <context.args.get[1].to_lowercase> == nxt:
      - inject system_nations_nxt
    #Else Check for admin permission
    - else if <context.args.get[1].to_lowercase> == reload:
      - if <context.server>:
        - inject loadNationData
      - else if <player.has_permission[aurora.server.telix.nr.admin]>:
        - inject loadNationData
    - else:
      - narrate "<&c>Invalid Argument Entered!(Argument #1)"


## Inventories & Events ##


## JOINING

#Join Menu
gui_nations_join:
  type: inventory
  debug: false
  inventory: CHEST
  size: 9
  title: <&3>Join<&sp>a<&sp>Nation
  definitions:
    close: <item[red_stained_glass_pane]>[display_name=<&c><&l>Close;lore=<&e>Close<&sp>the<&sp>Join<&sp>Menu.]
  procedural items:
    - define inventory:<list[]>
    #Loop over every open nation and create a GUI item
    - foreach <proc[system_nations_getnations].context[list|open]> as:nation:
      #Read from YAML ID: nations and define inventory item and mechanisms
      - define displayname:<proc[getNationData].context[<[nation]>|display.color].parse_color><proc[getNationData].context[<[nation]>|display.name]>
      - define lore:<list[<&6><proc[getNationData].context[<[nation]>|display.description]>|<&b>Click<&sp>to<&sp>Join<&sp>this<&sp>Nation]>
      #Construct nation GUI item
      - define item:<proc[getNationData].context[<[nation]>|display.item].as_item>
      - adjust <[item]> display_name:<[displayname]> save:newitem
      - adjust <entry[newitem].result> lore:<[lore]> save:newitem
      - adjust <entry[newitem].result> nbt:<list[nation/<[nation]>]> save:newitem
      #Save it to the inventory definition
      - define inventory:|:<entry[newitem].result>
    #Save the constructed inventory
    - determine <[inventory]>
  slots:
    - "[] [] [] [] [] [] [] [] [close]"

gui_nations_join_events:
  type: world
  debug: false
  events:
    on player clicks in gui_nations_join priority:10:
      - determine cancelled
    
    on player clicks red_stained_glass_pane in gui_nations_join:
      - inventory close

    on player left clicks in gui_nations_join:
      #Every item except for the close menu item
      - if <context.item.has_nbt[nation]>:
        - flag player tempnation:<context.item.nbt[nation]> duration:1m
        - inventory open d:<inventory[gui_nations_confirmjoin]>

#Confirm Join Menu
gui_nations_confirmjoin:
  type: inventory
  debug: false
  inventory: CHEST
  size: 9
  title: <&b>Do<&sp>you<&sp>want<&sp>to<&sp>join<&sp><proc[getNationData].context[<player.flag[tempnation]>|display.color].parse_color><proc[getNationData].context[<player.flag[tempnation]>|display.name]><&b>?
  definitions:
    info: <item[white_stained_glass_pane]>[display_name=<&e>Information;lore=<list[<&6>Do<&sp>you<&sp>want<&sp>to<&sp>join<&sp>this<&sp>Nation?]>]
    confirm: <item[lime_stained_glass_pane]>[display_name=<&2><&l>Yes;nbt=<list[nation/<player.flag[tempnation]>]>]
    deny: <item[red_stained_glass_pane]>[display_name=<&c><&l>No]
  slots:
    - "[deny] [deny] [deny] [deny] [info] [confirm] [confirm] [confirm] [confirm]"

gui_nations_confirmjoin_events:
  type: world
  debug: false
  events:
    on player clicks in gui_nations_confirmjoin priority:10:
      - determine cancelled
    
    on player clicks red_stained_glass_pane in gui_nations_confirmjoin:
      - inventory close
    
    on player clicks lime_stained_glass_pane in gui_nations_confirmjoin:
      - yaml id:player.<player.uuid> set nations.nation:<context.item.nbt[nation]>
      - actionbar "<&3><player.name> has joined <proc[getNationData].context[<context.item.nbt[nation]>|display.color].parse_color><proc[getNationData].context[<context.item.nbt[nation]>|display.name]>." targets:<server.list_online_players>
      - narrate "<&a>You have now joined <proc[getNationData].context[<context.item.nbt[nation]>|display.color].parse_color><proc[getNationData].context[<context.item.nbt[nation]>|display.name]>."
      - narrate "<&e>You may now use the <&b>Nation Menu <&e>with the command <&b>/n menu (/n)."
      - inventory close


## NATION MENU
    
#Menu inventory is defined in nations_menu.dsc

#Events
gui_nations_menu_events:
  type: world
  debug: false
  events:
    on player clicks in gui_nations_menu priority:10:
      - determine cancelled

    on player left clicks barrier in gui_nations_menu:
      - inventory close

    on player left clicks in gui_nations_menu:
      - if <context.item.material.name> != barrier:
        #Check for item NBT keys
        - if <context.item.has_nbt[inventory]>:
          - inventory open d:<inventory[<context.item.nbt[inventory]>]>
        - else if <context.item.has_nbt[inject]>:
          - inject <context.item.nbt[inject]>
        - else if <context.item.has_nbt[run]>:
          - run <context.item.nbt[run]>
        #Re-flag the player
        - flag <player> nation:<proc[getPlayerData].context[nations.nation]> duration:1m
