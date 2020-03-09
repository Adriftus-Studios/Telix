
custom_manaweave_cloth:
  type: item
  material: leather
  display name: <&b>Manaweave Cloth
  recipes:
    1:
      type: alchemy
      output_quantity: 1
      input: custom_manasteel_ingot/2|custom_leather/5|custom_magic_powder/1
      cook_time: 4m
  
custom_manaweave_cowl:
  type: item
  material: leather_helmet
  display name: <&b>Manaweave Cowl
  category: hat
  fake_durability: 450
  armor: 2
  equipment_rating: 5
  max_stars: 12
  sockets: 3
  equipment_modifiers:
    boss_damage:
      min: 10
      max: 50
    power:
      min: 10
      max: 25
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manaweave_cloth|custom_manaweave_cloth|custom_manaweave_cloth
      - custom_manaweave_cloth|custom_terrasteel_helmet|custom_manaweave_cloth
      - air|air|air
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_manaweave_cloth|custom_manaweave_cloth|custom_manaweave_cloth
      - custom_manaweave_cloth|custom_terrasteel_helmet|custom_manaweave_cloth

custom_manaweave_robe:
  type: item
  material: leather_chestplate
  display name: <&b>Manaweave Robe
  category: shirt
  fake_durability: 495
  armor: 4
  equipment_rating: 5
  max_stars: 12
  sockets: 3
  equipment_modifiers:
    boss_damage:
      min: 10
      max: 50
    power:
      min: 10
      max: 25
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manaweave_cloth|custom_terrasteel_chestplate|custom_manaweave_cloth
      - custom_manaweave_cloth|custom_manaweave_cloth|custom_manaweave_cloth
      - custom_manaweave_cloth|custom_manaweave_cloth|custom_manaweave_cloth

custom_manaweave_pants:
  type: item
  material: leather_leggings
  display name: <&b>Manaweave Pants
  category: pants
  fake_durability: 470
  armor: 3
  equipment_rating: 5
  max_stars: 12
  sockets: 3
  equipment_modifiers:
    boss_damage:
      min: 10
      max: 50
    power:
      min: 10
      max: 25
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manaweave_cloth|custom_manaweave_cloth|custom_manaweave_cloth
      - custom_manaweave_cloth|custom_terrasteel_leggings|custom_manaweave_cloth
      - custom_manaweave_cloth|air|custom_manaweave_cloth

custom_manaweave_boots:
  type: item
  material: leather_boots
  display name: <&b>Manaweave Bots
  category: hat
  fake_durability: 435
  armor: 2
  equipment_rating: 5
  max_stars: 12
  sockets: 3
  equipment_modifiers:
    boss_damage:
      min: 10
      max: 50
    power:
      min: 10
      max: 25
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_manaweave_cloth|custom_terrasteel_boots|custom_manaweave_cloth
      - custom_manaweave_cloth|air|custom_manaweave_cloth
      - air|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - custom_manaweave_cloth|custom_terrasteel_boots|custom_manaweave_cloth
      - custom_manaweave_cloth|air|custom_manaweave_cloth