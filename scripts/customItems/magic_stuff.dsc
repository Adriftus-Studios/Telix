
custom_blank_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -6
  display name: <&7>Blank Rune
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_stone|custom_stone|custom_stone
      - custom_stone|custom_obsidian|custom_stone
      - custom_stone|custom_stone|custom_stone

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
      chance: 39

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
      input: custom_blank_rune/1|custom_water_shard/7|custom_kelp/29|custom_sugar_cane/11|custom_pufferfish/2
      cook_time: 10m

custom_water_shard:
  type: item
  material: iron_nugget
  display name: <&7>Water Shard
  ore:
    1:
      biome: ocean|deep_ocean|warm_ocean|lukewarm_ocean|deep_warm_ocean|deep_lukewarm_ocean
      block: stone
      tool: all
      chance: 47

custom_earth_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -9
  display name: <&7>Earth Rune
  recipes:
    1:
      type: altar
      output_quantity: 1
      input: custom_blank_rune/1|custom_steel_ingot/12|custom_bronze_ingot/5|custom_obsidian_ingot/2|custom_stone/64|custom_cobblestone/64|custom_earth_shard/6
      cook_time: 10m

custom_earth_shard:
  type: item
  material: iron_nugget
  display name: <&7>Earth Shard
  ore:
    1:
      biome: MOUNTAINS|SNOWY_MOUNTAINS|MOUNTAIN_EDGE|WOODED_MOUNTAINS|GRAVELLY_MOUNTAINS|TAIGA_MOUNTAINS|SNOWY_TAIGA_MOUNTAINS|MODIFIED_GRAVELLY_MOUNTAINS
      block: stone
      tool: all
      chance: 60

custom_fire_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -10
  display name: <&7>Fire Rune
  recipes:
    1:
      type: altar
      output_quantity: 1
      input: custom_blank_rune/1|custom_manasteel_ingot/7|custom_terrasteel_ingot/1|custom_obsidian/26|custom_fire_shard/17|custom_ghast_tear/2|custom_inferno_extract/1
      cook_time: 20m

custom_fire_shard:
  type: item
  material: iron_nugget
  display name: <&7>Earth Shard
  ore:
    1:
      biome: nether
      block: netherrack|obsidian
      tool: all
      chance: 117

custom_ender_rune:
  type: item
  material: gold_nugget
  mechanisms:
    custom_model_data: -11
  display name: <&7>Ender Rune
  recipes:
    1:
      type: altar
      output_quantity: 1
      input: custom_blank_rune/1|custom_fire_rune/3|custom_earth_rune/3|custom_water_rune/3|custom_air_rune/3|custom_enderpearl/7|custom_ender_shard/17
      cook_time: 60m

custom_ender_shard:
  type: item
  material: iron_nugget
  display name: <&7>Ender Shard
  mob_drops:
    1:
      dropped_by: enderman
      chance: 7
      min_quantity: 1
      max_quantity: 2

custom_livingwood_twig:
  type: item
  material: stick
  display name: <&f>Livingwood Twig
  ore:
    1:
      biome: all
      block: birch_log
      tool: custom_draw_knife
      chance: 37
    2:
      type: shapeless
      output_quantity: 4
      input: custom_livingwood

custom_livingwood:
  type: item
  material: birch_log
  display name: <&f>Livingwood
  ore:
    1:
      biome: all
      block: birch_log
      tool: custom_draw_knife
      chance: 230

custom_dreamwood_twig:
  type: item
  material: stick
  display name: <&d>Dreamwood Twig
  recipes:
    1:
      type: alchemy
      output_quantity: 1
      input: custom_livingwood_twig/7|custom_earth_rune/1|custom_air_rune/2|custom_ender_shard/2
      cook_time: 7m
    2:
      type: shapeless
      output_quantity: 4
      input: custom_dreamwood

custom_dreamwood:
  type: item
  material: birch_log
  display name: <&d>Dreamwood
  recipes:
    1:
      type: alchemy
      output_quantity: 1
      input: custom_livingwood/3|custom_dreamwood_twig/11|custom_magic_powder/5|custom_earth_rune/2
      cook_time: 20m

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

custom_wrath_shard:
  type: item
  material: iron_nugget
  display name: <&7>Wrath Shard
  mob_drops:
    1:
      dropped_by: blaze|zombie_pig|enderman|skeleton|zombie|spider|creeper
      chance: 440
      max_quantity: 1
      min_quantity: 1

custom_envy_shard:
  type: item
  material: iron_nugget
  display name: <&7>Envy Shard
  ore:
    1:
      biome: all
      block: stone|netherrack|dirt|grass|sand
      tool: all
      chance: 300

custom_pride_shard:
  type: item
  material: iron_nugget
  display name: <&7>Pride Shard
  mob_drops:
    1:
      dropped_by: player
      chance: 100
      max_quantity: 1
      min_quantity: 1

custom_warped_shard:
  type: item
  material: iron_nugget
  display name: <&5>Warped Shard
  recipe_book_note: <&5>Not much is known about this shard... Legends say it will appear at a random point in the world every hour.

warped_shard_giver:
  type: world
  events:
    on delta time minutely every:1:
      - foreach <server.list_online_players>:
        - if <util.random.int[1].to[1]> == 1:
          - inventory add d:<[value].inventory> o:<item[custom_warped_shard]>
          - narrate "<&5>A strange sound travels through the air..." targets:<[value]>