
custom_chainlink:
  material: iron_nugget
  recipe_book_category: equipment.chainmail
  display name: <&7>Chainlink
  weight: '1'
  type: item
  custom_recipes:
    1:
      type: smeltery
      cook_time: 30s
      output_quantity: 2
      input: custom_iron_ingot/1
custom_chainmail_boots:
  material: chainmail_boots
  recipe_book_category: equipment.chainmail
  display name: <&7>Chainmail Boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 195
  armor: 1
  equipment_rating: 5
  max_stars: 3
  sockets: 2
  equipment_modifiers:
    health:
      max: 3
      min: 1
    power:
      max: 10
      min: 1
    experience_multiplier:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_leather_boots|custom_chainlink
      - custom_chainlink|air|custom_chainlink
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_chainlink|custom_leather_boots|custom_chainlink
      - custom_chainlink|air|custom_chainlink
custom_chainmail_leggings:
  material: chainmail_leggings
  recipe_book_category: equipment.chainmail
  display name: <&7>Chainmail Leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 225
  armor: 4
  equipment_rating: 5
  max_stars: 3
  sockets: 2
  equipment_modifiers:
    health:
      max: 3
      min: 1
    power:
      max: 10
      min: 1
    experience_multiplier:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_leather_leggings|custom_chainlink
      - custom_chainlink|air|custom_chainlink
custom_chainmail_chestplate:
  material: chainmail_chestplate
  recipe_book_category: equipment.chainmail
  display name: <&7>Chainmail Chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 240
  armor: 5
  equipment_rating: 5
  max_stars: 3
  sockets: 2
  equipment_modifiers:
    health:
      max: 3
      min: 1
    power:
      max: 10
      min: 1
    experience_multiplier:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_leather_chestplate|custom_chainlink
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_chainlink|custom_chainlink
custom_chainmail_helmet:
  material: chainmail_helmet
  recipe_book_category: equipment.chainmail
  display name: <&7>Chainmail Helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 165
  armor: 2
  equipment_rating: 5
  max_stars: 3
  sockets: 2
  equipment_modifiers:
    health:
      max: 3
      min: 1
    power:
      max: 10
      min: 1
    experience_multiplier:
      max: 5
      min: 1
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_leather_helmet|custom_chainlink
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_leather_helmet|custom_chainlink