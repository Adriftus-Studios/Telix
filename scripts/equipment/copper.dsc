
custom_copper_sword:
  material: iron_sword
  recipe_book_category: equipment.copper
  display name: <&7>Copper Sword
  weight: '1'
  type: item
  fake_durability: 175
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|air|air
      - custom_copper_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_copper_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_copper_ingot
      - air|air|custom_stick
custom_copper_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.copper
  display name: <&7>Copper Pickaxe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_copper_axe:
  material: iron_axe
  recipe_book_category: equipment.copper
  display name: <&7>Copper Axe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_copper_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|custom_copper_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|custom_copper_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_copper_ingot|custom_stick
      - air|air|custom_stick
custom_copper_shovel:
  material: iron_shovel
  recipe_book_category: equipment.copper
  display name: <&7>Copper Shovel
  weight: '1'
  type: item
  fake_durability: 175
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_hoe:
  material: iron_hoe
  recipe_book_category: equipment.copper
  display name: <&7>Copper Hoe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_hoe3
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.copper
  display name: <&7>Copper Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 78
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 5
      min: 1
    constitution:
      max: 3
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_leggings:
  material: iron_leggings
  recipe_book_category: equipment.copper
  display name: <&7>Copper Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 90
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 5
      min: 1
    constitution:
      max: 3
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_leggings|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.copper
  display name: <&7>Copper Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 96
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 5
      min: 1
    constitution:
      max: 3
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_leather_chestplate|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
custom_copper_helmet:
  material: iron_helmet
  recipe_book_category: equipment.copper
  display name: <&7>Copper Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 66
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      max: 5
      min: 1
    constitution:
      max: 3
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot