
custom_bronze_sword:
  material: iron_sword
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Sword
  weight: '2'
  type: item
  fake_durability: 250
  damage: 6
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|air|air
      - custom_bronze_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|air
      - air|custom_bronze_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_bronze_ingot
      - air|air|custom_bronze_ingot
      - air|air|custom_stick
custom_bronze_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Pickaxe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_bronze_axe:
  material: iron_axe
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Axe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|air
      - custom_bronze_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|custom_bronze_ingot
      - air|custom_stick|custom_bronze_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|air
      - custom_stick|custom_bronze_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|custom_bronze_ingot
      - air|custom_bronze_ingot|custom_stick
      - air|air|custom_stick
custom_bronze_shovel:
  material: iron_shovel
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Shovel
  weight: '1'
  type: item
  fake_durability: 250
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_bronze_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_bronze_hoe:
  material: iron_hoe
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Hoe
  weight: '2'
  type: item
  fake_durability: 250
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|custom_bronze_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_bronze_hoe3
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_bronze_ingot|custom_bronze_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_bronze_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Boots
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
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_iron_boots|custom_bronze_ingot
      - custom_bronze_ingot|air|custom_bronze_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_bronze_ingot|custom_iron_boots|custom_bronze_ingot
      - custom_bronze_ingot|air|custom_bronze_ingot
custom_bronze_leggings:
  material: iron_leggings
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Leggings
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
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_iron_leggings|custom_bronze_ingot
      - custom_bronze_ingot|air|custom_bronze_ingot
custom_bronze_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Chestplate
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
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_iron_chestplate|custom_bronze_ingot
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
custom_bronze_helmet:
  material: iron_helmet
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Helmet
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
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_iron_helmet|custom_bronze_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_iron_helmet|custom_bronze_ingot