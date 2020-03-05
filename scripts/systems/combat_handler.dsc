
combat_handler:
  type: world
  events:
    on player damaged by player:
      - flag <context.entity> pvp:true duration:5m
      - flag <context.damager> pvp:true duration:5m
      - determine <context.final_damage.mul[<context.entity.health>].div[20]>

      
damage_command:
  type: command
  name: damage
  script:
    - hurt <context.args.get[1].mul[<player.health>].div[20]>