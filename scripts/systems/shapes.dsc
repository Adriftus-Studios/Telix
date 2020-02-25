
define_curve:
  type: procedure
  definitions: start|end|intensity|angle|between
  script:
  - define a:<[start].face[<[end]>].points_between[<[end]>].distance[<[between]>]>
  - define increment:<el@40.div[<[a].size>]>
  - foreach <[a]> as:point:
    - define b:<el@1.add[<el@1.div[20].mul[<[loop_index].mul[<[increment]>].sub[20]>].power[2].mul[-1]>].mul[<[intensity]>]>
    - define offset:<proc[math_stuff].context[<[b]>|<[angle]>]>
    - define points:|:<[point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>
  
define_circle:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define offset:<proc[math_stuff].context[<[radius]>|<[value]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>

define_star2:
  type: procedure
  definitions: location|radius|rotation|num
  script:
  - repeat <[num]>:
    - define t:<el@360.div[<[num]>].mul[<[num].div[2].round_down>]>
    - define offset:<proc[math_stuff].context[<[radius]>|<[t].mul[<[value]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - define distance:<[points].get[1].points_between[<[points].get[2]>].distance[0.2].size>
  - repeat <[distance]>:
    - define x:<[value]>
    - repeat <[num]>:
      - define new_points:|:<[points].get[<[value]>].points_between[<[points].get[<[value].add[1]>]||<[points].get[1]>>].distance[0.2].get[<[x]>]>
  - determine <[new_points]>

define_star:
  type: procedure
  definitions: location|radius|rotation|num
  script:
  - repeat <[num]>:
    - define t:<el@360.div[<[num]>].mul[<[num].div[2].round_down>]>
    - define offset:<proc[math_stuff].context[<[radius]>|<[t].mul[<[value]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - repeat <[num]>:
    - foreach <[points].get[<[value]>].points_between[<[points].get[<[value].add[1]>]||<[points].get[1]>>].distance[0.2]> as:point:
      - define new_points:|:<[point]>
  - determine <[new_points]>

test_command:
  type: command
  debug: true
  name: test
  description: test
  usage: /test
  tab complete:
  - determine <list[curve|star1|star2|circle]>
  script:
  - if <context.args.get[1]> == curve:
    - repeat 90:
      - define points:<proc[define_curve].context[<player.location>|<player.location.forward[20]>|5|<[value].mul[4]>|1]>
      - playeffect smoke at:<[points]> quantity:5 offset:0
      - wait 1t
  - if <context.args.get[1]> == star1:
    - define points:<proc[define_star].context[<player.location.forward[4]>|3|0|5]>
    - repeat <[points].size>:
      - playeffect smoke at:<[points].get[<[value]>]> quantity:5 offset:0
      - wait 1t
  - if <context.args.get[1]> == star2:
    - define points:<proc[define_star2].context[<player.location.forward[4]>|3|0|5]>
    - repeat <[points].size.div[5]>:
      - playeffect smoke at:<[points].get[<[value].mul[5].add[1]>]> quantity:5 offset:0
      - playeffect smoke at:<[points].get[<[value].mul[5].add[2]>]> quantity:5 offset:0
      - playeffect smoke at:<[points].get[<[value].mul[5].add[3]>]> quantity:5 offset:0
      - playeffect smoke at:<[points].get[<[value].mul[5].add[4]>]> quantity:5 offset:0
      - playeffect smoke at:<[points].get[<[value].mul[5].add[5]>]> quantity:5 offset:0
      - wait 1t
  - if <context.args.get[1]> == circle:
    - define points:<proc[define_circle].context[<player.location.forward[4]>|2]>
    - foreach <[points]>:
      - playeffect smoke at:<[value]> quantity:5 offset:0
      - wait 1t

math_stuff:
  type: procedure
  definitions: C|degrees
  script:
  - while <[degrees]> > 360:
    - define degrees:<[degrees].sub[360]>
  - define hyp:<[degrees].to_radians.sin.mul[<[C]>]>
  - define adj:<[C].power[2].sub[<[hyp].power[2]>].sqrt>
  - if <[degrees]> > 89 && <[degrees]> < 180:
    - define adj:<[adj].mul[-1]>
  - else if <[degrees]> > 179 && <[degrees]> < 270:
    - define adj:<[adj].mul[-1]>
  - determine <list[<[hyp]>|<[adj]>]>