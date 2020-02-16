ore_system:
    type: world
    debug: true
    events:
        on script reload:
        - yaml create id:server.ores
        - foreach <server.list_scripts>:
            - if <[value].yaml_key[ore]||null> != null:
                - if <[value].yaml_key[ore.biome]> == "all":
                    - foreach <server.list_biome_types> as:biome:
                        - yaml id:server.ores set <[biome]>.<[value].yaml_key[ore.block]>:|:<[value].name>
                - else:
                    - yaml id:server.ores set <[value].yaml_key[ore.biome]>.<[value].yaml_key[ore.block]>:|:<[value].name>

        on player breaks block:
        - foreach <yaml[server.ores].read[all.<context.material.name>].include[<yaml[server.ores].read[<context.location.biome.name>.<context.material.name>]>]>:
            - narrate <[value]>

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