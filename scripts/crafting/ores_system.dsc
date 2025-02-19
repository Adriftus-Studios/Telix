ore_drop_events:
    type: world
    debug: false
    events:
        on player breaks block:
            - if <server.list_files[DONT_PUT_SHIT_IN_HERE/blocks/<context.location.simple>/].get[1]||null> != null:
                - stop
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.<context.location.biome.name>]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.<context.location.biome.name>.<[ore]>]>/<[ore]>
            - foreach <yaml[server.ore_rates].list_keys[<context.material.name>.all]||<list[]>> as:ore:
                - define drops:|:<yaml[server.ore_rates].read[<context.material.name>.all.<[ore]>]>/<[ore]>
            - foreach <[drops]||<list[]>> as:drop:
                - define tool:<yaml[server.recipe_book].read[ore_spawn.<[drop].split[/].get[1]>.tool]||all>
                - if <[tool]> == <player.item_in_hand.script.name||null> || <[tool]> == all:
                    - if !<yaml[server.recipe_book].read[ore_spawn.<[drop].split[/].get[1]>.conditions].parse[parsed].contains[false]||false>:
                        - if <util.random.int[1].to[<[drop].split[/].get[2]||30>]||0> == 1:
                            - define to_drop:|:<[drop].split[/].get[1]>
            - if <[to_drop]||null> != null:
                - if <proc[fake_durability_use].context[<player.item_in_hand>]||null> != null:
                    - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<proc[fake_durability_use].context[<player.item_in_hand>]>
                - run playerLevel_GiveXP def:1
                - if <server.has_flag[double_ore_drops]>:
                    - define item:<item[<[to_drop].random>].with[quantity=2]>
                - else:
                    - define item:<item[<[to_drop].random>]>
                - inject build_item
                - event "player mines block" context:location|<context.location>|material|<context.material>|xp|<context.xp>|item|<[item]>|script|<[item].script.name>
                - event "player mines <[to_drop]>" context:location|<context.location>|material|<context.material>|xp|<context.xp>|item|<[item]>|script|<[item].script.name>
                - determine <[item]>