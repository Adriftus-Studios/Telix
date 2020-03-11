
combat_handler:
  type: world
  events:
    on player damaged by player:
      - flag <context.entity> pvp:true duration:1m
      - flag <context.damager> pvp:true duration:1m
      - determine <context.final_damage.mul[<context.entity.health>].div[20]>

damage_command:
  type: command
  name: damage
  script:
    - define damage:<context.args.get[1]>
    - define armor:<context.args.get[2]>
    - define damage_modifier:<context.args.get[3]>
    - define defence_modifier:<context.args.get[4]>
    - define damage:<[damage].mul[<[damage_modifier]>].div[<[defence_modifier]>]>
    - define final_damage:<[damage].mul[<el@1.sub[<el@20.mul[<[armor].div[5]>].div[25]>]>]>
    - narrate <[final_damage]>

calculate_damage:
  type: procedure
  definitions: damager|damaged|damage|type
  script:
    - define armor:<[damaged].armor_bonus>
    - define damage_modifier:1
    - define defence_modifier:1
    - if <[damager].type> == player:
      - define damage_modifier:<yaml[player.<[damager].uuid>].read[stats.damage_modifier.<[type]>]||1>
    - else if <[damager].type> == entity:
      - if <[damager].script||null> != null:
        - define damage_modifier:<[damager].script.yaml_key[custom.damage_modifier.<[type]>]||1>
    - if <[damaged].type> == player:
      - define defence_modifier:<yaml[player.<[damaged].uuid>].read[stats.defence_modifier.<[type]>]||1>
    - else if <[damaged].type> == entity:
      - if <[damaged].script||null> != null:
        - define defence_modifier:<[damaged].script.yaml_key[custom.defence_modifier.<[type]>]||1>
    - define damage:<[damage].mul[<[damage_modifier]>].div[<[defence_modifier]>]>
    - define final_damage:<[damage].mul[<el@1.sub[<el@20.mul[<[armor].div[5]>].div[25]>]>]>
    - if <[final_damage]> < 0.5:
      - define final_damage:0.5
    - determine <[final_damage]>