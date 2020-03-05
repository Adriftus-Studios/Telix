
custom_copper_sword:
  material: iron_sword
  display name: <&7>Copper sword
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
      - custom_copper_ingot|air|air
      - custom_copper_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_copper_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_copper_ingot
      - air|air|custom_stick
custom_copper_pickaxe:
  material: iron_pickaxe
  display name: <&7>Copper pickaxe
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
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_copper_axe:
  material: iron_axe
  display name: <&7>Copper axe
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
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_copper_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|custom_copper_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|custom_copper_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_copper_ingot|custom_stick
      - air|air|custom_stick
custom_copper_shovel:
  material: iron_shovel
  display name: <&7>Copper shovel
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
      - custom_copper_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_hoe:
  material: iron_hoe
  display name: <&7>Copper hoe
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
      - custom_copper_ingot|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_hoe3
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_nugget:
  material: iron_nugget
  display name: <&7>Copper nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_copper_ingot
custom_copper_ingot:
  material: brick
  display name: <&7>Copper ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_copper_ore
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_copper_block
custom_copper_block:
  material: iron_block
  display name: <&7>Copper block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
custom_copper_ore:
  material: iron_ore
  display name: <&7>Copper ore
  weight: '1'
  type: item
  ore:
      biome: all
      block: stone
      chance: 20
custom_copper_boots:
  material: iron_boots
  lore:
  display name: <&7>Copper boots
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
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_leggings:
  material: iron_leggings
  display name: <&7>Copper leggings
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
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_leggings|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_chestplate:
  material: iron_chestplate
  display name: <&7>Copper chestplate
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
      - custom_copper_ingot|custom_leather_chestplate|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
custom_copper_helmet:
  material: iron_helmet
  display name: <&7>Copper helmet
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
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot