abilities_power_system_tick:
  type: world
  debug: false
  events:
    on delta time secondly:
      - foreach <server.list_online_players.filter[has_flag[no_power_regain].not]>:
        - adjust <queue> linked_player:<[value]>
        - inject power_regain_tick

power_regain_tick:
  type: task
  debug: false
  script:
    - if <yaml[player.<player.uuid>].read[stats.power.max]> > <yaml[player.<player.uuid>].read[stats.power.current]>:
      - if <yaml[player.<player.uuid>].read[stats.power.max]./[20].+[<yaml[player.<player.uuid>].read[stats.power.current]>]> > <yaml[player.<player.uuid>].read[stats.power.max]>:
        - yaml id:player.<player.uuid> set stats.power.current:<yaml[player.<player.uuid>].read[stats.power.max]>
        - stop
      - yaml id:player.<player.uuid> set stats.power.current:+:<yaml[player.<player.uuid>].read[stats.power.max]./[20]>
      - adjust <player> food_level:<yaml[player.<player.uuid>].read[stats.power.current]./[<yaml[player.<player.uuid>].read[stats.power.max]>].*[20]>