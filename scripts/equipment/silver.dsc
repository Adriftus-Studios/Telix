
custom_silver_sword:
  material: iron_sword
  recipe_book_category: equipment.silver
  display name: <&7>Silver Sword
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
      - custom_silver_ingot|air|air
      - custom_silver_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|air
      - air|custom_silver_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_silver_ingot
      - air|air|custom_silver_ingot
      - air|air|custom_stick
custom_silver_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.silver
  display name: <&7>Silver Pickaxe
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
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_silver_axe:
  material: iron_axe
  recipe_book_category: equipment.silver
  display name: <&7>Silver Axe
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
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_silver_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|custom_silver_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_stick|custom_silver_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_silver_ingot|custom_stick
      - air|air|custom_stick
custom_silver_shovel:
  material: iron_shovel
  recipe_book_category: equipment.silver
  display name: <&7>Silver Shovel
  weight: '1'
  type: item
  fake_durability: 200
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_silver_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_silver_hoe:
  material: iron_hoe
  recipe_book_category: equipment.silver
  display name: <&7>Silver Hoe
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
      - custom_silver_ingot|custom_silver_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_silver_hoe3
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_silver_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.silver
  display name: <&7>Silver Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 143
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 8
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_iron_boots|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_silver_ingot|custom_iron_boots|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
custom_silver_leggings:
  material: iron_leggings
  recipe_book_category: equipment.silver
  display name: <&7>Silver Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 165
  armor: 4
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 8
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_leggings|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
custom_silver_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.silver
  display name: <&7>Silver Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 176
  armor: 4
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 8
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_iron_chestplate|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
custom_silver_helmet:
  material: iron_helmet
  recipe_book_category: equipment.silver
  display name: <&7>Silver Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 121
  armor: 2
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 8
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_helmet|custom_silver_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_helmet|custom_silver_ingot