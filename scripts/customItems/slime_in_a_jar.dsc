
slime_in_a_jar_listener:
  type: world
  events:
    on player right clicks block with dirt:
    - if <context.chunk.spawn_slimes> == true:
      - narrate "True"
    - else if <context.chunk.spawn_slimes> == false:
      - narrate "False"
    - else:
      - narrate "Shit didn't work"