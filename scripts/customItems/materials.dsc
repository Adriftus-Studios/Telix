
custom_aluminum_nugget:
  material: iron_nugget
  recipe_book_category: equipment.aluminum
  display name: <&7>Aluminum Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_aluminum_ingot
custom_aluminum_ingot:
  material: iron_ingot
  recipe_book_category: equipment.aluminum
  recipe_book_category: equipment.aluminum
  display name: <&7>Aluminum Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_aluminum_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
      - custom_aluminum_nugget|custom_aluminum_nugget|custom_aluminum_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_aluminum_block
custom_aluminum_block:
  material: iron_block
  recipe_book_category: equipment.aluminum|materials.blocks
  display name: <&7>Aluminum Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
      - custom_aluminum_ingot|custom_aluminum_ingot|custom_aluminum_ingot
custom_aluminum_ore:
  material: iron_ore
  recipe_book_category: equipment.aluminum
  display name: <&7>Aluminum Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 130
custom_bronze_nugget:
  material: iron_nugget
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_bronze_ingot
custom_bronze_ingot:
  material: brick
  recipe_book_category: equipment.bronze
  display name: <&7>Bronze Ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 4m
      input: custom_tin_ingot/5|custom_copper_ingot/3
      output_quantity: 1
      type: smeltery
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_bronze_nugget|custom_bronze_nugget|custom_bronze_nugget
      - custom_bronze_nugget|custom_bronze_nugget|custom_bronze_nugget
      - custom_bronze_nugget|custom_bronze_nugget|custom_bronze_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_bronze_block
custom_bronze_block:
  material: iron_block
  recipe_book_category: equipment.bronze|materials.blocks
  display name: <&7>Bronze Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
      - custom_bronze_ingot|custom_bronze_ingot|custom_bronze_ingot
custom_constantan_nugget:
  material: iron_nugget
  recipe_book_category: equipment.constantan
  display name: <&7>Constantan Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_constantan_ingot
custom_constantan_ingot:
  material: brick
  recipe_book_category: equipment.constantan
  display name: <&7>Constantan Ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 4m
      input: custom_copper_ingot/5|custom_nickel_ingot/3
      output_quantity: 1
      type: smeltery
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_constantan_nugget|custom_constantan_nugget|custom_constantan_nugget
      - custom_constantan_nugget|custom_constantan_nugget|custom_constantan_nugget
      - custom_constantan_nugget|custom_constantan_nugget|custom_constantan_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_constantan_block
custom_constantan_block:
  material: iron_block
  recipe_book_category: equipment.constantan|materials.blocks
  display name: <&7>Constantan Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_constantan_ingot|custom_constantan_ingot|custom_constantan_ingot
      - custom_constantan_ingot|custom_constantan_ingot|custom_constantan_ingot
      - custom_constantan_ingot|custom_constantan_ingot|custom_constantan_ingot
custom_copper_nugget:
  material: iron_nugget
  recipe_book_category: equipment.copper
  display name: <&7>Copper Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_copper_ingot
custom_copper_ingot:
  material: brick
  recipe_book_category: equipment.copper
  display name: <&7>Copper Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_copper_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
      - custom_copper_nugget|custom_copper_nugget|custom_copper_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_copper_block
custom_copper_block:
  material: iron_block
  recipe_book_category: equipment.copper|materials.blocks
  display name: <&7>Copper Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
      - custom_copper_ingot|custom_copper_ingot|custom_copper_ingot
custom_copper_ore:
  material: iron_ore
  recipe_book_category: equipment.copper
  display name: <&7>Copper Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 100
custom_diamond:
  material: diamond
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 280
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_diamond_ore
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_diamond_block
custom_diamond_block:
  material: diamond_block
  recipe_book_category: equipment.diamond|materials.blocks
  display name: <&7>Diamond Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
      - custom_diamond|custom_diamond|custom_diamond
custom_diamond_ore:
  material: diamond_ore
  recipe_book_category: equipment.diamond
  display name: <&7>Diamond Ore
  weight: '1'
  type: item
custom_elementium_nugget:
  material: iron_nugget
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_elementium_ingot
custom_elementium_ingot:
  material: iron_ingot
  recipe_book_category: equipment.elementium
  display name: <&d>Elementium Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
      - custom_elementium_nugget|custom_elementium_nugget|custom_elementium_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_elementium_block
    3:
      type: altar
      tier: 4
      output_quantity: 1
      input: custom_terrasteel_ingot/2|custom_fire_rune/1|custom_earth_rune/1|custom_water_rune/1|custom_air_rune/1|custom_ender_rune/1
      cook_time: 10m
custom_elementium_block:
  material: iron_block
  recipe_book_category: equipment.elementium|materials.blocks
  display name: <&d>Elementium Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
      - custom_elementium_ingot|custom_elementium_ingot|custom_elementium_ingot
custom_gold_nugget:
  material: gold_nugget
  recipe_book_category: equipment.gold
  display name: <&7>Gold Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_gold_ingot
custom_gold_ingot:
  material: gold_ingot
  recipe_book_category: equipment.gold
  display name: <&7>Golden Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_gold_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
      - custom_gold_nugget|custom_gold_nugget|custom_gold_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_gold_block
custom_gold_block:
  material: gold_block
  recipe_book_category: equipment.gold|materials.blocks
  display name: <&7>Golden Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      hide_in_recipebook: true
      output_quantity: 1
      input:
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
      - custom_gold_ingot|custom_gold_ingot|custom_gold_ingot
custom_gold_ore:
  material: gold_ore
  recipe_book_category: equipment.gold
  display name: <&7>Golden Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 170
custom_iron_nugget:
  material: iron_nugget
  recipe_book_category: equipment.iron
  display name: <&7>Iron Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_iron_ingot
custom_iron_ingot:
  material: iron_ingot
  recipe_book_category: equipment.iron
  display name: <&7>Iron Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_iron_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
      - custom_iron_nugget|custom_iron_nugget|custom_iron_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_iron_block
custom_iron_block:
  material: iron_block
  recipe_book_category: equipment.iron|materials.blocks
  display name: <&7>Iron Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
      - custom_iron_ingot|custom_iron_ingot|custom_iron_ingot
custom_iron_ore:
  material: iron_ore
  recipe_book_category: equipment.iron
  display name: <&7>Iron Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 80
custom_lead_nugget:
  material: iron_nugget
  recipe_book_category: equipment.lead
  display name: <&7>Lead Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_lead_ingot
custom_lead_ingot:
  material: iron_ingot
  recipe_book_category: equipment.lead
  display name: <&7>Lead Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_lead_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
      - custom_lead_nugget|custom_lead_nugget|custom_lead_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_lead_block
custom_lead_block:
  material: iron_block
  recipe_book_category: equipment.lead
  display name: <&7>Lead Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
      - custom_lead_ingot|custom_lead_ingot|custom_lead_ingot
custom_lead_ore:
  material: iron_ore
  recipe_book_category: equipment.lead
  display name: <&7>Lead Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 80
custom_manasteel_nugget:
  material: iron_nugget
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_manasteel_ingot
custom_manasteel_ingot:
  material: iron_ingot
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
      - custom_manasteel_nugget|custom_manasteel_nugget|custom_manasteel_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_manasteel_block
    3:
      type: altar
      tier: 2
      output_quantity: 2
      input: custom_iron_ingot/3|custom_magic_powder/1|custom_diamond/1
      cook_time: 5m
custom_manasteel_block:
  material: iron_block
  recipe_book_category: equipment.manasteel
  display name: <&b>Manasteel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
      - custom_manasteel_ingot|custom_manasteel_ingot|custom_manasteel_ingot
custom_manaweave_cloth:
  type: item
  material: leather
  recipe_book_category: equipment.manaweave
  display name: <&b>Manaweave Cloth
  recipes:
    1:
      type: alchemy
      output_quantity: 1
      input: custom_manasteel_ingot/2|custom_leather/5|custom_magic_powder/1
      cook_time: 4m
custom_nickel_nugget:
  material: iron_nugget
  recipe_book_category: equipment.nickel
  display name: <&7>Nickel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_nickel_ingot
custom_nickel_ingot:
  material: iron_ingot
  recipe_book_category: equipment.nickel
  display name: <&7>Nickel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_nickel_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_nickel_nugget|custom_nickel_nugget|custom_nickel_nugget
      - custom_nickel_nugget|custom_nickel_nugget|custom_nickel_nugget
      - custom_nickel_nugget|custom_nickel_nugget|custom_nickel_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_nickel_block
custom_nickel_block:
  material: iron_block
  recipe_book_category: equipment.nickel
  display name: <&7>Nickel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_nickel_ingot|custom_nickel_ingot|custom_nickel_ingot
      - custom_nickel_ingot|custom_nickel_ingot|custom_nickel_ingot
      - custom_nickel_ingot|custom_nickel_ingot|custom_nickel_ingot
custom_nickel_ore:
  material: iron_ore
  recipe_book_category: equipment.nickel
  display name: <&7>Nickel Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 110
custom_obsidian_ingot:
  material: iron_ingot
  recipe_book_category: equipment.obsidian
  display name: <&7>Obsidian Ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 17m
      input: custom_obsidian/4|custom_diamond/1
      output_quantity: 1
      type: smeltery
custom_silver_nugget:
  material: iron_nugget
  recipe_book_category: equipment.silver
  display name: <&7>Silver Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_silver_ingot
custom_silver_ingot:
  material: iron_ingot
  recipe_book_category: equipment.silver
  display name: <&7>Silver Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_silver_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
      - custom_silver_nugget|custom_silver_nugget|custom_silver_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_silver_block
custom_silver_block:
  material: iron_block
  recipe_book_category: equipment.silver
  display name: <&7>Silver Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
      - custom_silver_ingot|custom_silver_ingot|custom_silver_ingot
custom_silver_ore:
  material: iron_ore
  recipe_book_category: equipment.silver
  display name: <&7>Silver Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 140
custom_steel_nugget:
  material: iron_nugget
  recipe_book_category: equipment.steel
  display name: <&7>Steel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_steel_ingot
custom_steel_ingot:
  material: iron_ingot
  recipe_book_category: equipment.steel
  display name: <&7>Steel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      cook_time: 4m
      input: custom_coal/6|custom_iron_ingot/2
      output_quantity: 1
      type: smeltery
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
      - custom_steel_nugget|custom_steel_nugget|custom_steel_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_steel_block
custom_steel_block:
  material: iron_block
  recipe_book_category: equipment.steel|materials.blocks
  display name: <&7>Steel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
      - custom_steel_ingot|custom_steel_ingot|custom_steel_ingot
custom_terrasteel_nugget:
  material: iron_nugget
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_terrasteel_ingot
    2:
      type: altar
      tier: 3
      output_quantity: 2
      input: custom_manasteel_block/2|custom_magic_powder/5|custom_rune_air/2|custom_rune_earth/3
      cook_time: 15m
custom_terrasteel_ingot:
  material: iron_ingot
  recipe_book_category: equipment.terrasteel
  display name: <&a>Terrasteel Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
      - custom_terrasteel_nugget|custom_terrasteel_nugget|custom_terrasteel_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_terrasteel_block
custom_terrasteel_block:
  material: iron_block
  recipe_book_category: equipment.terrasteel|materials.blocks
  display name: <&a>Terrasteel Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
      - custom_terrasteel_ingot|custom_terrasteel_ingot|custom_terrasteel_ingot
custom_tin_nugget:
  material: iron_nugget
  recipe_book_category: equipment.tin
  display name: <&7>Tin Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_tin_ingot
custom_tin_ingot:
  material: iron_ingot
  recipe_book_category: equipment.tin
  display name: <&7>Tin Ingot
  weight: '1'
  type: item
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_tin_ore
    2:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
      - custom_tin_nugget|custom_tin_nugget|custom_tin_nugget
    3:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_tin_block
custom_tin_block:
  material: iron_block
  recipe_book_category: equipment.tin|materials.blocks
  display name: <&7>Tin Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
      - custom_tin_ingot|custom_tin_ingot|custom_tin_ingot
custom_tin_ore:
  material: iron_ore
  recipe_book_category: equipment.tin
  display name: <&7>Tin Ore
  weight: '1'
  type: item
  ore:
    1:
      biome: all
      block: stone
      chance: 70
custom_warpmetal_nugget:
  material: iron_nugget
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal Nugget
  weight: '0'
  type: item
  recipes:
    1:
      type: shapeless
      output_quantity: 9
      input: custom_warpmetal_ingot
custom_warpmetal_ingot:
  material: iron_ingot
  recipe_book_category: equipment.warpmetal
  display name: <&a>Warpmetal
  weight: '1'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_warpmetal_nugget|custom_warpmetal_nugget|custom_warpmetal_nugget
      - custom_warpmetal_nugget|custom_warpmetal_nugget|custom_warpmetal_nugget
      - custom_warpmetal_nugget|custom_warpmetal_nugget|custom_warpmetal_nugget
    2:
      type: shapeless
      output_quantity: 9
      hide_in_recipebook: true
      input: custom_warpmetal_block
    3:
      type: smeltery
      output_quantity: 2
      input: custom_manasteel_ingot/3|custom_warped_shard/1
      cook_time: 2m
custom_warpmetal_block:
  material: iron_block
  recipe_book_category: equipment.warpmetal|materials.blocks
  display name: <&a>Warpmetal Block
  weight: '9'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      hide_in_recipebook: true
      input:
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
      - custom_warpmetal_ingot|custom_warpmetal_ingot|custom_warpmetal_ingot
custom_iridium_ingot:
  material: iron_ingot
  recipe_book_category: materials.ingots
  display name: <&7>Iridium Ingot
  weight: '1'
  type: item
  contaminated: 1
  lore:
  - <&2><&l>Contamination Level: 1
  recipes:
    1:
      type: furnace
      cook_time: 10s
      experience: 5
      input: custom_iridium_ore
custom_iridium_ore:
  material: iron_ore
  recipe_book_category: materials.ores
  display name: <&7>Iridium Ore
  weight: '1'
  type: item
  recipes:
  ore:
    1:
      biome: all
      block: stone
      chance: 700
custom_mundane_basic_nodestone:
  material: obsidian
  recipe_book_category: crafting.magic
  display name: <&7>Mundane Basic Nodestone
  lore:
  - "<&7>Inactive. Use an altar to charge."
  weight: '5'
  type: item
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - custom_aluminum_nugget|custom_aluminum_ingot|custom_aluminum_nugget
      - custom_aluminum_ingot|custom_silver_ingot|custom_aluminum_ingot
      - custom_aluminum_nugget|custom_aluminum_ingot|custom_aluminum_nugget
custom_charged_basic_nodestone:
  material: obsidian
  recipe_book_category: crafting.magic
  category: nodestone
  teleport_charges: 2
  display name: <&b>Basic Nodestone
  weight: '5'
  type: item
  recipes:
    1:
      type: altar
      tier: 1
      output_quantity: 1
      input: custom_mundane_basic_nodestone/1|custom_diamond/2
      cook_time: 30s
custom_depleted_nodestone:
  material: obsidian
  display name: <&7>Depleted Nodestone
  weight: '5'
  type: item
cannon_entity:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[stick].with[custom_model_data=6]>
  gravity: false
  visible: false
  invulnerable: true
cannon_events:
  type: world
  debug: false
  events:
    on player right clicks cannon_entity:
      


spawn_cannon_command:
  type: command
  name: spawn_cannon
  permission: spawn_cannon
  script:
  - spawn cannon_entity <player.location>