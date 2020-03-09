
custom_elementium_sword:
  material: iron_sword
  display name: <&7>Elementium Sword
  weight: '2'
  type: item
  fake_durability: 250
  damage: 6
  attack_speed: 4
  recipes:
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
  display name: <&7>Elementium Pickaxe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - air|custom_dreamwood_twig|air
      - air|custom_dreamwood_twig|air
custom_elementium_axe:
  material: iron_axe
  display name: <&7>Elementium Axe
  weight: '3'
  type: item
  fake_durability: 250
  damage: 5
  attack_speed: 4
  recipes:
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
  display name: <&7>Elementium Shovel
  weight: '1'
  type: item
  fake_durability: 250
  damage: 3
  attack_speed: 4
  recipes:
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
  display name: <&7>Elementium Hoe
  weight: '2'
  type: item
  fake_durability: 250
  damage: 2
  attack_speed: 4
  recipes:
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
custom_elementium_nugget:
  material: iron_nugget
  display name: <&7>Elementium Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_elementium_ingot
custom_elementium_ingot:
  material: iron_ingot
  display name: <&7>Elementium Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_elementium_block
    3:
      type: altar
      output_quantity: 1
      input: custom_terrasteel_ingot/2|custom_fire_rune/1|custom_earth_rune/1|custom_water_rune/1|custom_air_rune/1|custom_ender_rune/1
      cook_time: 10m
custom_elementium_block:
  material: iron_block
  display name: <&7>Elementium Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
custom_elementium_boots:
  material: iron_boots
  lore:
  display name: <&7>Elementium Boots
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
  recipes:
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
  display name: <&7>Elementium Leggings
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_terrasteel_leggings|custom_elementium_ingot
      - custom_elementium_ingot|air|custom_elementium_ingot
custom_elementium_chestplate:
  material: iron_chestplate
  display name: <&7>Elementium Chestplate
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_elementium_ingot|custom_terrasteel_chestplate|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
custom_elementium_helmet:
  material: iron_helmet
  display name: <&7>Elementium Helmet
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
  recipes:
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