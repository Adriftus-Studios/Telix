
custom_silver_sword:
  material: iron_sword
  display name: <&7>Silver sword
  weight: '1'
  type: item
  fake_durability: 175
  damage: 5
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|air|air
      - custom_silver_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|air
      - air|custom_silver_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_silver_ingot
      - air|air|custom_silver_ingot
      - air|air|custom_stick
custom_silver_pickaxe:
  material: iron_pickaxe
  display name: <&7>Silver pickaxe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 3
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_silver_axe:
  material: iron_axe
  display name: <&7>Silver axe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_silver_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|custom_silver_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_stick|custom_silver_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_silver_ingot|custom_stick
      - air|air|custom_stick
custom_silver_shovel:
  material: iron_shovel
  display name: <&7>Silver shovel
  weight: '1'
  type: item
  fake_durability: 175
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_silver_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_silver_hoe:
  material: iron_hoe
  display name: <&7>Silver hoe
  weight: '1'
  type: item
  fake_durability: 175
  damage: 2
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_silver_hoe3
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_silver_ingot|custom_silver_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_silver_nugget:
  material: iron_nugget
  display name: <&7>Silver nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_silver_ingot
custom_silver_ingot:
  material: brick
  display name: <&7>Silver ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_silver_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_silver_block
custom_silver_block:
  material: iron_block
  display name: <&7>Silver block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
custom_silver_ore:
  material: iron_ore
  display name: <&7>Silver ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 25
custom_silver_boots:
  material: iron_boots
  lore:
  display name: <&7>Silver boots
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_iron_boots|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_silver_ingot|custom_iron_boots|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
custom_silver_leggings:
  material: iron_leggings
  display name: <&7>Silver leggings
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_leggings|custom_silver_ingot
      - custom_silver_ingot|air|custom_silver_ingot
custom_silver_chestplate:
  material: iron_chestplate
  display name: <&7>Silver chestplate
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_iron_chestplate|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
custom_silver_helmet:
  material: iron_helmet
  display name: <&7>Silver helmet
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
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_helmet|custom_silver_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_iron_helmet|custom_silver_ingot