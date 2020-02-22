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
  
define_sphere:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define yaw:<[value]>
    - repeat 180:
      - define pitch:<[value].sub[90]>
      - define point:<[location].with_pose[<[pitch]>,<[yaw]>].relative[0,0,<[radius]>]>
      - if !<[points].contains[<[point]>]>:
        - define points:|:<[point]>
  - determine <[points]>

define_block_sphere:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define yaw:<[value]>
    - repeat 180:
      - define pitch:<[value].sub[90]>
      - define point:<[location].with_pose[<[pitch]>,<[yaw]>].relative[0,0,<[radius]>].block>
      - if !<[points].contains[<[point]>]>:
        - define points:|:<[point]>
  - determine <[points]>

relative_point:
  type: procedure
  definitions: location|radius|pitch|yaw
  script:
  - determine <[location].with_pose[<[pitch]||0>,<[yaw]||0>].relative[0,0,<[radius]>]>

circle_command:
  type: command
  name: circle
  script:
    - repeat 100:
      - define y:<[value].cos.mul[10]>
      - foreach <proc[define_sphere].context[<player.location>|5]> as:point:
        - playeffect flame at:<[point]> quantity:5 offset:0.1 visibility:40
      - wait 1t