#ability_parry
#Parrying is a universal skill that all swords share.
#Uses Kyu's (2020-03-01) bossbar timer task. (- run bb_timer def:title|duration|color|targets)
# Flags:
#  parrying: Duration of the parry window
#  ripostable: Duration of the riposte window (After a successful parry)
# MIDI SFX:
#  "parry.mid", "parried.mid", "riposte.mid"
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
        #- playsound <player.location.forward> sound:parry custom
    #Execute Parry
    on player damaged by entity flagged:parrying:
      - if <context.cause||entity_attack> == entity_attack:
        - look <player> <context.entity>
        - hurt <player.target> <player.item_in_hand.damage.*[<util.random.decimal[1.5].to[1.75].round>]>
        - playeffect sweep_attack at:<player.location.forward.above> quantity:1
        #- playsound <player.location> sound:riposte custom
        - narrate "<&6>You have <&a>parried <&6>your opponent's attack!"