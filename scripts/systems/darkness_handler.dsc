darkness_handler_events:
  type: world
  events:
    on delta time secondly:
      - if <world[tor_mainland].time> >= 13500 && <world[tor_mainland].time> <= 22500:
        - foreach <server.list_online_players.filter[location.find.blocks[fire|wall_torch|torch|campfire|lantern].within[6].is_empty].filter[item_in_hand.material.name.contains_any[torch|lantern].not]>:
          - if !<[value].has_flag[adminmode]>:
            - cast <[value]> blindness duration:2s