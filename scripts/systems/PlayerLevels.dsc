playerLevel_GiveXP:
  type: task
  definitions: xp
  script:
    - define xp:<[xp].mul[<server.flag[global_xp_multiplier]>]||<[xp]>>
    - define preXP:<yaml[player.<player.uuid>].read[stats.xp]>
    - yaml id:player.<player.uuid> set stats.xp:+:<[xp]>
    - if 100 < <yaml[player.<player.uuid>].read[stats.xp]>:
      - inject playerLevel_levelUp
      - run playerLevel_GiveXP def:<[xp].-[<element[100].-[<[preXP]>]>]>
    - inject playerLevel_showXP

playerLevel_showXP:
  type: task
  script:
    - adjust <player> fake_experience:<yaml[player.<player.uuid>].read[stats.xp]./[100]>|<yaml[player.<player.uuid>].read[lessons.current]>

playerLevel_levelUp:
  type: task
  script:
    - actionbar "<&a>You Have Gained 10 Lessons!"
    - yaml id:player.<player.uuid> set lessons.current:+:10
    - yaml id:player.<player.uuid> set lessons.lifetime:+:10
    - yaml id:player.<player.uuid> set stats.xp:0
    - yaml id:player.<player.uuid> set stats.stat_points:+:1
    - inventory adjust slot:38 custom_model_data:2