custom_water_skin_empty:
  type: item
  material: bucket
  weight: 3.25
  mechanisms:
    custom_model_data: 1
  display name: Empty Water-skin
  lore:
  - "<&b>Right-click on water to fill"
  - "<&b>your Water-skin."
  - "<&b>"
  - "<&b>Crafted with<&6> Tanned Leather<&b>."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: shaped
          recipe_id: custom_water_skin_empty
          output_quantity: 1
          input:
          - custom_leather_tanned|air|custom_leather_tanned
          - custom_leather_tanned|air|custom_leather_tanned
          - air|custom_leather_tanned|air

custom_water_skin_filled:
  type: item
  material: potion
  weight: 4
  mechanisms:
    custom_model_data: 1
  display name: Filled Water-skin
  lore:
  - "<&b>Filled with refreshing water."
  - "<&b>This is a bit heavy, but needed."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"