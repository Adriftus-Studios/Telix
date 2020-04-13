
custom_elementium_sword:
  material: iron_sword
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Sword
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
      - custom_elementium_ingot|air|air
      - custom_elementium_ingot|air|air
      - custom_dreamwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|air
      - air|custom_elementium_ingot|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_elementium_ingot
      - air|air|custom_elementium_ingot
      - air|air|custom_dreamwood_twig
custom_elementium_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Pickaxe
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
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
custom_elementium_axe:
  material: iron_axe
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Axe
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
      - custom_elementium_ingot|custom_elementium_ingot|air
      - custom_elementium_ingot|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|custom_elementium_ingot
      - air|custom_dreamwood_twig|custom_elementium_ingot
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_elementium_ingot|custom_elementium_ingot|air
      - custom_dreamwood_twig|custom_elementium_ingot|air
      - custom_dreamwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|custom_elementium_ingot
      - air|custom_elementium_ingot|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_elementium_shovel:
  material: iron_shovel
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Shovel
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
      - custom_elementium_ingot|air|air
      - custom_dreamwood_twig|air|air
      - custom_dreamwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|air
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_elementium_ingot
      - air|air|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_elementium_hoe:
  material: iron_hoe
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Hoe
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
      - custom_elementium_ingot|custom_elementium_ingot|air
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|custom_elementium_ingot
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_elementium_ingot|custom_elementium_ingot|air
      - custom_dreamwood_twig|air|air
      - custom_dreamwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_elementium_ingot|custom_elementium_ingot
      - air|air|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_elementium_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Boots
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
      - custom_elementium_ingot|custom_terrasteel_boots|custom_elementium_ingot
      - custom_elementium_ingot|air|custom_elementium_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_elementium_ingot|custom_terrasteel_boots|custom_elementium_ingot
      - custom_elementium_ingot|air|custom_elementium_ingot
custom_elementium_leggings:
  material: iron_leggings
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Leggings
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
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_terrasteel_leggings|custom_elementium_ingot
      - custom_elementium_ingot|air|custom_elementium_ingot
custom_elementium_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Chestplate
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
      - custom_elementium_ingot|custom_terrasteel_chestplate|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
custom_elementium_helmet:
  material: iron_helmet
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Helmet
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
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_terrasteel_helmet|custom_elementium_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_terrasteel_helmet|custom_elementium_ingot