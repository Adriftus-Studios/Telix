
slime_in_a_jar_listener:
  type: world
  events:
    on player right clicks block with dirt:
    - if <context.location.chunk.spawn_slimes> == true:
      - narrate "True"
    - else if <context.location.chunk.spawn_slimes> == false:
      - narrate "False"
    - else:
      - narrate "<context.location.chunk.spawn_slimes>"