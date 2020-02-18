actionbar_stats:
  type: world
  events:
    on delta time secondly:
      - foreach <server.list_online_players>:
        - actionbar "<&c>Health<&co> <[value].health><&fs><[value].max_health> <&e>------ <&b>Power<&co> <yaml[player.<[value].uuid>].read[stats.power.current]><&fs><yaml[player.<[value].uuid>].read[stats.power.max]>" targets:<[value]>

actionbar_stats_update:
  type: task
  script:
    - actionbar "<&c>Health<&co> <player.health><&fs><player.max_health> <&e>------ <&b>Power<&co> <yaml[player.<player>].read[stats.power.current]><&fs><yaml[player.<player>].read[stats.power.max]>" targets:<[value]>