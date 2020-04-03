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
  # What type of equipment is this item
  # Can be a Necklace, Earrings, Ring, Trinket, Pants, Shoes, Shirt, Gloves, Cape, or a Hat
  weight: 15
  # Max durability that the item has. Fake durability system
  durability: 350
  # How good is this piece of equipment
  max_stars: 6
  # How many times can this piece of equipment be enhanced
  sockets: 3
  # How many sockets this piece of equipment can have
  equipment_modifiers:
	# What stat modifiers should the player have when wearing this item
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
  # What type of equipment is this item
  # Can be a Necklace, Earrings, Ring, Trinket, Pants, Shoes, Shirt, Gloves, Cape, or a Hat
  weight: 10
  # Max durability that the item has. Fake durability system
  durability: 375
  # How good is this piece of equipment
  max_stars: 6
  # How many times can this piece of equipment be enhanced
  sockets: 3
  # How many sockets this piece of equipment can have
  equipment_modifiers:
	# What stat modifiers should the player have when wearing this item
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