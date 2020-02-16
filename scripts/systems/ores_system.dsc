ore_system:
    type: world
    debug: true
    events:
    on player breaks block:
    - narrate <yaml[ore_config].read[biomes.<context.location.biome.name>.<context.material.name>]>

ore_config:
    type: yaml data
    biomes:
        all:
            stone:
                100:
                    - "coal_ore"