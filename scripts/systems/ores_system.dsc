ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:|:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||<list[]>>
            - define drop_num:|:<yaml[server.ore_rates].list_keys[<context.material.name>.all]||<list[]>>
            - define num:0
            - foreach <[drop_num]> as:n:
                - define num:<[num].add[<el@1.div[<[n]>]>]>
            - define drop_num:<[drop_num].filter[is[OR_LESS].than[<[roll]>]].highest||0>
            - define to_drop:|:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>]||<list[]>>
            - define to_drop:|:<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>]||<item[custom_<context.material.name>]>>
            - narrate <[drop_num]>
            - narrate <[to_drop]>
            - narrate <[num]>