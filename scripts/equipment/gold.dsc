
custom_golden_apple:
  material: golden_apple
  recipe_book_category: equipment.gold
  display name: <&7>Golden Apple
  weight: '1'
  type: item
custom_golden_carrot:
  material: golden_carrot
  recipe_book_category: equipment.gold
  display name: <&7>Golden Carrot
  weight: '1'
  type: item
custom_enchanted_golden_apple:
  material: enchanted_golden_apple
  lore:
  recipe_book_category: equipment.gold
  display name: <&7>Enchanted Golden Apple
  weight: '1'
  type: item
custom_golden_horse_armor:
  material: golden_horse_armor
  recipe_book_category: equipment.gold
  display name: <&7>Golden Horse Armor
  weight: '1'
  type: item
custom_golden_sword:
  material: golden_sword
  recipe_book_category: equipment.gold
  display name: <&7>Golden Sword
  weight: '1'
  type: item
  fake_durability: 32
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|air|air
      - custom_gold_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|air
      - air|custom_gold_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_gold_ingot
      - air|air|custom_gold_ingot
      - air|air|custom_stick
custom_golden_pickaxe:
  material: golden_pickaxe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Pickaxe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_golden_axe:
  material: golden_axe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Axe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|air
      - custom_gold_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|custom_gold_ingot
      - air|custom_stick|custom_gold_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|air
      - custom_stick|custom_gold_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|custom_gold_ingot
      - air|custom_gold_ingot|custom_stick
      - air|air|custom_stick
custom_golden_shovel:
  material: golden_shovel
  recipe_book_category: equipment.gold
  display name: <&7>Golden Shovel
  weight: '1'
  type: item
  fake_durability: 32
  damage: 1
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_gold_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_golden_hoe:
  material: golden_hoe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Hoe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 1
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|custom_gold_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_gold_hoe3
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_gold_ingot|custom_gold_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_golden_boots:
  material: golden_boots
  lore:
  recipe_book_category: equipment.gold
  display name: <&7>Golden Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 429
  armor: 3
  equipment_rating: 5
  max_stars: 2
  sockets: 3
  equipment_modifiers:
    speed:
      max: 15
      min: 1
    power:
      max: 20
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_iron_boots|custom_gold_ingot
      - custom_gold_ingot|air|custom_gold_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_gold_ingot|custom_iron_boots|custom_gold_ingot
      - custom_gold_ingot|air|custom_gold_ingot
custom_golden_leggings:
  material: golden_leggings
  recipe_book_category: equipment.gold
  display name: <&7>Golden Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 495
  armor: 6
  equipment_rating: 5
  max_stars: 2
  sockets: 3
  equipment_modifiers:
    speed:
      max: 15
      min: 1
    power:
      max: 20
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_iron_leggings|custom_gold_ingot
      - custom_gold_ingot|air|custom_gold_ingot
custom_golden_chestplate:
  material: golden_chestplate
  recipe_book_category: equipment.gold
  display name: <&7>Golden Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 528
  armor: 8
  equipment_rating: 5
  max_stars: 2
  sockets: 3
  equipment_modifiers:
    speed:
      max: 15
      min: 1
    power:
      max: 20
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_iron_chestplate|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
custom_golden_helmet:
  material: golden_helmet
  recipe_book_category: equipment.gold
  display name: <&7>Golden Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 363
  armor: 3
  equipment_rating: 5
  max_stars: 2
  sockets: 3
  equipment_modifiers:
    speed:
      max: 15
      min: 1
    power:
      max: 20
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_iron_helmet|custom_gold_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_iron_helmet|custom_gold_ingot