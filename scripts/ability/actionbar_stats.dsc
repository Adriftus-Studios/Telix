# targets:<[value]> from foreach <server.list_online_players>
actionbar_stats:
  type: world
  events:
    on delta time secondly:
      - foreach <server.list_online_players>:
        - actionbar "<&c><[value].health.round_to[0]>/<[value].health_max>❤ <&f>· <&b><yaml[player.<[value].uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<[value].uuid>].read[stats.power.max]>❃" targets:<[value]>

# targets:<player>
actionbar_stats_update:
  type: task
  script:
    - actionbar "<&c><[value].health.round_to[0]>/<[value].health_max>❤ <&f>· <&b><yaml[player.<[value].uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<[value].uuid>].read[stats.power.max]>❃" targets:<player>