# Boss weakenesses:
# Water > Fire
# Fire > Air
# Air > Earth
# Earth > Ender
# Ender > Water


## - Dagon the Water Boss
custom_boss_dagon_helmet:
  type: item
  material: diamond_helmet
  category: hat
  weight: 15
  fake_durability: 350
  max_stars: 6
  sockets: 3
  equipment_modifiers:
    thirst:
      max: 60
      min: 50
  damage_modifiers:
    damage_resistance:
      fire:
        max: 0.05
        min: 0.01
    damage_dealt:
      water:
        max: 0.02
        min: 0.01
  display name: "<&a><&lb><&6>Dagon's Helm of the Deep<&a><&rb>"
  lore:
    - <&6>
  drops_on_death: false
##
custom_boss_dagon_trident:
  type: item
  material: trident
  weight: 10
  fake_durability: 350
  max_stars: 6
  sockets: 3
  equipment_modifiers:
    melee_damage:
      max: 24
      min: 22
  damage_modifiers:
    damage_resistance:
      fire:
        max: 0.05
        min: 0.01
    damage_dealt:
      water:
        max: 0.02
        min: 0.01
  display name: "<&a><&lb><&6>Dagon's Trident of Tempest<&a><&rb>"
  lore:
    - <&6>
  drops_on_death: false