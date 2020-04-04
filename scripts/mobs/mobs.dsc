mob_drops_events:
  type: world
  events:
    on entity death:
      - if <context.damager.type||null> == player:
        - adjust <queue> linked_player:<context.damager>
      - foreach <yaml[server.drop_rates].list_keys[<context.entity.script.name||<context.entity.entity_type>>]||<list[]>>:
        - foreach <yaml[server.drop_rates].list_keys[<context.entity.script.name||<context.entity.entity_type>>.<[value]>]> as:key:
          - define drops:|:<[value]>/<el@1.div[<[key]>]>/<yaml[server.drop_rates].read[<context.entity.script.name||<context.entity.entity_type>>.<[value]>.<[key]>].split[/].get[1]>/<yaml[server.drop_rates].read[<context.entity.script.name||<context.entity.entity_type>>.<[value]>.<[key]>].split[/].get[2]>
          - define num:+:<el@1.div[<[key]>]>
      - define num:<[num]||0>
      - define to_drop:<list[]>
      - run playerLevel_GiveXP def:<context.entity.script.yaml_key[custom.xp_dropped]||1>
      - foreach <[drops]||<list[]>> as:drop:
        - define random:<util.random.decimal[0].to[1]>
        - define item:<item[<[drop].split[/].get[1]>]>
        - define chance:<[drop].split[/].get[2]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[drop].split[/].get[4]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - define amount:<util.random.int[<[drop].split[/].get[3]>].to[<[amount]>]>
        - if <server.has_flag[global_mob_drop_multiplier]>:
          - define amount:<[amount].mul[<server.flag[global_mob_drop_multiplier]>]>
        - if <[chance]> > <[random]>:
          - drop <[item].with[quantity=<[amount]>]> <context.entity.location>
      - if <server.has_flag[global_mob_drop_multiplier]>:
        - foreach <context.drops> as:drop:
          - define list:|:<[drop].with[quantity=<[drop].quantity.mul[<server.flag[global_mob_drop_multiplier]>]>]>
        - determine <[list]||<list[]>>
    on entity damages entity:
      - if <context.entity.script||null> != null:
        - if <context.entity.script.yaml_key[custom.kill_health]||null> != null:
          - if <context.entity.health.-[<context.final_damage>]> <= <context.entity.script.yaml_key[custom.kill_health]>:
            - determine <context.entity.health>
        - if <context.entity.script.yaml_key[custom.aggressive]||true>:
          - attack <context.entity> target:<context.damager>
      - if <context.entity.script.yaml_key[custom.events.on<&sp>attacked]||null> != null:
        - run <context.entity.script.name> path:custom.events.on<&sp>attacked def:<context.entity>
      

mob_spawning_events:
  type: world
  events:
    on delta time secondly every:30:
      - foreach <server.list_online_players> as:player:
        - adjust <queue> linked_player:<[player]>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.<player.location.biome.name>]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.<player.location.biome.name>]||<list[]>>
        - define list:<[list].deduplicate>
        - foreach <[list]> as:mob:
          - if <yaml[server.mobs].read[<[mob]>.max_y]> < <player.location.y>:
            - define list:<-:<[mob]>
          - if <yaml[server.mobs].read[<[mob]>.min_y]> > <player.location.y>:
            - define list:<-:<[mob]>
          - if <player.location.material.name.is[==].to[water]> != <yaml[server.mobs].read[<[mob]>.water]>:
            - define list:<-:<[mob]>
          - if <list[<yaml[server.mobs].read[<[mob]>.time]>].as_list.contains[<player.location.world.time.period>]> && <yaml[server.mobs].read[<[mob]>.time]> != all:
            - define list:<-:<[mob]>
          - if <player.location.world.living_entities.filter[scriptname.to_lowercase.is[==].to[<[mob]>]].size||0> != 0:
            - if <player.location.world.living_entities.filter[scriptname.to_lowercase.is[==].to[<[mob]>]].size> >= <yaml[server.mobs].read[<[mob]>.per_world_limit]>:
              - define list:<-:<[mob]>
          - if <player.location.highest.y> >= <player.location.y.add[1]>:
            - define list:<-:<[mob]>
          - if <util.random.int[1].to[<yaml[server.mobs].read[<[mob]>.chance].mul[60]>]> == 1 && <yaml[server.mobs].read[<[mob]>.chance]> != 0:
            - define list:<-:<[mob]>
        - define mob_limiter:25
        - if <player.location.find.living_entities.within[25].size||0> < <[mob_limiter]>:
          - foreach <[list]> as:mob:
            - repeat 5:
              - if <player.flag[<[mob]>]||null> == null:
                - define offset:<proc[find_offset].context[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_distance]>].to[<yaml[server.mobs].read[<[mob]>.max_distance]>]>|<util.random.int[0].to[360]>]>
                - define spawning_point:<location[<player.location.x.add[<[offset].get[1]>]>,<player.location.y>,<player.location.z.add[<[offset].get[2]>]>,<player.location.world.name>]>
                - chunkload <[spawning_point].chunk> duration:2m
                - if <yaml[server.mobs].read[<[mob]>.air]>:
                  - if <[spawning_point].highest.y||null> == null || <[spawning_point].y||null> == null:
                    - narrate <[spawning_point].y>
                    - narrate <[spawning_point].highest.y>
                    - narrate <[mob]>
                  - if !<[spawning_point].highest.y||128> < <[spawning_point].y>:
                    - if <[spawning_point].y> < <yaml[server.mobs].read[<[mob]>.min_y]>:
                      - define spawning_point:<[spawning_point].with_y[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_y]>].to[<yaml[server.mobs].read[<[mob]>.max_y]>]>]>
                - else:
                  - if <[spawning_point].y> > <[spawning_point].highest.y>:
                    - define spawning_point:<[spawning_point].highest>
                  - else:
                    - repeat <[spawning_point].y.sub[<yaml[server.mobs].read[<[mob]>.max_y]>]>:
                      - define y:<[spawning_point].y.add[<[value]>]>
                      - if <[spawning_point].with_y[<[y]>].material.name> == air && <[spawning_point].with_y[<[y].add[1]>].material.name> == air && <[spawning_point].with_y[<[y].add[2]>].material.name> == air && <[spawning_point].with_y[<[y].sub[1]>].material.is_solid>:
                        - define spawning_point:<[spawning_point].with_y[<[y]>].above[2]>
                - if <[spawning_point].material.name.is[==].to[water]> == <yaml[server.mobs].read[<[mob]>.water]>:
                  - repeat <util.random.int[<yaml[server.mobs].read[<[mob]>.min_quantity]>].to[<yaml[server.mobs].read[<[mob]>.max_quantity]>]>:
                    - if !<server.has_flag[no_mob_spawning]>:
                      - run spawn_custom_mob def:<[mob]>|<[spawning_point].with_y[<[spawning_point].y.add[2]>]>
                  - flag <player> <[mob]>:true duration:<yaml[server.mobs].read[<[mob]>.every]>

spawn_custom_mob:
  type: task
  definitions: mob|location
  script:
    - spawn <[mob]> <[location].above> save:entity1
    - define spawned_entity:<entry[entity1].spawned_entity>
    - narrate <yaml[server.mobs].read[<[mob]>.abilities]||null>
    - if <yaml[server.mobs].read[<[mob]>.aggressive_on_spawn]||true> && !<player.has_flag[safemode]>:
      - attack <[spawned_entity]> target:<player>
    - if <yaml[server.mobs].read[<[mob]>.spawn_script]||none> != none:
      - inject <yaml[server.mobs].read[<[mob]>.spawn_script]>
    - if <yaml[server.mobs].read[<[mob]>.abilities]||null> != null:
      - run mob_use_ability_handler def:<[spawned_entity]>

mob_use_ability_handler:
  type: task
  definitions: entity
  script:
    - announce 0
    - while <[entity].is_spawned||false>:
      - wait 1s
      - announce 1
      - define ability:<yaml[server.mobs].read[<[entity].scriptname>.abilities].as_list.random||null>
      - if <[ability]> == null:
        - while next
      - announce 2
      - if !<script[<[ability]>].yaml_key[additional_conditions].parse[parsed].contains[false]||false>:
        - while next
      - announce 3
      - if <script[<[ability]>].yaml_key[requires_target]>:
        - if <[entity].target||null> == null:
          - while next
        - if <script[<[ability]>].yaml_key[requires_target_in_sight]>:
          - if !<[entity].target.location.line_of_sight[<[entity].location>]>:
            - while next
      - announce 4
      - if <[entity].flag[<[ability]>]||null> == null:
        - define normal_speed:<[entity].speed>
        - adjust def:entity speed:0
        - wait <script[<[ability]>].yaml_key[warmup]>
        - adjust def:entity speed:<[normal_speed]>
        - run <[ability]> def:<[entity]>
        - flag <[entity]> <[ability]> duration:<script[<[ability]>].yaml_key[cooldown]>
      
#When pets are a thing, sort out - if <player.target.scriptname> != entity_*
golem_repair_events:
  type: world
  debug: false
  events:
    on player right clicks entity with:custom_iron_ingot:
      - if <context.entity.entity_type> == iron_golem && <context.item.material.name> == iron_ingot:
        - determine cancelled
