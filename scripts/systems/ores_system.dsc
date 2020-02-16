ore_system:
    type: world
    debug: true
    events:
        on script reload:
        - yaml create id:server.ores
        - foreach <server.list_scripts>:
            - if <[value].yaml_key[ore]||null> != null:
                - yaml id:server.ores set <[value].yaml_key[ore.biome]>.<[value].yaml_key[ore.block]>:|:<[value].name>

ore_rates:
    type: yaml data
    all:
        50:
            - "custom_iron_ore"
    swamp:
        25:
            - "custom_coal_ore"

ore_drop_events:
    type: world
    debug: true
    events:
        on player breaks block:
            - yaml create id:location
            - yaml id:location savefile:DONT_PUT_SHIT_IN_HERE/_<context.location>_.yml
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:<script[ore_rates].list_keys[<context.location.biome>].include[<script[ore_rates].list_keys[all]>].filter[is[OR_LESS].than[<[roll]>].highest>
            - define to_drop:<script[ore_rates].read[<context.location.biome>.<[drop_num]>].random||script[ore_rates].read[all.<[drop_num]>].random>>

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
