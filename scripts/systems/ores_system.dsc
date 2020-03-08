ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - define roll:<util.random.int[1].to[100]>
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[ore]>]>
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.all]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.all.<[ore]>]>
            - narrate <[drops]>