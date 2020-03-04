custom_iron_horse_armor:
  material: iron_horse_armor
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Iron_horse_armor
  weight: '1'
  type: item
custom_iron_sword:
  material: iron_sword
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper sword
  weight: '1'
  type: item
  fake_durability: 122
  recipes:
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
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper pickaxe
  weight: '1'
  type: item
  fake_durability: 122
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_iron_axe:
  material: iron_axe
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper axe
  weight: '1'
  type: item
  fake_durability: 122
  recipes:
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
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper shovel
  weight: '1'
  type: item
  fake_durability: 122
  recipes:
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
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper hoe
  weight: '1'
  type: item
  fake_durability: 122
  recipes:
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
custom_iron_nugget:
  material: iron_nugget
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_iron_ingot
custom_iron_ingot:
  material: iron_ingot
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_iron_ore
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
    3:
      type: shapeless
      output_quantity: 9
      input: custom_iron_block
custom_iron_block:
  material: iron_block
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
custom_iron_ore:
  material: iron_ore
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper ore
  weight: '1'
  type: item
  ore:
      biome: all
      block: stone
      chance: 20
custom_iron_boots:
  material: iron_boots
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper boots
  weight: '1'
  type: item
  fake_durability: 78
  armor: 1
  recipes:
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
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper leggings
  weight: '1'
  type: item
  fake_durability: 90
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_leather_leggings|custom_iron_ingot
      - custom_iron_ingot|air|custom_iron_ingot
custom_iron_chestplate:
  material: iron_chestplate
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper chestplate
  weight: '1'
  type: item
  fake_durability: 96
  armor: 3
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_iron_ingot|custom_leather_chestplate|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
custom_iron_helmet:
  material: iron_helmet
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper helmet
  weight: '1'
  type: item
  fake_durability: 66
  armor: 1
  recipes:
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