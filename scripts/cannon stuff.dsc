
cannon_base_entity:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[stick].with[custom_model_data=7]>
  gravity: false
  visible: true
  invulnerable: false
  custom:
    interactable: false

cannon_entity:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[stick].with[custom_model_data=6]>
  gravity: false
  visible: true
  invulnerable: false
  custom:
    interactable: false

cannon_events:
  type: world
  debug: false
  events:
    on player right clicks cannon_base_entity ignorecancelled:true:
      - determine passively cancelled
      - teleport <player> <context.entity.location>
      - flag <player> no_fly_kick
      - playeffect explosion_huge at:<context.entity.location.forward[3]>  offset:0 visibility:300 quantity:1
      - repeat 100:
        - if !<player.is_online>:
          - flag <player> no_fly_kick:!
          - flag <player> no_fall:!
          - stop
        - adjust <player> velocity:<context.entity.location.forward[4].sub[<context.entity.location>]>
        - wait 1t
      - inject rtp_task
    on player right clicks cannon_entity ignorecancelled:true:
      - determine passively cancelled
      - teleport <player> <context.entity.location>
      - flag <player> no_fly_kick
      - playeffect explosion_huge at:<context.entity.location.forward[3]>  offset:0 visibility:300 quantity:1
      - repeat 100:
        - if !<player.is_online>:
          - flag <player> no_fly_kick:!
          - flag <player> no_fall:!
          - stop
        - adjust <player> velocity:<context.entity.location.forward[4].sub[<context.entity.location>]>
        - wait 1t
      - inject rtp_task
    on player kicked for flying:
      - if <player.has_flag[no_fly_kick]> || <player.fake_block[<player.location.below>]||null> != null:
        - determine cancelled

spawn_cannon_command:
  type: command
  name: spawn_cannon
  permission: spawn_cannon
  script:
  - spawn cannon_base_entity <player.location>
  - spawn cannon_entity <player.location> save:cannon
  - define cannon:<entry[cannon].spawned_entity>
  - adjust <[cannon]> armor_pose:head|<player.location.pitch.to_radians>,0,0
  - narrate "Done"
  
rtp_task:
  type: task
  definitions: player
  script:
  - adjust <queue> linked_player:<[player]||<player>>
  - repeat 100:
    - define x:<util.random.decimal[<element[-4000]>].to[<element[4000]>].round_to[3]>
    - define z:<util.random.decimal[<element[-4000]>].to[<element[4000]>].round_to[3]>
    - chunkload <location[<[x]>,300,<[z]>,tor_mainland].chunk> duration:1s
    - if <location[<[x]>,300,<[z]>,tor_mainland].biome.name.contains_text[ocean]>:
      - repeat next
    - teleport <player> <location[<[x]>,300,<[z]>,tor_mainland]>
    - define x:<util.random.decimal[-1].to[1].round_to[3]>
    - define z:<util.random.decimal[-1].to[1].round_to[3]>
    - flag <player> no_fall
    - while <player.location.below[0.15].material.name> == air || <player.location.below[0.15].material.name> == void_air:
      - if !<player.is_online>:
        - flag <player> no_fly_kick:!
        - flag <player> no_fall:!
        - stop
      - adjust <player> velocity:<location[<[x]>,-1,<[z]>]>
      - wait 1t
    - wait 1s
    - flag <player> no_fly_kick:!
    - flag <player> no_fall:!
    - repeat stop
