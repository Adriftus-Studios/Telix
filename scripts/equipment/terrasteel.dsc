
custom_terrasteel_sword:
  material: iron_sword
  display name: <&7>Terrasteel Sword
  weight: '2'
  type: item
  fake_durability: 2300
  damage: 6
  attack_speed: 4
  recipes:
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
  display name: <&7>Terrasteel Pickaxe
  weight: '3'
  type: item
  fake_durability: 2300
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - air|custom_livingwood_twig|air
      - air|custom_livingwood_twig|air
custom_terrasteel_axe:
  material: iron_axe
  display name: <&7>Terrasteel Axe
  weight: '3'
  type: item
  fake_durability: 2300
  damage: 5
  attack_speed: 4
  recipes:
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
  display name: <&7>Terrasteel Shovel
  weight: '1'
  type: item
  fake_durability: 2300
  damage: 3
  attack_speed: 4
  recipes:
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
  display name: <&7>Terrasteel Hoe
  weight: '2'
  type: item
  fake_durability: 2300
  damage: 2
  attack_speed: 4
  recipes:
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
custom_terrasteel_nugget:
  material: iron_nugget
  display name: <&7>Terrasteel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_terrasteel_ingot
    2:
      type: altar
      output_quantity: 2
      input: custom_manasteel_block/2|custom_magic_powder/5|custom_rune_air/2|custom_rune_earth/3
      cook_time: 15m
custom_terrasteel_ingot:
  material: iron_ingot
  display name: <&7>Terrasteel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_terrasteel_block
custom_terrasteel_block:
  material: iron_block
  display name: <&7>Terrasteel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_terrasteel_boots:
  material: iron_boots
  lore:
  display name: <&7>Terrasteel Boots
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
  recipes:
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
  display name: <&7>Terrasteel Leggings
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_manasteel_leggings|custom_terrasteel_ingot
      - custom_terrasteel_ingot|air|custom_terrasteel_ingot
custom_terrasteel_chestplate:
  material: iron_chestplate
  display name: <&7>Terrasteel Chestplate
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_ingot|custom_manasteel_chestplate|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_terrasteel_helmet:
  material: iron_helmet
  display name: <&7>Terrasteel Helmet
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
  recipes:
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