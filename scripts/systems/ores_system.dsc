ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - define roll:<util.random.int[1].to[100]>
            - define drop_num:<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>].include[<yaml[server.ore_rates].list_keys[<context.material.name>.all]>].filter[is[OR_LESS].than[<[roll]>]].highest||<yaml[server.ore_rates].list_keys[<context.material.name>.all].filter[is[OR_LESS].than[<[roll]>]].highest||0>>
            - define to_drop:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>].random||<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[drop_num]>]||<yaml[server.ore_rates].read[<context.material.name>.all.<[drop_num]>]||<item[custom_<context.material.name>]>>>>>
            - define all:<list[]>
            - if <yaml[server.ore_rates].list_keys[stone.all]||null> != null:
                - define all:<[all].include[<yaml[server.ore_rates].list_keys[<context.material.name>.all]>]>
            - if <yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||null> != null:
                - define all:<[all].include[<yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]>]>
            - foreach <[all]>:
                - define num:+:<el@1.div[<[value]>]>
            - define num:<[num].mul[50]||100>
            - if <player.gamemode> == SURVIVAL:
                - if !<player.item_in_hand.enchantments.contains[silk_touch]>:
                    - if <util.random.decimal[0].to[100]> > <[num]>:
                        - define to_drop:<item[custom_<context.location.drops[<player.item_in_hand>].get[1].material.name>]>
                    - else:
                        - define to_drop:<item[<[to_drop]>]>
                - if <[to_drop]||null> != null:
                    - determine <[to_drop]>