PlayerLevels_loginEvents:
  type: world
  events:
    on player joins:
      - wait 1t
      - inject PlayerLevels_setStatsForLevel


PlayerLevels_setLevel:
  type: task
  definitions: level
  script:
    - run setPlayerData def:health.max|<[level].*[10].+[100]>
    - run setPlayerData def:power.max|<[level].*[10].+[100]>
    - adjust <player> max_health:<[level].*[10].+[100]>
    - if <player.health> > <[level].*[10].+[100]>:
      - adjust <player> health:<[level].*[10].+[100]>

PlayerLevels_setStatsForLevel:
  type: task
  script:
    - define currentHealthLevel:<proc[getPlayerData].context[health.max]>
    - if <[currentHealthLevel]> == null:
      - define level:0
      - inject PlayerLevels_setLevel
      - define currentHealthLevel
    - adjust <player> max_health:<[currentHealthLevel]>
    - if <player.health> > <[currentHealthLevel]>:
      - adjust <player> health:<[currentHealthLevel]>