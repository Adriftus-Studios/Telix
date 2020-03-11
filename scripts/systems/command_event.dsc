
event_command:
  type: command
  name: events
  script:
  - if <context.args.get[2].div[1]> != <context.args.get[2]>:
    - stop
  - if <context.args.get[1]> == xp:
    - flag server global_xp_multiplier:<context.args.get[2]> duration:<duration[<context.args.get[3]>]||<duration[1h]>>
    - announce "<&6><&l><player.name><&r><&6> has activated <context.args.get[2]>X XP!"
  - if <context.args.get[1]> == mob:
    - flag server global_mob_drop_multiplier:<context.args.get[2]> duration:<duration[<context.args.get[3]>]||<duration[1h]>>
    - announce "<&6><&l><player.name><&r><&6> has activated <context.args.get[2]>X Mob Drops!"
  - if <context.args.get[1]> == ore:
    - flag server double_ore_drops:<context.args.get[2]> duration:<duration[<context.args.get[3]>]||<duration[1h]>>
    - announce "<&6><&l><player.name><&r><&6> has activated Double Ores!"