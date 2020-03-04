
custom_leather_horse_armor:
  material: leather_horse_armor
  display name: <&7>Leather horse armor
  weight: '1'
  type: item
custom_leather_boots:
  material: leather_boots
  lore:
  display name: <&7>Leather boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 65
  armor: 1
  recipes:
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
  display name: <&7>Leather leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 75
  armor: 2
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|custom_leather|custom_leather
      - custom_leather|air|custom_leather
      - custom_leather|air|custom_leather
custom_leather_chestplate:
  material: leather_chestplate
  display name: <&7>Leather chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 80
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_leather|air|custom_leather
      - custom_leather|custom_leather|custom_leather
      - custom_leather|custom_leather|custom_leather
custom_leather_helmet:
  material: leather_helmet
  display name: <&7>Leather helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 55
  armor: 1
  recipes:
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
  display name: <&7>Raw Hide
  weight: 1
  type: item
  mechanisms:
    custom_model_data: 1