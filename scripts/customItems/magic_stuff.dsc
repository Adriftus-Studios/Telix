
custom_rune_blank:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -6
  display name: <&7>Blank Rune

custom_rune_air:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -7
  display name: <&7>Air Rune

custom_rune_water:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -8
  display name: <&7>Water Rune

custom_rune_earth:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -9
  display name: <&7>Earth Rune

custom_rune_fire:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -10
  display name: <&7>Fire Rune

custom_rune_ender:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -11
  display name: <&7>Ender Rune

custom_livingwood_twig:
  type: item
  material: stick
  display name: <&f>Livingwood Twig
  ore:
    1:
      biome: all
      block: birch_log
      tool: custom_draw_knife
      chance: 70

custom_draw_knife:
  type: item
  material: iron_axe
  display name: <&7>Draw Knife
  fake_durability: 114
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_stick|custom_stick|custom_manasteel_ingot
      - air|air|custom_manasteel_ingot
      - custom_stick|custom_stick|custom_manasteel_ingot
    2:
      type: shaped
      output_quantity: 1
      input:
      - custom_manasteel_ingot|custom_stick|custom_stick
      - custom_manasteel_ingot|air|air
      - custom_manasteel_ingot|custom_stick|custom_stick

custom_magic_powder:
  type: item
  material: redstone
  display name: <&b>Magic Powder
  mob_drops:
    1:
      dropped_by: blaze|skeleton|enderman|drowned
      chance: 5
      min_quantity: 1
      max_quantity: 2