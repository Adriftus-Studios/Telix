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
  definitions: location|distance|pitch|yaw
  script:
  - determine <[location].with_pose[<[pitch]||0>,<[yaw]||0>].relative[0,0,<[distance]>]>

define_star:
  type: procedure
  definitions: location|radius|rotation|num
  script:
  - define location:<[location].with_pose[0,<[rotation]>]>
  - repeat <[num]>:
    - define t:<el@360.div[<[num]>].mul[<[num].div[2].round_up>].add[<[rotation]>]>
    - define points:|:<[location].with_yaw[<[t].mul[<[value]>]>].relative[0,0,<[radius]>]>
    - define new_points:|:<[location].with_yaw[<[t].mul[<[value]>]>].relative[0,0,<[radius]>]>
    - define location:<[location].with_yaw[<[location].yaw.add[<[t]>]>]>
  - repeat <[num]>:
    - foreach <[points].get[<[value]>].points_between[<[points].get[<[value].add[1]>]||<[points].get[1]>>].distance[0.2]> as:point:
      - define new_points:|:<[point]>
  - determine <[new_points]>

define_curve:
  type: procedure
  definitions: start|end|curve|angle
  script:
  - define start:<[start].facing[<[end]>]>
  - define mid:<[start].relative[0,0,<[start].distance[<[end]>].div[2]>]>
  - define points:|:<[mid].points_between[<[mid].with_yaw[<[mid].yaw.add[90]>].relative[0,0,5]>]>
  - determine <[points]>

shape_events:
  type: world
  debug: true
  events:
    on delta time secondly every:1:
      - foreach <server.list_online_players> as:player:
        - narrate <proc[define_curve].context[<player.location>|<player.location.relative[0,0,10]>|50|0].get[1]>
        #- playeffect smoke at:<proc[define_curve].context[<player.location>|<player.location.relative[0,0,10]>|50|0]> quantity:1 targets:<[player]>