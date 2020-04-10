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
    - if <yaml[player.<player.uuid>].read[pvp.power_flash]||both> == both:
      - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&f>· <&3>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
    - else if <yaml[player.<player.uuid>].read[pvp.power_flash]> == values:
      - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&0>· <&3>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
    - else if <yaml[player.<player.uuid>].read[pvp.power_flash]> == dot:
      - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&f>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
    - else:
      - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&0>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
    
#Experimenting with stuff
actionbar_stats_damage:
  type: world
  debug: false
  events:
    on player damaged:
      - if <yaml[player.<player.uuid>].read[pvp.damage_flash]||both> == both:
        - actionbar "<&4><player.health.round_to[0]>/<player.health_max>❤ <&c>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
      - else if <yaml[player.<player.uuid>].read[pvp.damage_flash]> == values:
        - actionbar "<&4><player.health.round_to[0]>/<player.health_max>❤ <&0>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
      - else if <yaml[player.<player.uuid>].read[pvp.damage_flash]> == dot:
        - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&c>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
      - else:
        - actionbar "<&c><player.health.round_to[0]>/<player.health_max>❤ <&0>· <&b>✧<yaml[player.<player.uuid>].read[stats.power.current].round_to[0]>/<yaml[player.<player.uuid>].read[stats.power.max]>" targets:<player>
