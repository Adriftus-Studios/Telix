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
  - define points:|:<[mid].points_between[<[mid].with_yaw[<[mid].yaw.sub[90]>].relative[0,0,5]>]>
  - define points:|:<[mid].points_between[<[mid].with_pitch[<[mid].pitch.add[90]>].relative[0,0,5]>]>
  - define points:|:<[mid].points_between[<[mid].with_pitch[<[mid].pitch.sub[90]>].relative[0,0,5]>]>
  - determine <[points]>

shape_events:
  type: world
  debug: false
  events:

      
test_command:
  type: command
  debug: false
  name: test
  description: test
  usage: /test
  script:
  - define pos:<player.location.relative[0,0,0]>
  - define a:<player.location.points_between[<player.location.relative[0,0,15]>].distance[0.2]>
  - define amp:20
  - define max:<[amp].add[<el@1.sub[<[a].size.div[2]>].power[2].div[<[amp].mul[4]>]>]>
  - define value:0
  - while <player.item_in_hand.material.name> == air:
    - define f:<[max].sub[<[amp].add[<[value].sub[<[a].size.div[1]>].power[2].div[<[amp].mul[4]>]>]>]>
    - narrate <[amp].add[<[value].sub[<[a].size.div[1]>].power[2].div[<[amp].mul[4]>]>]>
    - define t:<proc[math_stuff].context[<[f]>|45]>
    - playeffect smoke at:<[pos].relative[<[t].get[1]>,<[t].get[2]>,2]> offset:0
    - wait 1t
    - define value:++
  - narrate <[max]>

math_stuff:
  type: procedure
  definitions: C|degrees
  script:
  - define hyp:<[degrees].to_radians.sin.mul[<[C]>]>
  - define adj:<[C].power[2].sub[<[hyp].power[2]>].sqrt>
  - determine <list[<[hyp]>|<[adj]>]>
