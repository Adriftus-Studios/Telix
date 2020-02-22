define_circle:
  type: procedure
  definitions: location|radius
  script:
  - repeat 360:
    - define point:<[location].with_pose[0,<[value]>].relative[0,0,<[radius]>].block>
    - if !<[points].contains[<[point]>]>:
      - define points:|:<[point]>
  - determine <[points]>

circle_command:
  type: command
  name: circle
  script:
  - repeat 10:
    - define points:<proc[define_circle].context[<player.location>|<[value]>]>
    - foreach <[points]> as:point:
      - strike <[point].highest>
    - wait 2t