ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:|:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]>
            - define drop_num:|:<yaml[server.ore_rates].list_keys[<context.material.name>.all]>
            - define drop_num:<[drop_num].filter[is[OR_LESS].than[<[roll]>]]>
            - define to_drop:|:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>]||<list[]>>
            - define to_drop:|:<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>]||<item[custom_<context.material.name>]>>
            - define all:<yaml[server.ore_rates].list_keys[<context.material.name>.all]||<list[]>>
            - define all:|:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||<list[]>>
            - narrate <[drop_num]>
            - narrate <[to_drop]>
            - stop
            - if <player.gamemode> == SURVIVAL:
                - if !<player.item_in_hand.enchantments.contains[silk_touch]>:
                    - if <util.random.decimal[0].to[100]> > <[num]>:
                        - define to_drop:<item[custom_<context.location.drops[<player.item_in_hand>].get[1].material.name>]>
                    - else:
                        - define to_drop:<item[<[to_drop]>]>
                - if <[to_drop]||null> != null:
                    - determine <[to_drop]>