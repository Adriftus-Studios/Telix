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
  definitions: start|end|intensity|angle|between
  script:
  - define a:<[start].points_between[<[end]>].distance[<[between]>]>
  - define increment:<el@40.div[<[a].size>]>
  - foreach <[a]> as:point:
    - define b:<el@1.add[<el@1.div[20].mul[<[loop_index].mul[<[increment]>].sub[20]>].power[2].mul[-1]>].mul[<[intensity]>]>
    - define offset:<proc[math_stuff].context[<[b]>|<[angle]>]>
    - define points:|:<[point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>
shape_events:
  type: world
  debug: false
  events:

test_command:
  type: command
  debug: true
  name: test
  description: test
  usage: /test
  script:
  - define angle:<util.random.int[0].to[180]>
  - narrate <[angle]>
  - repeat 360:
    - define points:<proc[define_curve].context[<player.location>|<player.location.forward[20]>|5|<[value]>|1]>
    - playeffect smoke at:<[points]> quantity:5 offset:0
    - wait 1t
  - stop
  - define points:<proc[define_curve].context[<player.location>|<player.location.forward[20]>|5|<[angle]>|1]>
  - foreach <[points]> as:point:
    - playeffect smoke at:<[point]> quantity:5 offset:0 distance:100
    - wait 1t

math_stuff:
  type: procedure
  definitions: C|degrees
  script:
  - while <[degrees]> > 360:
    - define degrees:<[degrees].sub[360]>
  - define hyp:<[degrees].to_radians.sin.mul[<[C]>]>
  - define adj:<[C].power[2].sub[<[hyp].power[2]>].sqrt>
  - if <[degrees]> > 90 && <[degrees]> < 179:
    - define adj:<[adj].mul[-1]>
  - else if <[degrees]> > 180 && <[degrees]> < 269:
    - define adj:<[adj].mul[-1]>
    - define hyp:<[hyp].mul[-1]>
  - else if <[degrees]> > 270 && <[degrees]> < 360:
    - define hyp:<[hyp].mul[-1]>
  - determine <list[<[hyp]>|<[adj]>]>