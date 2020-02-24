define_circle:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define point:<[location].with_pose[0,<[value]>].relative[0,0,<[radius]>]>
    - if !<[points].contains[<[point]>]>:
      - define points:|:<[point]>
  - determine <[points]>

define_block_circle:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define point:<[location].with_pose[0,<[value]>].relative[0,0,<[radius]>].block>
    - if !<[points].contains[<[point]>]>:
      - define points:|:<[point]>
  - determine <[points]>
  
relative_point:
  type: procedure
  definitions: location|radius|pitch|yaw
  script:
  - determine <[location].with_pose[<[pitch]||0>,<[yaw]||0>].relative[0,0,<[radius]>]>

define_star:
  type: procedure
  definitions: location|radius|rotation
  script:
  - define location:<[location].with_pose[0,<[rotation]>]>
  - repeat 5:
    - define points:|:<[location].with_yaw[<el@146.mul[<[value]>]>].relative[0,0,<[radius]>]>
    - define location:<[location].with_yaw[<[location].yaw.add[146]>]>
  - determine <[points]>

shape_events:
  type: world
  debug: false
  events:
    on delta time secondly every:1:
      - foreach <server.list_online_players> as:player:
        - playeffect smoke <proc[define_star].context[<[player].location>|3|0]> quantity:5 offset:0.1