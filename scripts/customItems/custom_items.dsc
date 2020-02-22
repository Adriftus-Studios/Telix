custom_bone:
  type: item
  material: bone
  weight: 1
  display name: <&7>Bone
  lore:
  - "<&b>Bone that has been dropped by an animal."
  - "<&b>This can be sharpened or used in crafting."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_stone:
  type: item
  material: stone
  weight: 3
  display name: <&7>Stone
  lore:
  - "<&b>A small dull rock,"
  - "<&b>chipped from a large dull rock"
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_flint:
  type: item
  material: flint
  weight: 2
  display name: <&7>Flint
  lore:
  - "<&b>A piece of sharpened rock."
  - "<&b>This can be used in crafting."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_kindling:
  type: item
  material: dead_bush
  weight: 1
  display name: <&7>Kindling
  lore:
  - "<&b>Dry organic material"
  - "<&b>that could be used to make a fire."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_stick:
  type: item
  material: stick
  weight: 2
  display name: <&7>Stick
  lore:
  - "<&b>Sturdy organic material"
  - "<&b>that could be used as a handle."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_leather:
  type: item
  material: leather
  weight: 1
  mechanisms:
    custom_model_data: 1
  display name: <&7>Raw Hide
  lore:
  - "<&b>Raw animal hide"
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_leather_tanned:
  type: item
  material: leather
  weight: 1
  mechanisms:
    custom_model_data: 2
  display name: <&7>Tanned Leather
  lore:
  - "<&b>Processed leather hide."
  - "<&b>This has many applications."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: blast
          recipe_id: custom_leather_tanned
          experience: 0
          cook_time: 2s
          output_quantity: 1
          input: custom_leather

custom_charcoal:
  type: item
  material: charcoal
  weight: 0.75
  display name: <&7>Lump of Coal
  lore:
  - "<&b>A lump of raw fuel"
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_coal:
  type: item
  material: coal
  weight: 0.50
  display name: <&7>Refined Coal
  lore:
  - "<&b>Refined coal that burns longer."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"

custom_oak_planks:
  type: item
  material: oak_planks
  weight: 2
  display name: <&7>Oak Planks
  lore:
  - "<&b>Straightened Oak planks"
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  
custom_spruce_planks:
  type: item
  material: spruce_planks
  weight: 2
  display name: <&7>Spruce Planks
  lore:
  - "<&b>Straightened Spruce planks"
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"