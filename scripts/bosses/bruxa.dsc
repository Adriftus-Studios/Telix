
spawn_boss_bruxa:
  type: task
  definitions: difficulty
  script:
  - define difficulty:<[difficulty]||easy>
  - announce "<&c>-------------------------------"
  - announce "<&c>      Bruxa has been summoned!"
  - announce "<&c>-------------------------------"
  - if <[difficulty]> == easy:
    - title "title:<&c>Bruxa has been summoned!" "subtitle:<&c>Difficulty: Easy" stay:4s
    - define points:<proc[define_sphere1].context[<location[boss_bruxa_spawnpoint]>|15|2]>
    - repeat 200:
      - define curve:<proc[define_curve1].context[<[points].random>|<location[boss_bruxa_spawnpoint]>|3|0|0.5]>
      - run boss_bruxa_effect1 def:<[curve].escaped>
      - define curve:<proc[define_curve1].context[<[points].random>|<location[boss_bruxa_spawnpoint]>|3|0|0.5]>
      - run boss_bruxa_effect1 def:<[curve].escaped>
      - wait 1t
    - wait 20t
    - repeat 30:
      - define sphere:<proc[define_sphere1].context[<location[boss_bruxa_spawnpoint]>|<[value].mul[2]>|<[value].mul[0.6]>]>
      - playeffect redstone <[sphere]> offset:1 visibility:300 quantity:2 special_data:1|<co@255,0,0>
      - wait 1t
    - announce "test done"
    - run spawn_custom_mob def:<entity[boss_bruxa_easy]>|<location[boss_bruxa_spawnpoint].below>

boss_bruxa_effect1:
  type: task
  definitions: points
  script:
  - define points:<[points].unescaped>
  - foreach <[points]> as:point:
    - playeffect redstone <[point]> offset:0.2 visibility:300 quantity:3 special_data:1|<co@255,0,0>
    - wait 1t
    
boss_bruxa_easy_kill_script:
  type: task
  definitions: killer
  script:
  - narrate stuff

boss_bruxa_easy:
  type: entity
  entity_type: stray
  custom_name: <&l><&4>Bruxa
  custom_name_visible: true
  max_health: 600
  health: 600
  speed: 0.2
  custom:
    has_bossbar: true
    kill_script: boss_bruxa_easy_kill_script
    ability_usage:
    - boss_bruxa_test_ability

boss_bruxa_test_ability:
  type: task
  ability_tree: water
  cooldown: 40s
  warmup: 5s
  requires_target: false
  requires_target_in_sight: false
  one_time_use: true
  definitions: entity
  script:
  - narrate TODO
  