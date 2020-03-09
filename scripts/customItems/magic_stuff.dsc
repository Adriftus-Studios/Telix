
custom_blank_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -6
  display name: <&7>Blank Rune

custom_air_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -7
  display name: <&7>Air Rune
  recipes:
    1:
      type: altar
      output_quantity: 1
      input: custom_glass_bottle/13|custom_blank_rune/1|custom_air_shard/4|custom_white_wool/8|custom_feather/19
      cook_time: 5m

custom_air_shard:
  type: item
  material: iron_nugget
  display name: <&7>Air Shard
  ore:
    1:
      biome: all
      block: stone
      tool: all
      chance: 47

custom_water_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -8
  display name: <&7>Water Rune
  recipes:
    1:
      type: altar
      output_quantity: 1
      input: custom_glass_bottle/13|custom_blank_rune/1|custom_air_shard/4|custom_white_wool/8|custom_feather/19
      cook_time: 5m

custom_water_shard:
  type: item
  material: iron_nugget
  display name: <&7>Water Shard
  ore:
    1:
      biome: ocean|deep_ocean|warm_ocean|lukewarm_ocean|deep_warm_ocean|deep_lukewarm_ocean|
      block: stone
      tool: all
      chance: 47

custom_earth_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -9
  display name: <&7>Earth Rune

custom_fire_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -10
  display name: <&7>Fire Rune

custom_ender_rune:
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
      chance: 25
      min_quantity: 1
      max_quantity: 2

custom_inferno_extract:
  type: item
  material: potion
  display name: <&7>Inferno Extract
  mechanisms:
    flags: HIDE_POTION_EFFECTS
    color: 100,0,0
  mob_drops:
    1:
      dropped_by: blaze
      chance: 14
      max_quantity: 1
      min_quantity: 1
    2:
      dropped_by: pig_zombie
      chance: 67
      max_quantity: 1
      min_quantity: 1