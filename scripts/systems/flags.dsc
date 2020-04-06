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
        on entity damaged:
        - if <player||null> != null:
            - if <player.has_flag[no_damage]>:
                - determine 0.0
        on player jumps:
        - if <player||null> != null:
            - if <player.has_flag[no_jump]> || <player.has_flag[no_move]>:
                - determine cancelled
        on entity knocks back entity:
        - if <context.entity.has_flag[no_knockback]||false> || <context.entity.has_flag[no_move]||false>:
            - determine cancelled
        on player walks:
        - if <player||null> != null:
            - if <player.has_flag[no_move]>:
                - determine cancelled
        on tick:
        - foreach <server.list_online_players.filter[has_flag[downpull]]> as:player:
            - adjust <queue> linked_player:<[player]>
            - adjust <[player]> velocity:<[player].velocity.add[<location[0,0.02,0]>]>