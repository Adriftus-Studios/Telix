custom_spear:
  type: item
  material: stick
  weight: 2.50
  display name: Primal Spear
  lore:
  - "<&b>Primal Spear that has been"
  - "<&b>assembled with <&6>Sticks<&b> and<&6> Bones<&b>."
  - "<&b>Can be thrown, or used as a melee weapon."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: shaped
          recipe_id: primative_spear1
          output_quantity: 1
          input:
          - air|air|custom_bone
          - air|custom_stick|air
          - custom_stick|air|air
      2:
          type: shaped
          recipe_id: primative_spear2
          output_quantity: 1
          input:
          - custom_bone|air|air
          - air|custom_stick|air
          - air|air|custom_stick
      3:
          type: shaped
          recipe_id: primative_spear3
          output_quantity: 1
          input:
          - custom_stick|air|air
          - air|custom_stick|air
          - air|air|custom_bone
      4:
          type: shaped
          recipe_id: primative_spear4
          output_quantity: 1
          input:
          - air|air|custom_stick
          - air|custom_stick|air
          - custom_bone|air|air