
custom_wooden_sword:
  material: wooden_sword
  recipe_book_category: equipment.wooden
  display name: <&7>Wooden Sword
  weight: '1'
  type: item
  fake_durability: 59
  damage: 4
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|air|air
      - regex:(.*)_planks|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|air
      - air|regex:(.*)_planks|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|regex:(.*)_planks
      - air|air|regex:(.*)_planks
      - air|air|custom_stick
custom_wooden_pickaxe:
  material: wooden_pickaxe
  recipe_book_category: equipment.wooden
  display name: <&7>Wooden Pickaxe
  weight: '1'
  type: item
  fake_durability: 59
  damage: 2
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|regex:(.*)_planks|regex:(.*)_planks
      - air|custom_stick|air
      - air|custom_stick|air
custom_wooden_axe:
  material: wooden_axe
  recipe_book_category: equipment.wooden
  display name: <&7>Wooden Axe
  weight: '1'
  type: item
  fake_durability: 59
  damage: 3
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|regex:(.*)_planks|air
      - regex:(.*)_planks|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|regex:(.*)_planks
      - air|custom_stick|regex:(.*)_planks
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|regex:(.*)_planks|air
      - custom_stick|regex:(.*)_planks|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|regex:(.*)_planks
      - air|regex:(.*)_planks|custom_stick
      - air|air|custom_stick
custom_wooden_shovel:
  material: wooden_shovel
  recipe_book_category: equipment.wooden
  display name: <&7>Wooden Shovel
  weight: '1'
  type: item
  fake_durability: 59
  damage: 1
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      output_quantity: 1
      input:
      - air|air|regex:(.*)_planks
      - air|air|custom_stick
      - air|air|custom_stick
custom_wooden_hoe:
  material: wooden_hoe
  recipe_book_category: equipment.wooden
  display name: <&7>Wooden Hoe
  weight: '1'
  type: item
  fake_durability: 59
  damage: 1
  attack_speed: 4
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - regex:(.*)_planks|regex:(.*)_planks|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|regex:(.*)_planks
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_bronze_hoe3
      output_quantity: 1
      input:
      - regex:(.*)_planks|regex:(.*)_planks|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
      - air|regex:(.*)_planks|regex:(.*)_planks
      - air|air|custom_stick
      - air|air|custom_stick