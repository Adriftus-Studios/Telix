
custom_chainlink:
  material: iron_nugget
  display name: <&7>Chainlink
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 30s
      experience: 5
      output_quantity: 2
      input: custom_iron_ingot
custom_chainmail_boots:
  material: chainmail_boots
  display name: <&7>Chainmail boots
  category: shoes
  weight: '1'
  type: item
  fake_durability: 195
  armor: 1
  recipes:
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
  display name: <&7>Chainmail leggings
  category: pants
  weight: '1'
  type: item
  fake_durability: 225
  armor: 4
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_leather_leggings|custom_chainlink
      - custom_chainlink|air|custom_chainlink
custom_chainmail_chestplate:
  material: chainmail_chestplate
  display name: <&7>Chainmail chestplate
  category: shirt
  weight: '1'
  type: item
  fake_durability: 240
  armor: 5
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_chainlink|custom_leather_chestplate|custom_chainlink
      - custom_chainlink|custom_chainlink|custom_chainlink
      - custom_chainlink|custom_chainlink|custom_chainlink
custom_chainmail_helmet:
  material: chainmail_helmet
  display name: <&7>Chainmail helmet
  category: hat
  weight: '1'
  type: item
  fake_durability: 165
  armor: 2
  recipes:
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