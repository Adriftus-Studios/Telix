primative_pick:
  type: item
  material: stone_pickaxe
  weight: 3
  display name: Primitive Pickaxe
  lore:
  - "<&b>Primitive Pickaxe that has been"
  - "<&b>fabricated with <&6>Flint<&b> and<&6> Bones<&b>."
  - "<&b> "
  - "<&b>Break wood to get more <&6>Kindling<&b>."
  - "<&b>Break stone to get more <&6>Flint<&b>."
  - "<&6>"
  - "<&8>Item Weight: <script.yaml_key[weight]>"
  recipes:
      1:
          type: shaped
          recipe_id: primative_pick
          output_quantity: 1
          input:
          - custom_flint|custom_flint|custom_flint
          - air|custom_bone|air
          - air|custom_bone|air