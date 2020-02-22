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
  - repeat 20:
    - define points:<proc[define_circle].context[<player.location>|<[value]>]>
    - foreach <[points]> as:point:
      - if <util.random.int[1].to[2]> == 1:
        - strike <[point].highest>
    - wait 1t