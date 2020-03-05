#ability_parry
#Parrying is a universal skill that all swords share.
#Uses Kyu's (2020-03-01) bossbar timer task. (- run bb_timer def:title|duration|color|targets)
# Flags:
#  parrying: Duration of the parry window
# SFX:
#  "ability/fisticuffs/parry.ogg", "ability/fisticuffs/riposte.ogg"
ability_parry:
  type: world
  debug: true
  name: parry
  ability_tree: Fisticuffs
  ability_type: passive
  points_to_unlock: 10
  power_cost: 5
  description: Parry your opponent's attack and riposte.
  icon:
    material: stone
    custom_model_data: 1
  events:
    #Start Parry
    on player right clicks entity with:*_sword:
      - if !<player.has_flag[parrying]>:
        - inject abilities_check
        - inject abilities_cost
        - flag player parrying:true duration:2s
        - run bb_timer def:<&5>Parrying|2s|purple
        #- playsound <player.location.forward> sound:ability.fisticuffs.parry custom
        - inject ability_parry_animation
      - yaml id:player.<player.uuid> set stats.power.current:<yaml[player.<player.uuid>].read[stats.power.max]||20>
    #Execute Parry
    on player damaged by entity flagged:parrying:
      - if <context.cause||entity_attack> == entity_attack:
        - hurt <context.entity> <player.item_in_hand.damage.*[<util.random.decimal[1.5].to[1.75].round>]>
        - shoot <context.entity> d:<player.location.forward_flat[12]> height:1
        - playeffect sweep_attack at:<player.location.forward.above> quantity:1
        #- playsound <player.location> sound:ability.fisticuffs.riposte custom
        - narrate "<&6>You have <&a>parried <&6>your opponent's attack!"


#Injected task. <player>, <context.entity>
ability_parry_animation:
  type: task
  debug: false
  script:
    - repeat 2:
      - wait 0.125s
      - glow <player>
      - wait 0.125s
      - glow <player> false
    - wait 0.125s
    - glow <player>
    - wait 1s
    - glow <player> false

    
    