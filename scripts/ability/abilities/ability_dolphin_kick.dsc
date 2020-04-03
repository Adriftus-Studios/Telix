ability_dolphin_kick:
  type: world
  name: dolphin_kick
  ability_tree: Athleticism
  ability_type: passive
  points_to_unlock: 0
  power_cost: 10
  description: Perform a fast kick while swimming to speed up.
  usage: Underwater > Swimming + Sneak
  icon:
    material: iron_nugget
    custom_model_data: 8
  events:
    on player starts sneaking:
      - if <player.swimming>:
        #Target Skill Tree: Athleticism, Target Points Requirement: 0, Target Power Cost: 5
        - inject abilities_check
        - determine passively cancelled
        - inject abilities_cost
        - playeffect water_bubble at:<player.location.forward_flat.center.below[1]> visibility:15 quantity:30
        #- cast speed duration:1.5s power:5 <player> hide_particles Pre 2020-04-03
        - shoot <player> d:<player.location.forward[10]> height:0 speed:1
        - cast dolphins_grace duration:6s power:10 <player> hide_particles
        - playeffect water_bubble at:<player.location.forward_flat.center.below[1]> visibility:15 quantity:30
        - playsound <player.location> sound:entity_generic_splash volume:1.0
