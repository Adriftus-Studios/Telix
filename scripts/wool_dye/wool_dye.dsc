wool_click_handler:
  type: world
  events:
    on player right clicks *_wool with *_dye:
    - narrate "Context Item: <context.item>"
    - narrate "Context Material: <context.material>"