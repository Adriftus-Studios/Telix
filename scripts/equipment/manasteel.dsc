
custom_manasteel_sword:
  material: iron_sword
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Sword
  weight: '2'
  type: item
  fake_durability: 300
  damage: 6
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|air|air
      - custom_manasteel_ingot|air|air
      - custom_livingwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|air
      - air|custom_manasteel_ingot|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_manasteel_ingot
      - air|air|custom_manasteel_ingot
      - air|air|custom_livingwood_twig
custom_manasteel_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Pickaxe
  weight: '3'
  type: item
  fake_durability: 300
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
custom_manasteel_axe:
  material: iron_axe
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Axe
  weight: '3'
  type: item
  fake_durability: 300
  damage: 5
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|air
      - custom_manasteel_ingot|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|custom_manasteel_ingot
      - air|custom_livingwood_twig|custom_manasteel_ingot
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|air
      - custom_livingwood_twig|custom_manasteel_ingot|air
      - custom_livingwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|custom_manasteel_ingot
      - air|custom_manasteel_ingot|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_manasteel_shovel:
  material: iron_shovel
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Shovel
  weight: '1'
  type: item
  fake_durability: 300
  damage: 3
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|air|air
      - custom_livingwood_twig|air|air
      - custom_livingwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|air
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_manasteel_ingot
      - air|air|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_manasteel_hoe:
  material: iron_hoe
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Hoe
  weight: '2'
  type: item
  fake_durability: 300
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|air
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|custom_manasteel_ingot
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
    3:
      type: shaped
      recipe_id: custom_manasteel_hoe3
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|air
      - custom_livingwood_twig|air|air
      - custom_livingwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_manasteel_ingot|custom_manasteel_ingot
      - air|air|custom_livingwood_twig
      - air|air|custom_livingwood_twig
custom_manasteel_nugget:
  material: iron_nugget
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_manasteel_ingot
custom_manasteel_ingot:
  material: iron_ingot
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_manasteel_block
    3:
      type: altar
      output_quantity: 2
      input: custom_iron_ingot/3|custom_magic_powder/1|custom_diamond/1
      cook_time: 5m
custom_manasteel_block:
  material: iron_block
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
custom_manasteel_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 208
  armor: 2
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    food:
      max: 10
      min: 15
    thirst:
      max: 20
      min: 10
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_diamond_boots|custom_manasteel_ingot
      - custom_manasteel_ingot|air|custom_manasteel_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_manasteel_ingot|custom_diamond_boots|custom_manasteel_ingot
      - custom_manasteel_ingot|air|custom_manasteel_ingot
custom_manasteel_leggings:
  material: iron_leggings
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 240
  armor: 5
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    food:
      max: 10
      min: 15
    thirst:
      max: 20
      min: 10
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_diamond_leggings|custom_manasteel_ingot
      - custom_manasteel_ingot|air|custom_manasteel_ingot
custom_manasteel_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 256
  armor: 6
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    food:
      max: 10
      min: 15
    thirst:
      max: 20
      min: 10
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_diamond_chestplate|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
custom_manasteel_helmet:
  material: iron_helmet
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 176
  armor: 2
  equipment_rating: 5
  max_stars: 6
  sockets: 2
  equipment_modifiers:
    constitution:
      max: 10
      min: 1
    food:
      max: 10
      min: 15
    thirst:
      max: 20
      min: 10
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_diamond_helmet|custom_manasteel_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_diamond_helmet|custom_manasteel_ingot