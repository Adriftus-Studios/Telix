custom_diamond_horse_armor:
  material: diamond_horse_armor
  display name: <&7>Diamond horse armor
  weight: '1'
  type: item
custom_diamond_sword:
  material: diamond_sword
  display name: <&7>Diamond sword
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 7
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|air|air
      - custom_diamond|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|air
      - air|custom_diamond|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_diamond
      - air|air|custom_diamond
      - air|air|custom_stick
custom_diamond_pickaxe:
  material: diamond_pickaxe
  display name: <&7>Diamond pickaxe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 5
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - air|custom_stick|air
      - air|custom_stick|air
custom_diamond_axe:
  material: diamond_axe
  display name: <&7>Diamond axe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 6
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_diamond|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_stick|custom_diamond
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_stick|custom_diamond|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_diamond|custom_stick
      - air|air|custom_stick
custom_diamond_shovel:
  material: diamond_shovel
  display name: <&7>Diamond shovel
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 4
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_diamond
      - air|air|custom_stick
      - air|air|custom_stick
custom_diamond_hoe:
  material: diamond_hoe
  display name: <&7>Diamond hoe
  weight: '1'
  type: item
  fake_durability: 1561
  damage: 3
  attack_speed: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_diamond_hoe3
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_diamond|custom_diamond
      - air|air|custom_stick
      - air|air|custom_stick
custom_diamond:
  material: diamond
  display name: <&7>Diamond
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_diamond_ore
    2:
      type: shapeless
      output_quantity: 9
      input: custom_diamond_block
custom_diamond_block:
  material: diamond_block
  display name: <&7>Diamond block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
custom_diamond_ore:
  material: diamond_ore
  display name: <&7>Diamond ore
  weight: '1'
  type: item
  ore:
      biome: all
      block: stone
      chance: 20
custom_diamond_boots:
  material: diamond_boots
  lore:
  display name: <&7>Diamond boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 429
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_iron_boots|custom_diamond
      - custom_diamond|air|custom_diamond
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_diamond|custom_iron_boots|custom_diamond
      - custom_diamond|air|custom_diamond
custom_diamond_leggings:
  material: diamond_leggings
  display name: <&7>Diamond leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 495
  armor: 6
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_iron_leggings|custom_diamond
      - custom_diamond|air|custom_diamond
custom_diamond_chestplate:
  material: diamond_chestplate
  display name: <&7>Diamond chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 528
  armor: 8
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_iron_chestplate|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
custom_diamond_helmet:
  material: diamond_helmet
  display name: <&7>Diamond helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 363
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_iron_helmet|custom_diamond
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_iron_helmet|custom_diamond