flag_handler:
    type: world
    events:
    on entity damaged by suffocation:
    - if <player||null> != null:
        - if <player.has_flag[no_suffocate]>:
            - determine 0.0
    on entity damaged by fall:
    - if <player||null> != null:
        - if <player.has_flag[no_fall]>:
            - determine 0.0