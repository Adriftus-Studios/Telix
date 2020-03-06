
# -----[ Custom Ores ]-----

custom_ore:
  material: iron_ore
  display name: <&7>Custom ore
  weight: '1'
  type: item
  ore:
      biome: all
	  # The biome that this ore drops in
      block: stone
	  # The block that drops this ore
      chance: 20
	  # Chance that the block will drop the ore.
	  # This is calculated from 1 out of "chance"
	  # So 1 out of 20 means 5% chance to drop this ore
    
# -----[ Custom Equipment ]-----

test_hat:
  type: item
  material: gold_ingot
  category: pants
  # What type of equipment is this item
  # Can be a Necklace, Earrings, Ring, Trinket, Pants, Shoes, Shirt, Gloves, Cape, or a Hat
  weight: 150
  equipment_rating: 5
  # How good is this piece of equipment
  max_stars: 5
  # How many times can this piece of equipment be enhanced
  sockets: 1
  # How many sockets this piece of equipment can have
  equipment_modifiers:
	# What stat modifiers should the player have when wearing this item
    health:
      max: 100
      min: 10
    speed:
      max: 100
      min: 10
    weight:
      max: 100
      min: 10
    power:
      max: 100
      min: 10
    food:
      max: 100
      min: 10
    thirst:
      max: 100
      min: 10
    constitution:
      max: 100
      min: 10
    melee_damage:
      max: 100
      min: 10
    experience_multiplier:
      max: 100
      min: 10
    drop_rate_multiplier:
      max: 100
      min: 10
  display name: "<&c>Test Hat"
  lore:
    - "Something something Hat,"
    - "Something rare something lore"
  drops_on_death: true
  
# Or

test_ring:
  type: item
  material: gold_ingot
  category: ring
  # What type of equipment is this item
  # Can be a Necklace, Earrings, Ring, Trinket, Pants, Shoes, Shirt, Gloves, Cape, or a Hat
  weight: 1000
  equipment_rating: 10
  # How good is this piece of equipment
  max_stars: 10
  # How many times can this piece of equipment be enhanced
  sockets: 3
  # How many sockets this piece of equipment can have
  equipment_modifiers:
	# What stat modifiers should the player have when wearing this item
	# This can have a set value
    health: 100
    speed: 100
    drop_rate_multiplier: 100
	# Or a range of values
    melee_damage:
      max: 100
      min: 10
  display name: "<&c>Test Ring"
  lore:
    - "Something something ring,"
    - "Something rare something lore"
  drops_on_death: true

# -----[ Smeltery Recipes ]-----

smeltery_test_recipe1:
  material: iron_ingot
  display name: <&7>Smeltery Test Recipe 1
  weight: '1'
  type: item
  recipes:
    1:
      type: smeltery
      output_quantity: 1
	  # What ingredients this recipe requires, in format ItemTag/Quantity
      input: custom_coal/6|custom_iron_ingot/2
	  # How many items this recipe will produce
      cook_time: 4m
	  # How long it takes to craft this item, as a DurationTag
    
# -----[ Altar Recipes ]-----

altar_test_recipe1:
  type: item
  material: cobblestone
  display name: <&7>Altar test recipe 1
  recipes:
    1:
      type: altar
      output_quantity: 2
	  # How many items this recipe will produce
      input: custom_stone/1|custom_dirt/2
	  # What ingredients this recipe requires, in format ItemTag/Quantity
      cook_time: 10s
	  # How long it takes to craft this item, as a DurationTag
    
# -----[ Alchemy Station Recipes ]-----

alchemy_station_test_recipe1:
  type: item
  material: cobblestone
  display name: <&7>Something
  recipes:
    1:
      type: alchemy
      output_quantity: 2
	  # How many items this recipe will produce
      input: custom_stone/1|custom_dirt/2
	  # What ingredients this recipe requires, in format ItemTag/Quantity
      cook_time: 10s
	  # How long it takes to craft this item, as a DurationTag
    
# -----[ Custom Entity Spawn Conditions ]-----

mob_spawning_test_entity:
  type: entity
  entity_type: zombie
  custom:
    spawning_conditions:
      world: all
      # world that the mob can spawn in
      biome: all
      # biome that the mob can spawn in
      every: 5m
      # delay between each mob spawn. this is per player
      air: false
      # does the mob fly / does the mob spawn in air
      max_y: 255
      min_y: 50
      # what Y-level the mob spawns at
      max_distance: 10
      min_distance: 5
      # how far from the player the mob is supposed to spawn at
      max_quantity: 5
      min_quantity: 3
      # how many mobs spawn at the same time
      spawn_script: mob_spawning_test_script
      # a script that is executed when the mob spawns

mob_spawning_test_script:
  type: task
  script:
    # <player> is the player that caused the mob to spawn.
    - narrate "Spooky action at a distance"
    
# -----[ Custom Mob Drops ]-----
  
custom_mob_drops_test_item:
  type: item
  material: dirt
  display name: <&b>Test Item
  mob_drops:
    1:
      dropped_by: zombie
      # what mob drops this item
      # can be a vanilla mob, or a custom mob
      chance: 4
      # the chance that this mob will drop this item
	    # This is calculated from 1 out of "chance"
      # So 1 out of '4' means 25% chance to drop
      max_quantity: 4
      # Max amount of items to drop
      min_quantity: 1
      # Optional minimum amount of items to drop
      # If no minimum is specified, defaults to 1
    2:
      dropped_by: spider
      chance: 5
      min_quantity: 3
      max_quantity: 7