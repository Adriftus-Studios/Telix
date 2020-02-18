abilities_power_system_tick:
  type: world
  events:
    on delta time secondly:
      - foreach <server.list_online_players.filter[has_flag[no_power_regain].not]>:
        - adjust <queue> attached_player:<[value]>
        - inject power_regain_tick

power_regain_tick:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.power.max]> > <yaml[player.<player.uuid>].read[stats.power.current]>:
      - if <yaml[player.<player.uuid>].read[stats.power.max]./[20].+[<yaml[player.<player.uuid>].read[stats.power.current]>]> > 20:
        - yaml id:player.<player.uuid> set stats.power.current:20
        - stop
      - yaml id:player.<player.uuid> set stats.power.current:+:<yaml[player.<player.uuid>].read[stats.power.max]./[20]>
      - adjust <player> food_level:<yaml[player.<player.uuid>].read[stats.power.current]./[<yaml[player.<player.uuid>].read[stats.power.max]>].*[20]>