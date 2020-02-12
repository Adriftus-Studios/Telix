custom_hatchet:
  type: item
  material: stone_axe
  weight: 2.75
  display name: Primal Hatchet
  lore:
  - "<&b>Primal Hatchet that has been"
  - "<&b>fabricated with <&6>Flint<&b> and<&6> Bones<&b>."
  - "<&b> "
  - "<&b>Break stone to get more <&6>Stone<&b>."
  - "<&b>Break logs to get more <&6>Planks<&b>."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: shaped
          recipe_id: primative_hatchet1
          output_quantity: 1
          input:
          - air|custom_flint|custom_flint
          - air|custom_bone|custom_flint
          - air|custom_bone|air
      2:
          type: shaped
          recipe_id: primative_hatchet2
          output_quantity: 1
          input:
          - custom_flint|custom_flint|air
          - custom_bone|custom_flint|air
          - custom_bone|air|air
      3:
          type: shaped
          recipe_id: primative_hatchet3
          output_quantity: 1
          input:
          - custom_flint|custom_flint|air
          - custom_flint|custom_bone|air
          - air|custom_bone|air
      4:
          type: shaped
          recipe_id: primative_hatchet4
          output_quantity: 1
          input:
          - air|custom_flint|custom_flint
          - air|custom_flint|custom_bone
          - air|air|custom_bone