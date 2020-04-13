
custom_warpmetal_sword:
  material: iron_sword
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Sword
  weight: '2'
  type: item
  fake_durability: 1370
  damage: 6
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|air|air
      - custom_warpmetal_ingot|air|air
      - custom_dreamwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|air
      - air|custom_warpmetal_ingot|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_warpmetal_ingot
      - air|air|custom_warpmetal_ingot
      - air|air|custom_dreamwood_twig
custom_warpmetal_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Pickaxe
  weight: '3'
  type: item
  fake_durability: 1370
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
custom_warpmetal_axe:
  material: iron_axe
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Axe
  weight: '3'
  type: item
  fake_durability: 1370
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|air
      - custom_warpmetal_ingot|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|custom_warpmetal_ingot
      - air|custom_dreamwood_twig|custom_warpmetal_ingot
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|air
      - custom_dreamwood_twig|custom_warpmetal_ingot|air
      - custom_dreamwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|custom_warpmetal_ingot
      - air|custom_warpmetal_ingot|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_warpmetal_shovel:
  material: iron_shovel
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Shovel
  weight: '1'
  type: item
  fake_durability: 1370
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|air|air
      - custom_dreamwood_twig|air|air
      - custom_dreamwood_twig|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|air
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_warpmetal_ingot
      - air|air|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_warpmetal_hoe:
  material: iron_hoe
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Hoe
  weight: '2'
  type: item
  fake_durability: 1370
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|air
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|custom_warpmetal_ingot
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
    3:
      type: shaped
      recipe_id: custom_warpmetal_hoe3
      output_quantity: 1
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|air
      - custom_dreamwood_twig|air|air
      - custom_dreamwood_twig|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_warpmetal_ingot|custom_warpmetal_ingot
      - air|air|custom_dreamwood_twig
      - air|air|custom_dreamwood_twig
custom_warpmetal_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 221
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
      - custom_warpmetal_ingot|custom_manasteel_boots|custom_warpmetal_ingot
      - custom_warpmetal_ingot|air|custom_warpmetal_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_warpmetal_ingot|custom_manasteel_boots|custom_warpmetal_ingot
      - custom_warpmetal_ingot|air|custom_warpmetal_ingot
custom_boots_of_the_voidwalker:
  material: diamond_boots
  lore:
  recipe_book_category: equipment.warpmetal
  display name: <&5>Boots of the VoidWalker
  category: shoes
  weight: '17'
  type: item
  fake_durability: 760
  armor: 4
  equipment_rating: 5
  max_stars: 14
  sockets: 3
  equipment_modifiers:
    speed:
      max: 15
      min: 10
    melee_damage:
      max: 2
      min: 1
  custom_recipes:
    1:
      type: altar
      tier: 5
      output_quantity: 1
      input: custom_warped_shard/8|custom_warpmetal_ingot/2|custom_wrath_shard/1
      cook_time: 20m
custom_warpmetal_leggings:
  material: iron_leggings
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 255
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
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_manasteel_leggings|custom_warpmetal_ingot
      - custom_warpmetal_ingot|air|custom_warpmetal_ingot
custom_warpmetal_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 272
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
      - custom_warpmetal_ingot|custom_manasteel_chestplate|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
custom_warpmetal_helmet:
  material: iron_helmet
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 187
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
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_manasteel_helmet|custom_warpmetal_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_manasteel_helmet|custom_warpmetal_ingot