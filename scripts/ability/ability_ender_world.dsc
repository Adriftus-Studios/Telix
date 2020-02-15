ability_ender_world:
  type: task
  name: ender_world
  ability_tree: Demonic
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Transport yourself to the ender world.
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - if !<player.has_flag[ender_world]>:
      - adjust <player> hide_from_players:true
      - adjust <player> vision:enderman
      - foreach <server.list_online_players_flagged[ender_world]>:
        - adjust <[value]> show_entity:<player>
      - flag <player> ender_world:true
    - else:
      - adjust <player> show_to_players:true
      - adjust <player> vision
      - foreach <server.list_online_players_flagged[ender_world]>:
        - adjust <player> hide_entity:<[value]>

    