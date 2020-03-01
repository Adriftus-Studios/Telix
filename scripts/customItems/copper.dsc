
custom_copper_pickaxe:
  material: iron_pickaxe
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper pickaxe
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      recipe_id: custom_copper_pickaxe
      output_quantity: 1
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - air|custom_stick|air
      - air|custom_stick|air
custom_copper_hoe:
  material: iron_hoe
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper hoe
  weight: '1'
  type: item
custom_copper_boots:
  material: iron_boots
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper boots
  weight: '1'
  type: item
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
custom_copper_sword:
  material: iron_sword
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper sword
  weight: '1'
  type: item
custom_copper_axe:
  material: iron_axe
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper axe
  weight: '1'
  type: item
custom_copper_leggings:
  material: iron_leggings
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper leggings
  weight: '1'
  type: item
custom_copper_horse_armor:
  material: iron_horse_armor
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper horse_armor
  weight: '1'
  type: item
custom_copper_chestplate:
  material: iron_chestplate
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper chestplate
  weight: '1'
  type: item
custom_copper_shovel:
  material: iron_shovel
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper shovel
  weight: '1'
  type: item
custom_copper_helmet:
  material: iron_helmet
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Copper helmet
  weight: '1'
  type: item
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