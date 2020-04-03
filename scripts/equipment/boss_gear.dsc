# Boss weakenesses:
# Water > Fire
# Fire > Air
# Air > Earth
# Earth > Ender
# Ender > Water

custom_boss_dagon_helmet:
  type: item
  material: diamond_helmet
  category: hat
  # What type of equipment is this item
  # Can be a Necklace, Earrings, Ring, Trinket, Pants, Shoes, Shirt, Gloves, Cape, or a Hat
  weight: 15
  equipment_rating: 5
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