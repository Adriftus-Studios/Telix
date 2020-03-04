
custom_copper_sword:
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
      recipe_id: custom_copper_sword1
      output_quantity: 1
      input:
      - custom_copper_ingot|air|air
      - custom_copper_ingot|air|air
      - custom_stick|air|air
    2:
      type: shaped
      recipe_id: custom_copper_sword2
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_copper_ingot|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_sword3
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_copper_ingot
      - air|air|custom_stick
custom_copper_pickaxe:
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
      recipe_id: custom_copper_pickaxe1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_copper_axe:
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
      recipe_id: custom_copper_axe1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_copper_ingot|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      recipe_id: custom_copper_axe2
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|custom_copper_ingot
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_axe3
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|custom_copper_ingot|air
      - custom_stick|air|air
    4:
      type: shaped
      recipe_id: custom_copper_axe4
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_copper_ingot|custom_stick
      - air|air|custom_stick
custom_copper_shovel:
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
      recipe_id: custom_copper_shovel1
      output_quantity: 1
      input:
      - custom_copper_ingot|air|air
      - custom_stick|air|air
      - custom_stick|air|air
    2:
      type: shaped
      recipe_id: custom_copper_shovel2
      output_quantity: 1
      input:
      - air|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_shovel3
      output_quantity: 1
      input:
      - air|air|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_hoe:
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
      recipe_id: custom_copper_hoe1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - air|custom_stick|air
      - air|custom_stick|air
    2:
      type: shaped
      recipe_id: custom_copper_hoe2
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
    3:
      type: shaped
      recipe_id: custom_copper_hoe3
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|air
      - custom_stick|air|air
      - custom_stick|air|air
    4:
      type: shaped
      recipe_id: custom_copper_hoe4
      output_quantity: 1
      input:
      - air|custom_copper_ingot|custom_copper_ingot
      - air|air|custom_stick
      - air|air|custom_stick
custom_copper_ingot:
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
      input: custom_copper_ore
custom_copper_ore:
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
custom_copper_boots:
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
      recipe_id: custom_copper_boots1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
      - air|air|air
    2:
      type: shaped
      recipe_id: custom_copper_boots2
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_leather_boots|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_leggings:
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
      recipe_id: custom_copper_leggings1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_leggings|custom_copper_ingot
      - custom_copper_ingot|air|custom_copper_ingot
custom_copper_chestplate:
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
      recipe_id: custom_copper_chestplate1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_leather_chestplate|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
custom_copper_helmet:
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
      recipe_id: custom_copper_helmet1
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot
      - air|air|air
    1:
      type: shaped
      recipe_id: custom_copper_helmet2
      output_quantity: 1
      input:
      - air|air|air
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_leather_helmet|custom_copper_ingot