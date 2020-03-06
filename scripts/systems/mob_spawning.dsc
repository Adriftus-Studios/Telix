
mob_spawning_handler:
  type: world
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
                  - narrate <[spawning_point].simple>
                  - repeat <util.random.int[<yaml[server.mobs].read[<[mob]>.min_quantity]>].to[<yaml[server.mobs].read[<[mob]>.max_quantity]>]>:
                    - spawn mob_spawning_test_entity <[spawning_point]>
                  - flag <player> <[mob]>:true duration:<yaml[server.mobs].read[<[mob]>.every]>
                  - inject <yaml[server.mobs].read[<[mob]>.spawn_script]>
