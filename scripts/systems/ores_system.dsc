ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - yaml create id:location
            - yaml id:location savefile:DONT_PUT_SHIT_IN_HERE/_<context.location>_.yml
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>].include[<yaml[server.ore_rates].list_keys[<context.material.name>.all]>].filter[is[OR_LESS].than[<[roll]>]].highest||<yaml[server.ore_rates].list_keys[<context.material.name>.all].filter[is[OR_LESS].than[<[roll]>]].highest||0>>
            - define to_drop:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>]||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>]||<item[custom_<context.material.name>]>>>>>
            - foreach <yaml[server.ore_rates].list_keys[stone.all]>:
                - define num:+:<[value]>
            - narrate <[num]>
            - if <player.gamemode> == SURVIVAL:
                - if !<player.item_in_hand.enchantments.contains[silk_touch]>:
                    - if <util.random.int[1].to[20]> != 1:
                        - define to_drop:<item[<item[custom_<context.material.name>].yaml_key[default_drop]||null>]||null>
                    - else:
                        - define to_drop:<context.location.drops[<player.item_in_hand>]>
                - if <[to_drop]||null> != null:
                    - determine <[to_drop]>