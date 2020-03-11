
custom_waterhag_hand:
  type: item
  material: rotten_flesh
  recipe_book_category: materials.alchemy
  display name: <&7>Waterhag's Hand
  mob_drops:
    1:
      dropped_by: entity_waterhag
      chance: 4
      max_quantity: 2
      min_quantity: 1

custom_venom_extract:
  type: item
  material: potion
  recipe_book_category: materials.alchemy
  display name: <&7>Venom Extract
  mechanisms:
    flags: HIDE_POTION_EFFECTS
    color: 0,0,0
    potion_effects: poison,5,20
  mob_drops:
    1:
      dropped_by: entity_direwolf
      chance: 9
      max_quantity: 1
      min_quantity: 1

custom_blizz_rod:
  type: item
  material: blue_ice
  recipe_book_category: materials.alchemy
  display name: <&7>Blizz Rod
  mob_drops:
    1:
      dropped_by: entity_icewolf|entity_frost_golem|entity_icicle_guardian
      chance: 4
      max_quantity: 2
      min_quantity: 1

custom_small_husk:
  type: item
  material: bone
  recipe_book_category: materials.alchemy
  display name: <&7>Small Husk
  mob_drops:
    1:
      dropped_by: entity_sand_rat
      chance: 12
      max_quantity: 2
      min_quantity: 1

custom_moth_wing:
  type: item
  material: leather
  recipe_book_category: materials.alchemy
  display name: <&7>Moth Wing
  mob_drops:
    1:
      dropped_by: entity_frost_moth|entity_jungle_moth|entity_sky_moth
      chance: 12
      max_quantity: 2
      min_quantity: 1

custom_aerotheum:
  material: redstone
  recipe_book_category: materials.alchemy
  display name: <&a>Aerotheum
  weight: '1'
  type: item
  recipes:
    1:
      type: smeltery
      output_quantity: 4
      input: custom_antler/2|custom_tin_ingot/1|custom_constantan_ingot/2


## Potions
custom_glass_bottle:
  material: glass_bottle
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Glass Bottle
  weight: '1'
  type: item
custom_potion:
  material: potion
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Potion
  weight: '1'
  type: item
custom_lingering_potion:
  material: lingering_potion
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Lingering Potion
  weight: '1'
  type: item
custom_splash_potion:
  material: splash_potion
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Splash Potion
  weight: '1'
  type: item
## Materials
custom_blaze_powder:
  material: blaze_powder
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Blaze Powder
  weight: '1'
  type: item
custom_nether_wart:
  material: nether_wart
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Nether Wart
  weight: '1'
  type: item
#Redstone is in custom_items.dsc
custom_glowstone_dust:
  material: glowstone_dust
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Glowstone Dust
  weight: '1'
  type: item
custom_fermented_spider_eye:
  material: fermented_spider_eye
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Fermented Spider Eye
  weight: '1'
  type: item
#Gunpowder is a mob drop in custom_items.dsc
custom_dragon_breath:
  material: dragon_breath
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: "<&7>Dragon's Breath"
  weight: '1'
  type: item
custom_sugar:
  material: sugar
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Sugar
  weight: '1'
  type: item
custom_rabbit_foot:
  material: rabbit_foot
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: "<&7>Rabbit's Foot"
  weight: '1'
  type: item
custom_glistering_melon_slice:
  material: glistering_melon_slice
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Glistering Melon Slice
  weight: '1'
  type: item
#Spider Eye is a mob drop in custom_items.dsc
custom_pufferfish:
  material: pufferfish
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Pufferfish
  weight: '1'
  type: item
custom_magma_cream:
  material: magma_cream
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Magma Cream
  weight: '1'
  type: item
custom_ghast_tear:
  material: ghast_tear
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Ghast Tear
  weight: '1'
  type: item
#Turtle Shell is a mob drop in custom_items.dsc
#Phantom Membrane is a mob drop in custom_items.dsc
## Blocks
custom_brewing_stand:
  material: brewing_stand
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Brewing Stand
  weight: '1'
  type: item
custom_cauldron:
  material: cauldron
  lore:
  - <&6>
  - '<&8>Item Weight: <script.yaml_key[weight]>'
  display name: <&7>Cauldron
  weight: '1'
  type: item