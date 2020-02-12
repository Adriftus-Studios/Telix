custom_campfire:
  type: item
  material: campfire
  weight: 5
  display name: Campfire
  lore:
  - "<&b>A cozy campfire."
  - "<&b> "
  - "<&b>Will raise your body temperature by <&6>20 Units<&b>"
  - "<&b>  while you are 6 blocks away or less."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  
  recipes:
      1:
          type: shaped
          recipe_id: custom_campfire
          output_quantity: 1
          input:
          - air|custom_stick|air
          - custom_stick|custom_kindling|custom_stick
          - custom_stone|custom_stone|custom_stone