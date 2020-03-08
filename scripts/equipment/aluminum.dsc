
custom_aluminum_sword:
  material: iron_sword
  display name: <&7>Aluminum sword
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
      - custom_aluminum_ingot|air|air
      - custom_aluminum_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|air
      - air|custom_aluminum_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_aluminum_ingot
      - air|air|custom_aluminum_ingot
      - air|air|custom_stick
custom_aluminum_pickaxe:
  material: iron_pickaxe
  display name: <&7>Aluminum pickaxe
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
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_aluminum_axe:
  material: iron_axe
  display name: <&7>Aluminum axe
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
      - custom_aluminum_ingot|custom_aluminum_ingot|air
      - custom_aluminum_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|custom_aluminum_ingot
      - air|custom_stick|custom_aluminum_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_aluminum_ingot|custom_aluminum_ingot|air
      - custom_stick|custom_aluminum_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|custom_aluminum_ingot
      - air|custom_aluminum_ingot|custom_stick
      - air|air|custom_stick
custom_aluminum_shovel:
  material: iron_shovel
  display name: <&7>Aluminum shovel
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
      - custom_aluminum_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_aluminum_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_aluminum_hoe:
  material: iron_hoe
  display name: <&7>Aluminum hoe
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
      - custom_aluminum_ingot|custom_aluminum_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|custom_aluminum_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_aluminum_hoe3
      output_quantity: 1
      input:
      - custom_aluminum_ingot|custom_aluminum_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_aluminum_ingot|custom_aluminum_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_aluminum_nugget:
  material: iron_nugget
  display name: <&7>Aluminum nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_aluminum_ingot
custom_aluminum_ingot:
  material: brick
  display name: <&7>Aluminum ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_aluminum_ore
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_aluminum_block
custom_aluminum_block:
  material: iron_block
  display name: <&7>Aluminum block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
custom_aluminum_ore:
  material: iron_ore
  display name: <&7>Aluminum ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 20
custom_aluminum_boots:
  material: iron_boots
  lore:
  display name: <&7>Aluminum boots
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
      - custom_aluminum_ingot|custom_leather_boots|custom_aluminum_ingot
      - custom_aluminum_ingot|air|custom_aluminum_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_aluminum_ingot|custom_leather_boots|custom_aluminum_ingot
      - custom_aluminum_ingot|air|custom_aluminum_ingot
custom_aluminum_leggings:
  material: iron_leggings
  display name: <&7>Aluminum leggings
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
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_leather_leggings|custom_aluminum_ingot
      - custom_aluminum_ingot|air|custom_aluminum_ingot
custom_aluminum_chestplate:
  material: iron_chestplate
  display name: <&7>Aluminum chestplate
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
      - custom_aluminum_ingot|custom_leather_chestplate|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
custom_aluminum_helmet:
  material: iron_helmet
  display name: <&7>Aluminum helmet
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
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_leather_helmet|custom_aluminum_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_leather_helmet|custom_aluminum_ingot