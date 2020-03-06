
mob_spawning_handler:
  type: world
  debug: true
  events:
    on delta time secondly every:5:
      - foreach <server.list_online_players> as:player:
        - adjust <queue> linked_player:<[player]>
        - define list:<list[]>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.all]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[all.<player.location.biome.name>]||<list[]>>
        - define list:|:<yaml[server.mob_spawns].list_keys[<player.location.world.name>.<player.location.biome.name>]||<list[]>>
        - define list:<[list].deduplicate>
        - define mob_limiter:40
        - if <player.location.find.living_entities.within[50].size> < <[mob_limiter]>:
          - foreach <[list]> as:mob:
            - repeat 5:
              - if !<player.flag[<[mob]>]||false>:
                - if <yaml[server.mobs].read[<[mob]>.max_y]> > <player.location.y> && <yaml[server.mobs].read[<[mob]>.min_y]> < <player.location.y>:
                  - define spawning_point:<proc[find_offset].context[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_distance]>].to[<yaml[server.mobs].read[<[mob]>.max_distance]>]>|<util.random.int[0].to[360]>]>
                  - if <[spawning_point].y> > <[spawning_point].highest>:
                    - define spawning_point:<[spawning_point].highest>
                  - else:
                    - repeat <[spawning_point].y.sub[<yaml[server.mobs].read[<[mob]>.max_y]>]>:
                      - define y:<[spawning_point].y.add[<[value]>]>
                      - if <[spawning_point].with_y[<[y]>].material.name> == air && <[spawning_point].with_y[<[y].add[1]>].material.name> == air && <[spawning_point].with_y[<[y].add[2]>].material.name> == air:
                        - define spawning_point:<[spawning_point].with_y[<[y]>]>
                  - spawn <[mob]> <[spawning_point]>
                  - flag <player> <[mob]>:true duration:<yaml[server.mobs].read[<[mob]>.every]>

mob_spawning_test_entity:
  type: entity
  entity_type: zombie
  spawning_conditions:
    world: all
    biome: all
    every: 1m
    air: false
    max_y: 255
    min_y: 50
    max_distance: 10
    min_distance: 5
    max_quantity: 5
    min_quantity: 3
    spawn_script: mob_spawning_test_script

mob_spawning_test_script:
  type: task
  script:
    - announce ttttt