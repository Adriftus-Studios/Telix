
custom_tin_sword:
  material: iron_sword
  display name: <&7>Tin sword
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
      - custom_tin_ingot|air|air
      - custom_tin_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|air
      - air|custom_tin_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_tin_ingot
      - air|air|custom_tin_ingot
      - air|air|custom_stick
custom_tin_pickaxe:
  material: iron_pickaxe
  display name: <&7>Tin pickaxe
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
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_tin_axe:
  material: iron_axe
  display name: <&7>Tin axe
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
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_tin_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|custom_tin_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_stick|custom_tin_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_tin_ingot|custom_stick
      - air|air|custom_stick
custom_tin_shovel:
  material: iron_shovel
  display name: <&7>Tin shovel
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
      - custom_tin_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_tin_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_tin_hoe:
  material: iron_hoe
  display name: <&7>Tin hoe
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
      - custom_tin_ingot|custom_tin_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_tin_hoe3
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_tin_ingot|custom_tin_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_tin_nugget:
  material: iron_nugget
  display name: <&7>Tin nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_tin_ingot
custom_tin_ingot:
  material: iron_ingot
  display name: <&7>Tin ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_tin_ore
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_tin_block
custom_tin_block:
  material: iron_block
  display name: <&7>Tin block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
custom_tin_ore:
  material: iron_ore
  display name: <&7>Tin ore
  weight: '1'
  type: item
  ore:
      biome: all
      block: stone
      chance: 20
custom_tin_boots:
  material: iron_boots
  lore:
  display name: <&7>Tin boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 78
  armor: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_leather_boots|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_tin_ingot|custom_leather_boots|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
custom_tin_leggings:
  material: iron_leggings
  display name: <&7>Tin leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 90
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_leggings|custom_tin_ingot
      - custom_tin_ingot|air|custom_tin_ingot
custom_tin_chestplate:
  material: iron_chestplate
  display name: <&7>Tin chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 96
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_leather_chestplate|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
custom_tin_helmet:
  material: iron_helmet
  display name: <&7>Tin helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 66
  armor: 1
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_helmet|custom_tin_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_leather_helmet|custom_tin_ingot