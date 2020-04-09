Citadel_System:
  type: world
  events:
    on player breaks block:
      - run Citadel_BlockCheck def:<context.location>
          
Citadel_loadData:
  type: task
  definitions: loc
  script:
    - yaml load:data/CITADEL/<[loc]>.yml id:citadel.<[loc]>
    - flag server <[loc]>:true duration:9s
    - wait 10s
    - if !<server.has_flag[<[loc]>]>:
      - yaml unload id:citadel.<[loc]>

Citadel_BlockCheck:
  type: task
  definitions: location
  scripts:
    - define loc:<[location].simple>
    - if !<yaml.list.contains[citadel.<[loc]>]>:
      - if <server.has_file[data/CITADEL/<[loc]>.yml]>:
        - run Citadel_loadData def:<[loc]>
      - else:
        - stop
    - define group:<yaml[citadel.<[loc]>].read[group]>
    # TODO
    # Group Check
    # False for no break permission.
    # (Damage Block Instead)
    - if false:
      - run Citadel_DamageBlocks def:<[location].as_list.escaped>
    - else:
      - adjust server delete_file:data/CITADEL/<[loc].simple>.yml

Citadel_DamageBlocks:
  type: task
  definitions: escaped_location_list|amount
  script:
    - foreach <[escaped_location_list].unescaped.parse[as_location]> as:loc:
      - if !<yaml.list.contains[citadel.<[loc].simple>]>:
        - if <server.has_file[data/CITADEL/<[loc].simple>.yml]>:
          - run Citadel_loadData def:<[loc]>
        - else:
          - modifyblock <[loc]> air naturally
          - foreach next
      - yaml id:citadel.<[loc].simple> set health:-:<[amount]||1>
      - define <healths>:|:<yaml[citadel.<[loc].simple>].read[health]>
      - if <yaml[citadel.<[loc].simple>].read[health]> <= 0:
        - adjust server delete_file:data/CITADEL/<[loc].simple>.yml
        - yaml unload id:citadel.<[loc].simple>
        - modifyblock <[loc]> air naturally
    - narrate "<&2>Block Health Remaining<&co><&e> <[healths].separated_by[,<&sp>]>"
