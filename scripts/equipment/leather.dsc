
custom_leather_horse_armor:
  material: leather_horse_armor
  recipe_book_category: equipment.leather
  display name: <&7>Leather Horse Armor
  weight: '1'
  type: item
custom_leather_boots:
  material: leather_boots
  lore:
  recipe_book_category: equipment.leather
  display name: <&7>Leather Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 65
  armor: 1
  equipment_rating: 5
  max_stars: 1
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    weight:
      max: 20
      min: 1
    power:
      max: 15
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|air|custom_leather
      - custom_leather|air|custom_leather
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_leather|air|custom_leather
      - custom_leather|air|custom_leather
custom_leather_leggings:
  material: leather_leggings
  recipe_book_category: equipment.leather
  display name: <&7>Leather Pants
  category: pants
  weight: '1'
  type: item
  fake_durability: 75
  armor: 2
  equipment_rating: 5
  max_stars: 1
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    weight:
      max: 20
      min: 1
    power:
      max: 15
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|custom_leather|custom_leather
      - custom_leather|air|custom_leather
      - custom_leather|air|custom_leather
custom_leather_chestplate:
  material: leather_chestplate
  recipe_book_category: equipment.leather
  display name: <&7>Leather Tunic
  category: shirt
  weight: '1'
  type: item
  fake_durability: 80
  armor: 3
  equipment_rating: 5
  max_stars: 1
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    weight:
      max: 20
      min: 1
    power:
      max: 15
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|air|custom_leather
      - custom_leather|custom_leather|custom_leather
      - custom_leather|custom_leather|custom_leather
custom_leather_helmet:
  material: leather_helmet
  recipe_book_category: equipment.leather
  display name: <&7>Leather Cap
  category: hat
  weight: '1'
  type: item
  fake_durability: 55
  armor: 1
  equipment_rating: 5
  max_stars: 1
  sockets: 1
  equipment_modifiers:
    speed:
      max: 10
      min: 1
    weight:
      max: 20
      min: 1
    power:
      max: 15
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|custom_leather|custom_leather
      - custom_leather|air|custom_leather
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_leather|custom_leather|custom_leather
      - custom_leather|air|custom_leather
custom_leather:
  material: leather
  lore:
  - <&b>Raw animal hide
  recipe_book_category: equipment.leather
  display name: <&7>Raw Hide
  weight: 1
  type: item
  mechanisms:
    custom_model_data: 1