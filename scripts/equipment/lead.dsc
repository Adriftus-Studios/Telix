
custom_lead_sword:
  material: iron_sword
  recipe_book_category: equipment.lead
  display name: <&7>Lead Sword
  weight: '2'
  type: item
  fake_durability: 150
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Pickaxe
  weight: '3'
  type: item
  fake_durability: 150
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Axe
  weight: '3'
  type: item
  fake_durability: 150
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Shovel
  weight: '1'
  type: item
  fake_durability: 150
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Hoe
  weight: '2'
  type: item
  fake_durability: 150
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
  recipe_book_category: equipment.lead
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
  material: iron_ingot
  recipe_book_category: equipment.lead
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
  recipe_book_category: equipment.lead
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 39
custom_lead_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.lead
  display name: <&7>Lead Boots
  category: shoes
  weight: '4'
  type: item
  fake_durability: 195
  armor: 3
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      min: -15
      max: -5
    health:
      min: 1
      max: 3
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Leggings
  category: pants
  weight: '7'
  type: item
  fake_durability: 225
  armor: 4
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      min: -15
      max: -5
    health:
      min: 1
      max: 3
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Chestplate
  category: shirt
  weight: '8'
  type: item
  fake_durability: 240
  armor: 5
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      min: -15
      max: -5
    health:
      min: 1
      max: 3
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
  recipe_book_category: equipment.lead
  display name: <&7>Lead Helmet
  category: hat
  weight: '5'
  type: item
  fake_durability: 165
  armor: 2
  equipment_rating: 5
  max_stars: 3
  sockets: 1
  equipment_modifiers:
    speed:
      min: -15
      max: -5
    health:
      min: 1
      max: 3
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