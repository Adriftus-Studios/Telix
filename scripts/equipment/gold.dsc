
custom_golden_apple:
  material: golden_apple
  display name: <&7>Golden apple
  weight: '1'
  type: item
custom_golden_carrot:
  material: golden_carrot
  display name: <&7>Golden carrot
  weight: '1'
  type: item
custom_enchanted_golden_apple:
  material: enchanted_golden_apple
  lore:
  display name: <&7>Enchanted_golden_apple
  weight: '1'
  type: item
custom_gold_horse_armor:
  material: golden_horse_armor
  display name: <&7>Golden horse armor
  weight: '1'
  type: item
custom_gold_sword:
  material: golden_sword
  display name: <&7>Golden sword
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
  display name: <&7>Golden pickaxe
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
  display name: <&7>Golden axe
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
  display name: <&7>Golden shovel
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
  display name: <&7>Golden hoe
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
  display name: <&7>Gold nugget
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
  display name: <&7>Golden ingot
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
  display name: <&7>Golden block
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
  display name: <&7>Golden ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 20
custom_gold_boots:
  material: golden_boots
  lore:
  display name: <&7>Golden boots
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
  display name: <&7>Golden leggings
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
  display name: <&7>Golden chestplate
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
  display name: <&7>Golden helmet
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