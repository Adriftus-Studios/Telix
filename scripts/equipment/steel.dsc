
custom_steel_sword:
  material: iron_sword
  display name: <&7>Steel sword
  weight: '2'
  type: item
  fake_durability: 500
  damage: 6
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|air|air
      - custom_steel_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|air
      - air|custom_steel_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_steel_ingot
      - air|air|custom_steel_ingot
      - air|air|custom_stick
custom_steel_pickaxe:
  material: iron_pickaxe
  display name: <&7>Steel pickaxe
  weight: '3'
  type: item
  fake_durability: 500
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_steel_axe:
  material: iron_axe
  display name: <&7>Steel axe
  weight: '3'
  type: item
  fake_durability: 500
  damage: 5
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|air
      - custom_steel_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|custom_steel_ingot
      - air|custom_stick|custom_steel_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|air
      - custom_stick|custom_steel_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|custom_steel_ingot
      - air|custom_steel_ingot|custom_stick
      - air|air|custom_stick
custom_steel_shovel:
  material: iron_shovel
  display name: <&7>Steel shovel
  weight: '1'
  type: item
  fake_durability: 500
  damage: 3
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_steel_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_steel_hoe:
  material: iron_hoe
  display name: <&7>Steel hoe
  weight: '2'
  type: item
  fake_durability: 500
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|custom_steel_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_steel_hoe3
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_steel_ingot|custom_steel_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_steel_nugget:
  material: iron_nugget
  display name: <&7>Steel nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_steel_ingot
custom_steel_ingot:
  material: iron_ingot
  display name: <&7>Steel ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 4m
      input: custom_coal/6|custom_iron_ingot/2
      output_quantity: 1
      type: smeltery
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_steel_block
custom_steel_block:
  material: iron_block
  display name: <&7>Steel block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
custom_steel_boots:
  material: iron_boots
  lore:
  display name: <&7>Steel boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 325
  armor: 2
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_bronze_boots|custom_steel_ingot
      - custom_steel_ingot|air|custom_steel_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_steel_ingot|custom_bronze_boots|custom_steel_ingot
      - custom_steel_ingot|air|custom_steel_ingot
custom_steel_leggings:
  material: iron_leggings
  display name: <&7>Steel leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 375
  armor: 5
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_bronze_leggings|custom_steel_ingot
      - custom_steel_ingot|air|custom_steel_ingot
custom_steel_chestplate:
  material: iron_chestplate
  display name: <&7>Steel chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 400
  armor: 6
  max_stars: 5
  sockets: 1
  equipment_modifiers:
    health:
      max: 20
      min: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_bronze_chestplate|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
custom_steel_helmet:
  material: iron_helmet
  display name: <&7>Steel helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 275
  armor: 2
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_bronze_helmet|custom_steel_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_bronze_helmet|custom_steel_ingot