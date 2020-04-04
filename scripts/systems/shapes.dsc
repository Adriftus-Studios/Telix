
define_curve1:
  type: procedure
  definitions: start|end|intensity|angle|between
  script:
  - define a:<[start].face[<[end]>].points_between[<[end]>].distance[<[between]>]>
  - define increment:<element[40].div[<[a].size>]>
  - foreach <[a]> as:point:
    - define b:<element[1].add[<element[1].div[20].mul[<[loop_index].mul[<[increment]>].sub[20]>].power[2].mul[-1]>].mul[<[intensity]>]>
    - define offset:<proc[find_offset].context[<[b]>|<[angle]>]>
    - define points:|:<[point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>
  
define_curve2:
  type: procedure
  definitions: start|end|intensity|angle|between
  script:
  - define a:<[start].face[<[end]>].points_between[<[end]>].distance[<[between]>]>
  - define increment:<element[40].div[<[a].size>]>
  - foreach <[a]> as:point:
    - define b:<element[1].add[<element[1].div[20].mul[<[loop_index].mul[<[increment]>].sub[20]>].power[2].mul[-1]>].mul[<[intensity]>]>
    - define offset:<proc[find_offset].context[<[b]>|<[angle]>]>
    - define points:|:<[point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>
  
define_sphere:
  type: procedure
  definitions: location|radius
  script:
  - define location:<[location].with_pitch[90].with_yaw[0]>
  - define cir:<[radius].mul[<util.pi>].mul[2]>
  - define between:<element[180].div[<[radius].mul[<util.pi>].mul[2].div[0.4]>]>
  - repeat <[cir].div[0.4].round>:
    - define offset:<proc[find_offset].context[<[radius]>|<[value].mul[<[between]>].add[90]>]>
    - define A:<[offset].get[1]>
    - if <[offset].get[2]> < 0:
      - define B:<[offset].get[2].mul[-1]>
    - else:
      - define B:<[offset].get[2]>
    - define points:|:<proc[define_sphere_helper].context[<[location].above[<[A]>]>|<[B]>]>
  - determine <[points]>

define_sphere_helper:
  type: procedure
  definitions: location|radius
  script:
  - define cir:<[radius].mul[<util.pi>].mul[2]>
  - define between:<element[360].div[<[radius].mul[<util.pi>].mul[2].div[0.4]>]>
  - repeat <[cir].div[0.4].round>:
    - define offset:<proc[find_offset].context[<[radius]>|<[value].mul[<[between]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>

define_circle:
  type: procedure
  definitions: location|radius
  script:
  - narrate <[location]>
  - define cir:<[radius].mul[<util.pi>].mul[2]>
  - define between:<element[360].div[<[radius].mul[<util.pi>].mul[2].div[0.2]>]>
  - repeat <[cir].div[0.2].round>:
    - define offset:<proc[find_offset].context[<[radius]>|<[value].mul[<[between]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>

define_star2:
  type: procedure
  definitions: location|radius|rotation|num
  script:
  - repeat <[num]>:
    - define t:<element[360].div[<[num]>].mul[<[num].div[2].round_down>]>
    - define offset:<proc[find_offset].context[<[radius]>|<[t].mul[<[value]>].add[<[rotation]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - define distance:<[points].get[1].points_between[<[points].get[2]>].distance[0.2].size>
  - repeat <[distance]>:
    - define x:<[value]>
    - repeat <[num]>:
      - define new_points:|:<[points].get[<[value]>].points_between[<[points].get[<[value].add[1]>]||<[points].get[1]>>].distance[0.4].get[<[x]>]>
  - determine <[new_points]>

define_star:
  type: procedure
  definitions: location|radius|rotation|num
  script:
  - repeat <[num]>:
    - define t:<element[360].div[<[num]>].mul[<[num].div[2].round_down>]>
    - define offset:<proc[find_offset].context[<[radius]>|<[t].mul[<[value]>].add[<[rotation]>]>]>
    - define points:|:<[location].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - repeat <[num]>:
    - foreach <[points].get[<[value]>].points_between[<[points].get[<[value].add[1]>]||<[points].get[1]>>].distance[0.4]> as:point:
      - define new_points:|:<[point]>
  - determine <[new_points]>

define_spiral:
  type: procedure
  definitions: start|end|radius|angle_offset
  script:
  - define start:<[start].face[<[end]>]>
  - define cir:<[radius].mul[<util.pi>].mul[2]>
  - define between:<element[360].div[<[radius].mul[<util.pi>].mul[2].div[0.2]>]>
  - foreach <[start].points_between[<[end]>].distance[0.4]> as:point:
    - define offset:<proc[find_offset].context[<[radius]>|<[between].mul[<[loop_index]>].add[<[angle_offset]>]>]>
    - define points:|:<[point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
  - determine <[points]>

define_zigzag:
  type: procedure
  definitions: start|end|radius
  script:
  - define start:<[start].face[<[end]>]>
  - define current:<[start]>
  - define distance_needed:<[start].distance[<[end]>]>
  - while true:
    - define new_point:<[current].forward[<util.random.int[5].to[10]>]>
    - if <[start].distance[<[new_point]>]> > <[distance_needed]>:
      - define points:|:<[current].points_between[<[end]>].distance[0.4]>
      - while stop
    - else:
      - define offset:<proc[find_offset].context[<[radius]>|<util.random.int[0].to[360]>]>
      - define new_point:<[new_point].up[<[offset].get[1]>].right[<[offset].get[2]>]>
      - define points:|:<[current].points_between[<[new_point]>].distance[0.4]>
    - define current:<[new_point]>
  - determine <[points]>

test_effects_command:
  type: command
  debug: false
  name: test_effects
  description: test_effects
  usage: /test_effects
  tab complete:
  - if <context.raw_args.split[].count[<&sp>]> == 0:
    - determine <list[curve1|curve2|star1|star2|circle|spiral|zigzag|sphere].filter[starts_with[<context.args.get[1]>]]||<list[curve|star1|star2|circle|spiral|zigzag|sphere]>>
  - else if <context.raw_args.split[].count[<&sp>]> == 1:
    - determine <server.list_particles.parse[to_lowercase].filter[starts_with[<context.args.get[2]||<server.list_particles>>]]>
  script:
  - define particle:<context.args.get[2]||smoke>
  - if <context.args.get[1]> == zigzag:
    - define points:<proc[define_zigzag].context[<player.location>|<player.location.forward[20]>|2]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == curve1:
    - define start:<player.location>
    - define end:<player.location.forward[20]>
    - repeat 90:
      #- define points:<proc[define_curve1].context[start|end|intensity|angle|between]>
      - define points:<proc[define_curve1].context[<[start]>|<[end]>|5|<[value].mul[4]>|1]>
      - playeffect <[particle]> at:<[points]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == curve2:
    - define start:<player.location>
    - define end:<player.location.forward[20]>
    - narrate "not done yet"
  - if <context.args.get[1]> == star1:
    - define points:<proc[define_star].context[<player.location.forward[4]>|3|90|5]>
    - repeat <[points].size>:
      - playeffect <[particle]> at:<[points].get[<[value]>]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == star2:
    - define num:5
    - define points:<proc[define_star2].context[<player.location.forward[4]>|3|90|<[num]>]>
    - repeat <[points].size.div[<[num]>]>:
      - repeat <[num]>:
        - playeffect <[particle]> at:<[points].get[<[value].mul[<[num]>].add[<[value]>]>]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == sphere:
    - define points:<proc[define_sphere].context[<player.location.forward[4]>|3]>
    - repeat 1:
      - playeffect <[particle]> at:<[points]> quantity:1 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == circle:
    - define points:<proc[define_circle].context[<player.location.forward[4]>|3]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == spiral:
    - define points:<proc[define_spiral].context[<player.location>|<player.location.forward[20]>|0.5|0]>
    - foreach <[points]> as:point:
      - playeffect <[particle]> at:<[point]> quantity:5 offset:0 visibility:100
      - wait 1t

find_offset:
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
  - else if <[degrees]> > 269 && <[degrees]> < 360:
    - define adj:<[adj]>
  - determine <list[<[hyp]>|<[adj]>]>

play_animation:
  type: task
  definitions: points|particle
  script:
  - define points:<[points].unescaped>
  - repeat <[points].size>:
    - playeffect <[particle]> <[points].get[<[value]>]> offset:0 visibility:300 quantity:2
    - wait 1t
