mob_drops_events:
    type: world
    debug: false
    events:
        on entity death:
            - define roll:<util.random.int[1].to[100]>
            - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>]||<list[]>>:
                - define num:+:<el@1.div[<[value]>]>
            - define num:<[num].mul[50]||100>
            - narrate <[num]>