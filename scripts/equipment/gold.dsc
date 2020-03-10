
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
custom_gold_horse_armor:
  material: golden_horse_armor
  recipe_book_category: equipment.gold
  display name: <&7>Golden Horse Armor
  weight: '1'
  type: item
custom_gold_sword:
  material: golden_sword
  recipe_book_category: equipment.gold
  display name: <&7>Golden Sword
  weight: '1'
  type: item
  fake_durability: 32
  damage: 4
  attack_speed: 4
  recipes:
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
custom_gold_pickaxe:
  material: golden_pickaxe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Pickaxe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_gold_axe:
  material: golden_axe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Axe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 3
  attack_speed: 4
  recipes:
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
custom_gold_shovel:
  material: golden_shovel
  recipe_book_category: equipment.gold
  display name: <&7>Golden Shovel
  weight: '1'
  type: item
  fake_durability: 32
  damage: 1
  attack_speed: 4
  recipes:
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
custom_gold_hoe:
  material: golden_hoe
  recipe_book_category: equipment.gold
  display name: <&7>Golden Hoe
  weight: '1'
  type: item
  fake_durability: 32
  damage: 1
  attack_speed: 4
  recipes:
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
custom_gold_nugget:
  material: gold_nugget
  recipe_book_category: equipment.gold
  display name: <&7>Gold Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_gold_ingot
custom_gold_ingot:
  material: gold_ingot
  recipe_book_category: equipment.gold
  display name: <&7>Golden Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_gold_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_gold_block
custom_gold_block:
  material: gold_block
  recipe_book_category: equipment.gold
  display name: <&7>Golden Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      hide_in_recipebook: true
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
custom_gold_ore:
  material: gold_ore
  recipe_book_category: equipment.gold
  display name: <&7>Golden Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 54
custom_gold_boots:
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
  recipes:
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
custom_gold_leggings:
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_iron_leggings|custom_gold_ingot
      - custom_gold_ingot|air|custom_gold_ingot
custom_gold_chestplate:
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_iron_chestplate|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
custom_gold_helmet:
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
  recipes:
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