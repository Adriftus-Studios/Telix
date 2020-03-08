ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - define roll:<util.random.int[1].to[100]>
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[ore]>]>/<[ore]>
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.all]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.all.<[ore]>]>/<[ore]>
            - foreach <[drops]> as:drop:
                - if <util.random.int[1].to[<[drop].split[/].get[2]>]> == 1:
                    - define to_drop:|:<[drop].split[/].get[1]>
            - if <[to_drop]||null> != null:
                - determine <item[<[to_drop].random>]>