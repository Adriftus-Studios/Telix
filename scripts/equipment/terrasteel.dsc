
custom_terrasteel_sword:
  material: iron_sword
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Sword
  weight: '2'
  type: item
  fake_durability: 2300
  damage: 6
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|air|air
      - custom_terrasteel_ingot|air|air
      - custom_livingwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|air
      - air|custom_terrasteel_ingot|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_terrasteel_ingot
      - air|air|custom_terrasteel_ingot
      - air|air|custom_livingwood_twig
custom_terrasteel_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Pickaxe
  weight: '3'
  type: item
  fake_durability: 2300
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
custom_terrasteel_axe:
  material: iron_axe
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Axe
  weight: '3'
  type: item
  fake_durability: 2300
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_terrasteel_ingot|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_livingwood_twig|custom_terrasteel_ingot
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_livingwood_twig|custom_terrasteel_ingot|air
      - custom_livingwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_terrasteel_ingot|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_terrasteel_shovel:
  material: iron_shovel
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Shovel
  weight: '1'
  type: item
  fake_durability: 2300
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|air|air
      - custom_livingwood_twig|air|air
      - custom_livingwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|air
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_terrasteel_ingot
      - air|air|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_terrasteel_hoe:
  material: iron_hoe
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Hoe
  weight: '2'
  type: item
  fake_durability: 2300
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      recipe_id: custom_terrasteel_hoe3
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|air
      - custom_livingwood_twig|air|air
      - custom_livingwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|air|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_terrasteel_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 442
  armor: 3
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    health:
      max: 5
      min: 1
    melee_damage:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_manasteel_boots|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_terrasteel_ingot|custom_manasteel_boots|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
custom_terrasteel_leggings:
  material: iron_leggings
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 510
  armor: 6
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    health:
      max: 5
      min: 1
    melee_damage:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_manasteel_leggings|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
custom_terrasteel_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 544
  armor: 8
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    health:
      max: 5
      min: 1
    melee_damage:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_manasteel_chestplate|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_terrasteel_helmet:
  material: iron_helmet
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 374
  armor: 4
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    health:
      max: 5
      min: 1
    melee_damage:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_manasteel_helmet|custom_terrasteel_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_manasteel_helmet|custom_terrasteel_ingot