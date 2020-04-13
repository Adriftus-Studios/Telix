custom_diamond_horse_armor:
  material: diamond_horse_armor
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Horse Armor
  weight: '1'
  type: item
custom_diamond_sword:
  material: diamond_sword
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Sword
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 7
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|air|air
      - custom_diamond|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|air
      - air|custom_diamond|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_diamond
      - air|air|custom_diamond
      - air|air|custom_stick
custom_diamond_pickaxe:
  material: diamond_pickaxe
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Pickaxe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - air|custom_stick|air
      - air|custom_stick|air
custom_diamond_axe:
  material: diamond_axe
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Axe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 6
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_diamond|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_stick|custom_diamond
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_stick|custom_diamond|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_diamond|custom_stick
      - air|air|custom_stick
custom_diamond_shovel:
  material: diamond_shovel
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Shovel
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_diamond
      - air|air|custom_stick
      - air|air|custom_stick
custom_diamond_hoe:
  material: diamond_hoe
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Hoe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_diamond_hoe3
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|air|custom_stick
      - air|air|custom_stick
custom_diamond_boots:
  material: diamond_boots
  lore:
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 429
  armor: 3
  equipment_rating: 5
  max_stars: 6
  sockets: 1
  equipment_modifiers:
    health:
      max: 5
      min: 1
    power:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_steel_boots|custom_diamond
      - custom_diamond|air|custom_diamond
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_diamond|custom_steel_boots|custom_diamond
      - custom_diamond|air|custom_diamond
custom_diamond_leggings:
  material: diamond_leggings
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 495
  armor: 6
  equipment_rating: 5
  max_stars: 6
  sockets: 1
  equipment_modifiers:
    health:
      max: 5
      min: 1
    power:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_steel_leggings|custom_diamond
      - custom_diamond|air|custom_diamond
custom_diamond_chestplate:
  material: diamond_chestplate
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 528
  armor: 8
  equipment_rating: 5
  max_stars: 6
  sockets: 1
  equipment_modifiers:
    health:
      max: 5
      min: 1
    power:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_steel_chestplate|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
custom_diamond_helmet:
  material: diamond_helmet
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 363
  armor: 3
  equipment_rating: 5
  max_stars: 6
  sockets: 1
  equipment_modifiers:
    health:
      max: 5
      min: 1
    power:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_steel_helmet|custom_diamond
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_steel_helmet|custom_diamond