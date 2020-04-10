
group_manager_saving:
  type: world
  reload:
    - foreach <yaml.list.filter[starts_with[group]]||<list[]>>:
      - yaml savefile:data/globalData/groups/<server.flag[server.name]>/<[value].substring[8]>.yml id:<[value]>
    - foreach <server.list_files[data/globalData/groups/<server.flag[server.name]>]||<list[]>>:
      - define type:<[value].split[.].get[2].to_lowercase>
      - define subtype:<[value].split[.].get[3].to_lowercase.replace[.yml].with[]>
      - yaml load:data/globalData/groups/<server.flag[server.name]>/<[value]> id:groups.<[type]>.<[subtype]>
  events:
    on delta time minutely every:30:
      - inject locally reload
    on server start:
      - inject locally reload
    on script reload:
      - inject locally reload

create_type:
  type: task
  definitions: type|subtype
  script:
  - yaml id:groups.<[type]>.<[subtype]> create

edit_group_list:
  type: task
  definitions: type|subtype|group|property|addorremove|value
  script:
  - if <[addorremove]> == remove:
    - yaml id:groups.<[type]>.<[subtype]> set <[group]>.<[property]>:<-:<[value]>
  - if <[addorremove]> == add:
    - yaml id:groups.<[type]>.<[subtype]> set <[group]>.<[property]>:->:<[value]>

get_group_list:
  type: procedure
  definitions: type|subtype|group|property
  script:
  - determine <yaml[groups.<[type]>.<[subtype]>].read[<[group]>.<[property]>]>

edit_group_property:
  type: task
  definitions: type|subtype|group|property|value
  script:
  - yaml id:groups.<[type]>.<[subtype]> set <[group]>.<[property]>:<[value]>

set_group_permission:
  type: task
  definitions: type|subtype|group|permission|value
  script:
  - if <[value]> == false:
    - yaml id:groups.<[type]>.<[subtype]> set <[group]>.permissions:<-:<[permission]>
  - else:
    - yaml id:groups.<[type]>.<[subtype]> set <[group]>.permissions:->:<[permission]>

list_group_permissions:
  type: procedure
  definitions: type|subtype|group
  script:
  - determine <yaml[groups.<[type]>.<[subtype]>].read[<[group]>.permissions]>

get_group_property:
  type: procedure
  definitions: type|subtype|group|property
  script:
  - determine <yaml[groups.<[type]>.<[subtype]>].read[<[group]>.<[property]>]>

add_player_to_group:
  type: task
  definitions: type|subtype|group|player
  script:
  - yaml id:player.<[player].uuid> set groups.<[type]>.<[subtype]>:->:<[group]>

get_player_groups:
  type: procedure
  definitions: type|subtype|player
  script:
  - determine <yaml[player.<player.uuid>].read[groups.<[type]>.<[subtype]>]>

remove_player_from_group:
  type: task
  definitons: type|subtype|group|player
  script:
  - yaml id:player.<[player].uuid> set groups.<[type]>.<[subtype]>:<-:<[group]>

DO_NOT_USE:
  type: item
  material: stone
  script:
    - narrate <proc[get_player_groups].context[citadels|aurora|<player>]>
                                              # type: citadels
                                              # subtype: aurora
                                              # player: <player>
    - narrate <proc[list_group_permissions].context[citadels|aurora|friend]>
                                              # type: citadels
                                              # subtype: aurora
                                              # group: friend
    - narrate <proc[get_group_property].context[citadels|aurora|friend|title]>
                                              # type: citadels
                                              # subtype: aurora
                                              # group: friend
                                              # property: title
    - narrate <proc[get_group_list].context[citadels|aurora|friend|blocks]>
                                              # type: citadels
                                              # subtype: aurora
                                              # group: friend
                                              # list_name: blocks
    - run edit_group_list def:citadels|aurora|mygroup|blocks|add|<context.location>
          # type: citadels
          # subtype: aurora
          # group: mygroup
          # property: blocks
          # add or remove
          # value: location
    - run create_type def:citadels|aurora
          # type: citadels
          # subtype: aurora
    - run edit_group_property def:citadels|aurora|friend|title|leader
          # type: citadels
          # subtype: aurora
          # group: friend
          # property: title
          # value: leader
    - run set_group_permission def:citadels|aurora|friend|can_build|true
          # type: citadels
          # subtype: aurora
          # group: friend
          # permission: can_build
          # value: true
    - run set_group_permission def:citadels|aurora|friend|can_build|false
          # type: citadels
          # subtype: aurora
          # group: friend
          # permission: can_build
          # value: false
    - run add_player_to_group def:citadels|aurora|friend|<player>
          # type: citadels
          # subtype: aurora
          # group: friend
          # player: <player>
    - run remove_player_from_group def:citadels|aurora|friend|<player>
          # type: citadels
          # subtype: aurora
          # group: friend
          # player: <player>