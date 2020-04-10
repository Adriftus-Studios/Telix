Group_Management_System_Initialize:
  type: world
  load_stuff:
    - if <server.has_file[data/groups.yml]>:
      - yaml load:data/groups.yml id:groups
    - else:
      - yaml create id:groups
  events:
    on server starts:
      - inject locally load_stuff
    on script reload:
      - inject locally load_stuff

Group_Management_System_CreateGroup:
  type: task
  definitions: groupName
  script:
    - define groupName:<[groupName].lower>
    - if !<yaml[groups].list_keys[group].contains[<[groupName]>]>
      - yaml id:groups set group.<[groupName]>.leader:<player.uuid>
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.break:true
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.place:true
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.chests:true
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.interact:true
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.invite:true
      - yaml id:groups set group.<[groupName]>.members.<player.uuid>.permissions.kick:true
      # yaml id: groups set group.<[groupName]>.bastions

Group_Management_System_AddMember:
  type: task
  definitions: group|playerName
  script:
    # Exclusions
    - define target <server.match_player[<[playerName]>]||null>
    - if <[target]> == null:
      - narrate "<&a>Unknown Player<&co> <&e><[playerName]>"
      - stop
    - if !<yaml[groups].read[group.<[groupName]>.members.<player.uuid>.permissions.invite]||true>:
      - narrate "<&a>You do not have permission to invite in <&a><[group]>"
      - stop
    - narrate "<&a><player.name><&e> has invited you to join <&b><[group]>"
    
      