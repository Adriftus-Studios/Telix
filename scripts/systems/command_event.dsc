
event_command:
  type: command
  name: events
  permission: events
  script:
  - if <context.args.get[2].div[1]> != <context.args.get[2]>:
    - stop
  - if <context.args.get[3].as_duration||null> == null:
    - define duration:<duration[1h]>
  - else:
    - define duration:<context.args.get[3].as_duration>
  - if <[duration].formatted.ends_with[d]>:
    - if <[duration].formatted> == 1d:
      - define value:1_Day
    - else:
      - define value:<[duration].in_days><&sp>Days
  - else if <[duration].formatted.ends_with[h]>:
    - if <[duration].formatted> == 1h:
      - define value:1_Hour
    - else:
      - define value:<[duration].in_hours><&sp>Hours
  - else if <[duration].formatted.ends_with[m]>:
    - if <[duration].formatted> == 1m:
      - define value:1_Minute
    - else:
      - define value:<[duration].in_minutes><&sp>Minutes
  - else if <[duration].formatted.ends_with[s]>:
    - if <[duration].formatted> == 1s:
      - define value:1_Second
    - else:
      - define value:<[duration].in_seconds><&sp>Seconds
  - else:
    - narrate no
    - stop
  - if <context.args.get[1]> == xp:
    - flag server global_xp_multiplier:<context.args.get[2]> duration:<[duration]>
    - announce "<&6><&l><player.name||Console><&r><&6> has activated <context.args.get[2]>X XP for <[value]>!"
  - if <context.args.get[1]> == mob:
    - flag server global_mob_drop_multiplier:<context.args.get[2]> duration:<[duration]>
    - announce "<&6><&l><player.name||Console><&r><&6> has activated <context.args.get[2]>X Mob Drops for <[value]>!"
  - if <context.args.get[1]> == ore:
    - flag server double_ore_drops:<context.args.get[2]> duration:<[duration]>
    - announce "<&6><&l><player.name||Console><&r><&6> has activated Double Ores for <[value]>!"