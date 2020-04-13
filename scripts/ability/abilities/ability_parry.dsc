#ability_parry
#Parrying is a universal skill that all swords share.
#Uses Kyu's (2020-03-01) bossbar timer task. (- run bb_timer def:title|duration|color|targets)
# Flags:
#  parrying: Duration of the parry window
# SFX:
#  "ability/fisticuffs/parry.ogg", "ability/fisticuffs/riposte.ogg"
ability_parry:
  type: world
  debug: false
  name: parry
  ability_tree: Fisticuffs
  ability_type: passive
  points_to_unlock: 10
  power_cost: 5
  description: Parry your opponent's attack and riposte.
  icon:
    material: iron_nugget
    custom_model_data: 117
  animation:
    - repeat 2:
      - wait 0.125s
      - glow <player>
      - wait 0.125s
      - glow <player> false
    - wait 0.125s
    - glow <player>
    - wait 1s
    - glow <player> false
  events:
    #Start Parry
    on player right clicks air with *_sword:
      - yaml id:player.<player.uuid> set stats.power.current:<yaml[player.<player.uuid>].read[stats.power.max]||20>
      - if !<player.has_flag[parrying]>:
        #Target Skill Tree: Fisticuffs, Target Points Requirement: 10, Target Power Cost: 5
        - inject abilities_check
        - inject abilities_cost
        - flag player parrying:true duration:2s
        - run bb_timer def:<&5>Parrying|2s|purple
        #- playsound <player.location.forward> sound:ability.fisticuffs.parry custom
        #- inject locally animation
    #Execute Riposte
    on player damaged by entity flagged:parrying:
      - if <context.damager.location.distance[<player.location>]||5> <= 3:
        #Remove bossbar and flag
        - flag player parrying:!
        #Riposte
        - look <player> <context.damager.eye_location>
        - cast slow <context.damager> duration:1s power:2
        - hurt <context.damager> <player.weapon_damage.*[<util.random.decimal[1.5].to[1.75].round>]||1>
        - adjust <context.damager> velocity:<player.location.direction.vector.with_y[0.25]>
        #Visual and Auditory
        - playeffect sweep_attack at:<player.location.forward.above> quantity:1
        #- playsound <player.location> sound:ability.fisticuffs.riposte custom
        - narrate "<&6>You have <&a>parried <&6>your opponent's attack!"
        - determine <context.damage./[2]>
