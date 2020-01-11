darkness_handler_events:
  type: world
  events:
    on delta time secondly:
      - if <world[world].time> >= 13500 && <world[world].time> <= 22500:
        - foreach <server.list_online_players.filter[location.find.blocks[fire|torch|campfire|lantern].within[6].is_empty].filter[item_in_hand.material.name.contains_any[torch|lantern].not]>:
          - cast <[value]> blindness duration:2s