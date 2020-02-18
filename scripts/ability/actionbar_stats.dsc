actionbar_stats:
  type: world
  events:
    on delta time secondly:
      - foreach <server.list_online_players>:
        - actionbar "<&c>Health<&co> <[value].health.round_to[0]>/<[value].health_max> <&e>------ <&b>Power<&co> <yaml[player.<[value].uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<[value].uuid>].read[stats.power.max]>" targets:<[value]>

actionbar_stats_update:
  type: task
  script:
    - actionbar "<&c>Health<&co> <player.health.round_to[0]>/<player.health_max> <&e>------ <&b>Power<&co> <yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>