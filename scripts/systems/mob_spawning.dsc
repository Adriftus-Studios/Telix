
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
        - foreach <[list]> as:mob:
          - if !<player.flag[<[mob]>]>:
            - repeat 5:
              - define spawning_point:<proc[find_offset].context[<util.random.int[<yaml[server.mobs].read[<[mob]>.min_distance]>].to[<yaml[server.mobs].read[<[mob]>.max_distance]>]>|<util.random.int[0].to[360]>]>
              - repeat stop

mob_spawning_test_entity:
  type: entity
  entity_type: armor_stand
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