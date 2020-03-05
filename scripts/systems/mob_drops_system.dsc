mob_drops_events:
  type: world
  debug: true
  events:
    on entity death:
      - if <context.damager.type||null> == player:
        - adjust <queue> linked_player:<context.damager>
      - define roll:<util.random.int[1].to[100]>
      - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>]||<list[]>>:
        - narrate <[value]>
        - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>.<[value]>]> as:key:
          - define drops:|:<[value]>/<el@1.div[<[key]>]>/<yaml[server.drop_rates].read[<context.entity.script_name||<context.entity.entity_type>>.<[value]>.<[key]>]>
          - define num:+:<el@1.div[<[key]>]>
      - define num:<[num]>
      - define to_drop:<list[]>
      - foreach <[drops]||<list[]>> as:drop:
        - define random:<util.random.decimal[0].to[1]>
        - define item:<item[<[drop].split[/].get[1]>]>
        - define chance:<[drop].split[/].get[2]>
        - define amount:<util.random.int[0].to[<[drop].split[/].get[3]>]>
        - if <[chance]> > <[random]>:
          - drop <[item].with[quantity=<[amount]>]> <context.entity.location>

custom_mob_drops_test_item:
  type: item
  material: dirt
  display name: <&b>Test Item
  mob_drops:
    1:
      dropped_by: zombie
      chance: 1
      amount: 64
    2:
      dropped_by: spider
      chance: 5
      amount: 2