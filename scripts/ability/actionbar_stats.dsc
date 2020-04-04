# targets:<[value]>
actionbar_stats:
  type: world
  debug: false
  events:
    on delta time secondly:
      #- stop
      - foreach <server.list_online_players>:
        - actionbar "<&c><[value].health.round_to[0]>/<[value].health_max>❤ <&0>· <&b>✧<yaml[player.<[value].uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<[value].uuid>].read[stats.power.max]>" targets:<[value]>

# targets:<player>
actionbar_stats_update:
  type: task
  script:
    - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&0>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
