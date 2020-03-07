mob_drops_events:
  type: world
  events:
    on entity death:
      - if <context.damager.type||null> == player:
        - adjust <queue> linked_player:<context.damager>
      - define roll:<util.random.int[1].to[100]>
      - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>]||<list[]>>:
        - foreach <yaml[server.drop_rates].list_keys[<context.entity.script_name||<context.entity.entity_type>>.<[value]>]> as:key:
          - define drops:|:<[value]>/<el@1.div[<[key]>]>/<yaml[server.drop_rates].read[<context.entity.script_name||<context.entity.entity_type>>.<[value]>.<[key]>].split[/].get[1]>/<yaml[server.drop_rates].read[<context.entity.script_name||<context.entity.entity_type>>.<[value]>.<[key]>].split[/].get[2]>
          - define num:+:<el@1.div[<[key]>]>
      - define num:<[num]||0>
      - define to_drop:<list[]>
      - foreach <[drops]||<list[]>> as:drop:
        - define random:<util.random.decimal[0].to[1]>
        - define item:<item[<[drop].split[/].get[1]>]>
        - define chance:<[drop].split[/].get[2]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[drop].split[/].get[4]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - if <[chance]> > <[random]>:
          - drop <[item].with[quantity=<[amount]>]> <context.entity.location>

mob_spawning_events:
  type: world
  events:
    on delta time secondly every:10:
      - foreach <server.list_online_players> as:player:
        - adjust <queue> linked_player:<[player]>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.<player.location.biome.name>]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.<player.location.biome.name>]||<list[]>>
        - define list:<[list].deduplicate>
        - foreach <[list]> as:mob:
          - if <player.flag[<[mob]>]||null> == null:
            - define list:<-:<[mob]>
          - if <yaml[server.mobs].read[<[mob]>.max_y]> < <player.location.y> && <yaml[server.mobs].read[<[mob]>.min_y]> > <player.location.y>:
            - define list:<-:<[mob]>
          - if <player.location.material.name.is[==].to[water]> != <yaml[server.mobs].read[<[mob]>.water]>:
            - define list:<-:<[mob]>
          - if <list[<yaml[server.mobs].read[<[mob]>.time]>].contains[<player.location.world.time.period>]>:
            - if <yaml[server.mobs].read[<[mob]>.time]> != all:
              - define list:<-:<[mob]>
        - define mob_limiter:40
        - if <player.location.find.living_entities.within[50].size> < <[mob_limiter]>:
          - foreach <[list]> as:mob:
            - repeat 5:
              - if <player.flag[<[mob]>]||null> == null:
                - define offset:<proc[find_offset].context[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_distance]>].to[<yaml[server.mobs].read[<[mob]>.max_distance]>]>|<util.random.int[0].to[360]>]>
                - define spawning_point:<location[<player.location.x.add[<[offset].get[1]>]>,<player.location.y>,<player.location.z.add[<[offset].get[2]>]>,<player.location.world.name>]>
                - chunkload <[spawning_point].chunk> duration:2m
                - if <yaml[server.mobs].read[mob.air]>:
                  - if !<[spawning_point].highest.y> < <[spawning_point].y>:
                    - if <[spawning_point].y> < <yaml[server.mobs].read[<[mob]>.min_y]>:
                      - define spawning_point:<[spawning_point].with_y[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_y]>].to[<yaml[server.mobs].read[<[mob]>.max_y]>]>]>
                - else:
                  - if <[spawning_point].y> > <[spawning_point].highest.y>:
                    - define spawning_point:<[spawning_point].highest>
                  - else:
                    - repeat <[spawning_point].y.sub[<yaml[server.mobs].read[<[mob]>.max_y]>]>:
                      - define y:<[spawning_point].y.add[<[value]>]>
                      - if <[spawning_point].with_y[<[y]>].material.name> == air && <[spawning_point].with_y[<[y].add[1]>].material.name> == air && <[spawning_point].with_y[<[y].add[2]>].material.name> == air:
                        - define spawning_point:<[spawning_point].with_y[<[y]>].above[2]>
                - if <[spawning_point].material.name.is[==].to[water]> == <yaml[server.mobs].read[<[mob]>.water]>:
                  - repeat <util.random.int[<yaml[server.mobs].read[<[mob]>.min_quantity]>].to[<yaml[server.mobs].read[<[mob]>.max_quantity]>]>:
                    #- run spawn_custom_mob def:<[mob]>|<[spawning_point]>
                  - flag <player> <[mob]>:true duration:<yaml[server.mobs].read[<[mob]>.every]>
                  - inject <yaml[server.mobs].read[<[mob]>.spawn_script]>

spawn_custom_mob:
  type: task
  definitions: mob|location
  script:
    - spawn <[mob]> <[location].above> save:entity1
    - if <yaml[server.mobs].read[<[mob]>.abilities]||null> != null:
      - run mob_use_ability_handler def:<entry[entity1].spawned_entity>

mob_use_ability_handler:
  type: task
  definitions: entity
  script:
    - while <[entity].is_spawned||false>:
      - wait 1s
      - define ability:<yaml[server.mobs].read[<[entity].scriptname>.abilities].as_list.random>
      - if !<script[<[ability]>].yaml_key[additional_conditions].parse[parsed].contains[false]>:
        - while next
      - if <script[<[ability]>].yaml_key[requires_target]>:
        - if <[entity].target||null> == null:
          - while next
        - if <script[<[ability]>].yaml_key[requires_target_in_sight]>:
          - if !<[entity].target.location.line_of_sight[<[entity].location>]>:
            - while next
      - if <[entity].flag[<[ability]>]||null> == null:
        - define normal_speed:<[entity].speed>
        - adjust def:entity speed:0
        - wait <script[<[ability]>].yaml_key[requires_target_in_sight]>
        - adjust def:entity speed:<[normal_speed]>
        - run <[ability]> def:<[entity]>
        - flag <[entity]> <[ability]>