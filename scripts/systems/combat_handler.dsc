
combat_handler:
  type: world
  events:
    on player damaged by player:
      - flag <context.entity> pvp:true duration:5m
      - flag <context.damager> pvp:true duration:5m

      
damage_command:
  type: command
  name: damage
  script:
    - define damage:<context.args.get[1]>
    - define health:<player.health>
    - hurt <[damage].mul[<[health]>].div[20]>
# 20 / damage = health / X