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
  name: parry
  ability_tree: Fisticuffs
  ability_type: slotted
  points_to_unlock: 0
  power_cost: 5
  description: Parry your opponent's attack and riposte.
  icon:
    material: stone
    custom_model_data: 1
  events:
    #Start Parry
    on player right clicks entity with:*_sword:
      - if !<player.has_flag[parrying]> || !<player.has_flag[ripostable]>:
        - inject abilities_check
        - inject abilities_cost
        - flag player parrying:true duration:2s
        #- run bb_timer def:<&d><&gt><&5>Parrying<&d><&gt>|2s|purple
        #- midi file:ability/parry/parry <player.location.forward>
    #Execute Parry
    on player damaged by entity flagged:parrying:
      - if <context.cause||entity_attack> == entity_attack:
        - narrate "<&6>You have <&2>parried <&6>your opponent's attack! Now's your chance to <&c>riposte."
        - flag player ripostable:true duration:2s
        #- midi file:ability/parry/parried <player>
    #Execute Riposte (1.25x - 1.50x damage)
    on player damages entity flagged:ripostable:
      #- midi file:ability/parry/riposte <player.location.forward>
      - playeffect sweep_attack at:<player.location.forward.above> quantity:1
      - determine <player.item_in_hand.damage.*[<util.random.decimal[1.25].to[1.5]>]>