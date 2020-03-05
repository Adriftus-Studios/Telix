mob_drops_events:
  type: world
  debug: true
  events:
    on entity death:
      - define roll:<util.random.int[1].to[100]>
      - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>]||<list[]>>:
        - narrate <[value]>
        - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>.<[value]>]> as:key:
          - define drops:|:<[value]>/<el@1.div[<[key]>]>/<yaml[server.drop_rates].read[<context.entity.script_name||<context.entity.entity_type>>.<[value]>.<[key]>]>
          - define num:+:<el@1.div[<[key]>]>
      - narrate <[drops]>
      - define num:<[num]>
      - foreach <[drops]> as:drop:
        - define random:<util.random.decimal[0].to[100]>
        - if <[drop].split[/].get[2]> > <[random]>:
          - define to_drop:|:<item[<[drop].split[/].get[1]>]>