
combat_handler:
  type: world
  events:
    on player damaged by player:
      - flag <context.entity> pvp:true duration:5m
      - flag <context.damager> pvp:true duration:5m

      
damage_command:
  type: command
  name: damage
  tab complete:
  - foreach <yaml[server.executable_scripts].read[scripts].filter[to_lowercase.starts_with[<context.args.get[1].to_lowercase>]]>:
    - define list:|:<[value]>
  - determine <[list]>
  script:
    - define damage:<context.args.get[1]>
    - define health:<player.health>
    - determine <[damage].mul[<[health]>].div[20]>
# 20 / damage = health / X