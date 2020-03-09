
custom_lead_sword:
  material: iron_sword
  display name: <&7>Lead Sword
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
      - custom_lead_ingot|air|air
      - custom_lead_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|air
      - air|custom_lead_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_lead_ingot
      - air|air|custom_lead_ingot
      - air|air|custom_stick
custom_lead_pickaxe:
  material: iron_pickaxe
  display name: <&7>Lead Pickaxe
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
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_lead_axe:
  material: iron_axe
  display name: <&7>Lead Axe
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
      - custom_lead_ingot|custom_lead_ingot|air
      - custom_lead_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|custom_lead_ingot
      - air|custom_stick|custom_lead_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_lead_ingot|custom_lead_ingot|air
      - custom_stick|custom_lead_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|custom_lead_ingot
      - air|custom_lead_ingot|custom_stick
      - air|air|custom_stick
custom_lead_shovel:
  material: iron_shovel
  display name: <&7>Lead Shovel
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
      - custom_lead_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_lead_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_lead_hoe:
  material: iron_hoe
  display name: <&7>Lead Hoe
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
      - custom_lead_ingot|custom_lead_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|custom_lead_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_lead_hoe3
      output_quantity: 1
      input:
      - custom_lead_ingot|custom_lead_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_lead_ingot|custom_lead_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_lead_nugget:
  material: iron_nugget
  display name: <&7>Lead Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_lead_ingot
custom_lead_ingot:
  material: brick
  display name: <&7>Lead Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_lead_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_lead_block
custom_lead_block:
  material: iron_block
  display name: <&7>Lead Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
custom_lead_ore:
  material: iron_ore
  display name: <&7>Lead Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 20
custom_lead_boots:
  material: iron_boots
  lore:
  display name: <&7>Lead Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 78
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    health:
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
      - custom_lead_ingot|custom_leather_boots|custom_lead_ingot
      - custom_lead_ingot|air|custom_lead_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_lead_ingot|custom_leather_boots|custom_lead_ingot
      - custom_lead_ingot|air|custom_lead_ingot
custom_lead_leggings:
  material: iron_leggings
  display name: <&7>Lead Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 90
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    health:
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
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_leather_leggings|custom_lead_ingot
      - custom_lead_ingot|air|custom_lead_ingot
custom_lead_chestplate:
  material: iron_chestplate
  display name: <&7>Lead Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 96
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    health:
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
      - custom_lead_ingot|custom_leather_chestplate|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
custom_lead_helmet:
  material: iron_helmet
  display name: <&7>Lead Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 66
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    health:
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
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_leather_helmet|custom_lead_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_leather_helmet|custom_lead_ingot