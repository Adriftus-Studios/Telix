ore_system:
    type: world
    debug: true
    events:
        on script reload:
        - yaml create id:server.ores
        - foreach <server.list_scripts>:
            - if <[value].yaml_key[ore]||null> != null:
                - yaml id:server.ores set ores:|:<[value].name>
        on player breaks block:
        - narrate <yaml[ore_config].read[biomes.<context.location.biome.name>.<context.material.name>]>

iron_ore:
    type: item
    debug: true
    material: iron_ore
    ore:
        biome: all
        block: stone
        chance: 60

coal_ore:
    type: item
    debug: true
    material: coal_ore
    ore:
        biome: all
        block: stone
        chance: 60