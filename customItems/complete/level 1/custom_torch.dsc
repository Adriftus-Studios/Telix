custom_torch:
  type: item
  material: torch
  weight: 0.25
  display name: <&6>Torch
  lore:
  - "<&b>Torches are needed to see at night."
  - "<&b>Made with a <&6>Stick<&b> and<&6> Kindling<&b>."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: shapeless
          recipe_id: custom_torch
          output_quantity: 1
          input: custom_kindling|custom_stick