define_circle:
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
  definitions: location|radius|angle
  script:
  - determine <[location].with_pose[<[angle].pitch>,<[angle].yaw>].relative[0,0,<[radius]>].block>

circle_command:
  type: command
  name: circle
  script:
    - repeat 1000:
      - define y:<[value].cos>
      - playeffect flame at:<proc[relative_point].context[<player.location>|5|<location[0,0,0].with_pitch[<[y]>].with_yaw[<[value]>]>]> quantity:5 offset:0.1 visibility:40
      - wait 1t