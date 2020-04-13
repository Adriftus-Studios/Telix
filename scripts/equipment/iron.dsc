custom_iron_horse_armor:
  material: iron_horse_armor
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  recipe_book_category: equipment.iron
  display name: <&7>Iron Horse Armor
  weight: '1'
  type: item
custom_iron_sword:
  material: iron_sword
  recipe_book_category: equipment.iron
  display name: <&7>Iron Sword
  weight: '1'
  type: item
  fake_durability: 250
  damage: 5
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|air|air
      - custom_iron_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|air
      - air|custom_iron_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_iron_ingot
      - air|air|custom_iron_ingot
      - air|air|custom_stick
custom_iron_pickaxe:
  material: iron_pickaxe
  recipe_book_category: equipment.iron
  display name: <&7>Iron Pickaxe
  weight: '1'
  type: item
  fake_durability: 250
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_iron_axe:
  material: iron_axe
  recipe_book_category: equipment.iron
  display name: <&7>Iron Axe
  weight: '1'
  type: item
  fake_durability: 250
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|air
      - custom_iron_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|custom_iron_ingot
      - air|custom_stick|custom_iron_ingot
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|air
      - custom_stick|custom_iron_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|custom_iron_ingot
      - air|custom_iron_ingot|custom_stick
      - air|air|custom_stick
custom_iron_shovel:
  material: iron_shovel
  recipe_book_category: equipment.iron
  display name: <&7>Iron Shovel
  weight: '1'
  type: item
  fake_durability: 250
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|custom_iron_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_iron_hoe:
  material: iron_hoe
  recipe_book_category: equipment.iron
  display name: <&7>Iron Hoe
  weight: '1'
  type: item
  fake_durability: 250
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|custom_iron_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_iron_hoe3
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|custom_iron_ingot|custom_iron_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_iron_boots:
  material: iron_boots
  lore:
  recipe_book_category: equipment.iron
  display name: <&7>Iron Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 195
  armor: 2
  equipment_rating: 5
  max_stars: 4
  sockets: 2
  equipment_modifiers:
    health:
      max: 2
      min: 1
    speed:
      max: 5
      min: 1
    weight:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_leather_boots|custom_iron_ingot
      - custom_iron_ingot|air|custom_iron_ingot
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_iron_ingot|custom_leather_boots|custom_iron_ingot
      - custom_iron_ingot|air|custom_iron_ingot
custom_iron_leggings:
  material: iron_leggings
  recipe_book_category: equipment.iron
  display name: <&7>Iron Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 225
  armor: 5
  equipment_rating: 5
  max_stars: 4
  sockets: 2
  equipment_modifiers:
    health:
      max: 2
      min: 1
    speed:
      max: 5
      min: 1
    weight:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_leather_leggings|custom_iron_ingot
      - custom_iron_ingot|air|custom_iron_ingot
custom_iron_chestplate:
  material: iron_chestplate
  recipe_book_category: equipment.iron
  display name: <&7>Iron Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 240
  armor: 6
  equipment_rating: 5
  max_stars: 4
  sockets: 2
  equipment_modifiers:
    health:
      max: 2
      min: 1
    speed:
      max: 5
      min: 1
    weight:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_leather_chestplate|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
custom_iron_helmet:
  material: iron_helmet
  recipe_book_category: equipment.iron
  display name: <&7>Iron Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 165
  armor: 2
  equipment_rating: 5
  max_stars: 4
  sockets: 2
  equipment_modifiers:
    health:
      max: 2
      min: 1
    speed:
      max: 5
      min: 1
    weight:
      max: 10
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_leather_helmet|custom_iron_ingot
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_leather_helmet|custom_iron_ingot