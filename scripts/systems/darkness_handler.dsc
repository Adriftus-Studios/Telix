darkness_handler_events:
  type: world
  debug: false
  events:
    on delta time secondly:
      - stop
      - if !<server.list_worlds.parse[name].contains[tor_mainland]>:
        - stop
      - if <world[tor_mainland].time> >= 14500 && <world[tor_mainland].time> <= 20500:
        - foreach <server.list_online_players.filter[location.find.blocks[fire|wall_torch|torch|campfire|lantern].within[6].is_empty].filter[item_in_hand.material.name.contains_any[torch|lantern].not]>:
          - if !<[value].has_flag[cheatmode]> && <[value].location.world.name> == tor_mainland:
            - cast <[value]> blindness duration:3s