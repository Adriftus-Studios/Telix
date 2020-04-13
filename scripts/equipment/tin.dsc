
custom_tin_sword:
  material: iron_sword
  recipe_book_category: equipment.tin
  display name: <&7>Tin Sword
  weight: '2'
  type: item
  fake_durability: 200
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|air|air
      - custom_tin_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|air
      - air|custom_tin_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_tin_ingot
      - air|air|custom_tin_ingot
      - air|air|custom_stick
custom_tin_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.tin
  display name: <&7>Tin Pickaxe
  weight: '3'
  type: item
  fake_durability: 200
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_tin_axe:
  material: iron_axe
  recipe_book_category: equipment.tin
  display name: <&7>Tin Axe
  weight: '3'
  type: item
  fake_durability: 200
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_tin_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|custom_tin_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_stick|custom_tin_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_tin_ingot|custom_stick
      - air|air|custom_stick
custom_tin_shovel:
  material: iron_shovel
  recipe_book_category: equipment.tin
  display name: <&7>Tin Shovel
  weight: '1'
  type: item
  fake_durability: 200
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_tin_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_tin_hoe:
  material: iron_hoe
  recipe_book_category: equipment.tin
  display name: <&7>Tin Hoe
  weight: '2'
  type: item
  fake_durability: 200
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_tin_hoe3
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_tin_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.tin
  display name: <&7>Tin Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 104
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    food:
      max: 10
      min: 1
    thirst:
      max: 5
      min: 1
    constitution:
      max: 2
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_leather_boots|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_tin_ingot|custom_leather_boots|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
custom_tin_leggings:
  material: iron_leggings
  recipe_book_category: equipment.tin
  display name: <&7>Tin Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 120
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    food:
      max: 10
      min: 1
    thirst:
      max: 5
      min: 1
    constitution:
      max: 2
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_leggings|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
custom_tin_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.tin
  display name: <&7>Tin Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 128
  armor: 4
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    food:
      max: 10
      min: 1
    thirst:
      max: 5
      min: 1
    constitution:
      max: 2
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_leather_chestplate|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
custom_tin_helmet:
  material: iron_helmet
  recipe_book_category: equipment.tin
  display name: <&7>Tin Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 88
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    food:
      max: 10
      min: 1
    thirst:
      max: 5
      min: 1
    constitution:
      max: 2
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_helmet|custom_tin_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_helmet|custom_tin_ingot