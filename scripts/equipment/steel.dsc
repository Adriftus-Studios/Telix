
custom_steel_sword:
  material: iron_sword
  recipe_book_category: equipment.steel
  display name: <&7>Steel Sword
  weight: '2'
  type: item
  fake_durability: 500
  damage: 6
  attack_speed: 4
  custom_recipes:
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
  recipe_book_category: equipment.steel
  display name: <&7>Steel Pickaxe
  weight: '3'
  type: item
  fake_durability: 500
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_steel_axe:
  material: iron_axe
  recipe_book_category: equipment.steel
  display name: <&7>Steel Axe
  weight: '3'
  type: item
  fake_durability: 500
  damage: 5
  attack_speed: 4
  custom_recipes:
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
  recipe_book_category: equipment.steel
  display name: <&7>Steel Shovel
  weight: '1'
  type: item
  fake_durability: 500
  damage: 3
  attack_speed: 4
  custom_recipes:
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
  recipe_book_category: equipment.steel
  display name: <&7>Steel Hoe
  weight: '2'
  type: item
  fake_durability: 500
  damage: 2
  attack_speed: 4
  custom_recipes:
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
custom_steel_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.steel
  display name: <&7>Steel Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 325
  armor: 2
  equipment_rating: 5
  max_stars: 7
  sockets: 1
  equipment_modifiers:
    health:
      max: 4
      min: 0
    food:
      max: 10
      min: 1
  custom_recipes:
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
  recipe_book_category: equipment.steel
  display name: <&7>Steel Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 375
  armor: 5
  equipment_rating: 5
  max_stars: 7
  sockets: 1
  equipment_modifiers:
    health:
      max: 4
      min: 0
    food:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_bronze_leggings|custom_steel_ingot
      - custom_steel_ingot|air|custom_steel_ingot
custom_steel_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.steel
  display name: <&7>Steel Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 400
  armor: 6
  equipment_rating: 5
  max_stars: 7
  sockets: 1
  equipment_modifiers:
    health:
      max: 4
      min: 0
    food:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_steel_ingot|custom_bronze_chestplate|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
custom_steel_helmet:
  material: iron_helmet
  recipe_book_category: equipment.steel
  display name: <&7>Steel Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 275
  armor: 2
  equipment_rating: 5
  max_stars: 7
  sockets: 1
  equipment_modifiers:
    health:
      max: 4
      min: 0
    food:
      max: 10
      min: 1
  custom_recipes:
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