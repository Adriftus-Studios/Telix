
custom_obsidian_sword:
  material: iron_sword
  display name: <&7>Obsidian sword
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
      - custom_obsidian_ingot|air|air
      - custom_obsidian_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|air
      - air|custom_obsidian_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_obsidian_ingot
      - air|air|custom_obsidian_ingot
      - air|air|custom_stick
custom_obsidian_pickaxe:
  material: iron_pickaxe
  display name: <&7>Obsidian pickaxe
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
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_obsidian_axe:
  material: iron_axe
  display name: <&7>Obsidian axe
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
      - custom_obsidian_ingot|custom_obsidian_ingot|air
      - custom_obsidian_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|custom_obsidian_ingot
      - air|custom_stick|custom_obsidian_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_obsidian_ingot|custom_obsidian_ingot|air
      - custom_stick|custom_obsidian_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|custom_obsidian_ingot
      - air|custom_obsidian_ingot|custom_stick
      - air|air|custom_stick
custom_obsidian_shovel:
  material: iron_shovel
  display name: <&7>Obsidian shovel
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
      - custom_obsidian_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_obsidian_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_obsidian_hoe:
  material: iron_hoe
  display name: <&7>Obsidian hoe
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
      - custom_obsidian_ingot|custom_obsidian_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|custom_obsidian_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_obsidian_hoe3
      output_quantity: 1
      input:
      - custom_obsidian_ingot|custom_obsidian_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_obsidian_ingot|custom_obsidian_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_obsidian_nugget:
  material: iron_nugget
  display name: <&7>Obsidian nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_obsidian_ingot
custom_obsidian_ingot:
  material: brick
  display name: <&7>Obsidian ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 17m
      input: custom_obsidian/4|custom_diamond/1
      output_quantity: 1
      type: smeltery
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_obsidian_nugget|custom_obsidian_nugget|custom_obsidian_nugget
      - custom_obsidian_nugget|custom_obsidian_nugget|custom_obsidian_nugget
      - custom_obsidian_nugget|custom_obsidian_nugget|custom_obsidian_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_obsidian_block
custom_obsidian_block:
  material: iron_block
  display name: <&7>Obsidian block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
custom_obsidian_boots:
  material: iron_boots
  lore:
  display name: <&7>Obsidian boots
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
      - custom_obsidian_ingot|custom_leather_boots|custom_obsidian_ingot
      - custom_obsidian_ingot|air|custom_obsidian_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_obsidian_ingot|custom_leather_boots|custom_obsidian_ingot
      - custom_obsidian_ingot|air|custom_obsidian_ingot
custom_obsidian_leggings:
  material: iron_leggings
  display name: <&7>Obsidian leggings
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
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_leather_leggings|custom_obsidian_ingot
      - custom_obsidian_ingot|air|custom_obsidian_ingot
custom_obsidian_chestplate:
  material: iron_chestplate
  display name: <&7>Obsidian chestplate
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
      - custom_obsidian_ingot|custom_leather_chestplate|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
custom_obsidian_helmet:
  material: iron_helmet
  display name: <&7>Obsidian helmet
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
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_leather_helmet|custom_obsidian_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_obsidian_ingot|custom_obsidian_ingot|custom_obsidian_ingot
      - custom_obsidian_ingot|custom_leather_helmet|custom_obsidian_ingot