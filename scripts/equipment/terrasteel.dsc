
custom_terrasteel_sword:
  material: iron_sword
  display name: <&7>Terrasteel sword
  weight: '2'
  type: item
  fake_durability: 250
  damage: 6
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|air|air
      - custom_terrasteel_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|air
      - air|custom_terrasteel_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_terrasteel_ingot
      - air|air|custom_terrasteel_ingot
      - air|air|custom_stick
custom_terrasteel_pickaxe:
  material: iron_pickaxe
  display name: <&7>Terrasteel pickaxe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_terrasteel_axe:
  material: iron_axe
  display name: <&7>Terrasteel axe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 5
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_terrasteel_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_stick|custom_terrasteel_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_stick|custom_terrasteel_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_terrasteel_ingot|custom_stick
      - air|air|custom_stick
custom_terrasteel_shovel:
  material: iron_shovel
  display name: <&7>Terrasteel shovel
  weight: '1'
  type: item
  fake_durability: 250
  damage: 3
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_terrasteel_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_terrasteel_hoe:
  material: iron_hoe
  display name: <&7>Terrasteel hoe
  weight: '2'
  type: item
  fake_durability: 250
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_terrasteel_hoe3
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_terrasteel_nugget:
  material: iron_nugget
  display name: <&7>Terrasteel nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_terrasteel_ingot
custom_terrasteel_ingot:
  material: brick
  display name: <&7>Terrasteel ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_terrasteel_block
custom_terrasteel_block:
  material: iron_block
  display name: <&7>Terrasteel block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_terrasteel_boots:
  material: iron_boots
  lore:
  display name: <&7>Terrasteel boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 195
  armor: 2
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    melee_damage:
      max: 5
      min: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_iron_boots|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_terrasteel_ingot|custom_iron_boots|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
custom_terrasteel_leggings:
  material: iron_leggings
  display name: <&7>Terrasteel leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 225
  armor: 5
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    melee_damage:
      max: 5
      min: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_iron_leggings|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
custom_terrasteel_chestplate:
  material: iron_chestplate
  display name: <&7>Terrasteel chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 240
  armor: 6
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    melee_damage:
      max: 5
      min: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_iron_chestplate|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_terrasteel_helmet:
  material: iron_helmet
  display name: <&7>Terrasteel helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 165
  armor: 2
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    melee_damage:
      max: 5
      min: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_iron_helmet|custom_terrasteel_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_iron_helmet|custom_terrasteel_ingot