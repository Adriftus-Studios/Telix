
cannon_base_entity:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[stick].with[custom_model_data=7]>
  gravity: false
  visible: false
  invulnerable: false
  custom:
    interactable: false
cannon_entity:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[stick].with[custom_model_data=6]>
  gravity: false
  visible: false
  invulnerable: false
  custom:
    interactable: false
cannon_events:
  type: world
  debug: false
  events:
    on player right clicks cannon_base_entity:
      - determine passively cancelled
      - teleport <player> <context.entity.location>
      - flag <player> no_fly_kick
      - repeat 100:
        - if !<player.is_online>:
          - stop
        - adjust <player> velocity:<context.entity.location.forward[2].sub[<context.entity.location>]>
        - wait 1t
      - inject rtp_task
    on player right clicks cannon_entity:
      - determine passively cancelled
      - teleport <player> <context.entity.location>
      - flag <player> no_fly_kick
      - repeat 100:
        - if !<player.is_online>:
          - stop
        - adjust <player> velocity:<context.entity.location.forward[2].sub[<context.entity.location>]>
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