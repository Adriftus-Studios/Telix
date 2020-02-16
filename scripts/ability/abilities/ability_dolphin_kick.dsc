ability_dolphin_kick:
  type: world
  name: dolphin_kick
  ability_tree: Athleticism
  ability_type: passive
  points_to_unlock: 20
  power_cost: 10
  description: Sneaking while swimming will perform a fast kick.
  icon:
    material: stone
    custom_model_data: 1
  events:
    on player starts sneaking:
      - if <player.swimming>:
        - inject abilities_check
        - determine passively cancelled
        - playeffect water_bubble at:<player.location.forward_flat.center.below[1]> quantity:20 targets:<player>
        - cast speed duration:1.5s power:5 <player> hide_particles
        - cast dolphins_grace duration:6s power:10 <player> hide_particles