ore_drop_events:
    type: world
    debug: true
    events:
        on player breaks block:
            - yaml create id:location
            - yaml id:location savefile:DONT_PUT_SHIT_IN_HERE/_<context.location>_.yml
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>].include[<yaml[server.ore_rates].list_keys[<context.material.name>.all]>].filter[is[OR_LESS].than[<[roll]>]].highest||<yaml[server.ore_rates].list_keys[<context.material.name>.all].filter[is[OR_LESS].than[<[roll]>]].highest>>
            - define to_drop:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>]||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>]>>>>
            - narrate <[drop_num]>
            - narrate <context.material.name>.all.<[drop_num]>
            - narrate <[to_drop]>
            - determine <[to_drop]>

custom_iron_ore:
    type: item
    debug: true
    material: iron_ore
    ore:
        biome: all
        block: stone
        chance: 10

custom_coal_ore:
    type: item
    debug: true
    material: coal_ore
    ore:
        biome: all
        block: stone
        chance: 60
