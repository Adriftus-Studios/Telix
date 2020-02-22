define_circle:
  type: task
  definitions: location|radius
  script:
  # do stuff to return a list of location tags
  
test_math_command:
  type: command
  name: math
  description: math
  usage: /math
  script:
  
get_relative_point:
  type: procedure
  definitions: location|radius|
  
rotate_pitch:
  type: procedure
  definitions: location|roll
  script:
  - define roll:<[roll].to_radians>
  - narrate <[location].x.mul[<[roll].cos>]>
  - narrate <[location].y.mul[<[roll].sin>]>
  - define new_location:<[location].add[<location[<[location].x.mul[<[roll].cos>].+<[location].y.mul[<[roll].sin>]>>,0,z,<[location].world.name>]>]>
  - determine <[new_location]>

rotate_yaw:
  type: procedure
  
rotate_roll:
  type: procedure
  