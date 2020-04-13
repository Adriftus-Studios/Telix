ability_ender_world:
  type: task
  name: ender_world
  ability_tree: Ender
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Transport yourself to the ender world.
  icon:
    material: iron_nugget
    custom_model_data: 106
  script:
    - inject abilities_check
    - inject abilities_cost
    - if !<player.has_flag[ender_world]>:
      - adjust <player> hide_from_players:true
      - adjust <player> vision:enderman
      - foreach <server.list_online_players_flagged[ender_world]>:
        - adjust <[value]> show_entity:<player>
        - adjust <player> show_entity:<[value]>
      - flag <player> ender_world:true
      - playsound <player.location> sound:magic.vanish volume:0.5 pitch:1.0 custom
    - else:
      - adjust <player> vision
      - foreach <server.list_online_players_flagged[ender_world]>:
        - adjust <player> hide_entity:<[value]>
      - flag <player> ender_world:!
      - adjust <player> show_to_players:true
      - playsound <player.location> sound:magic.teleport volume:0.5 pitch:1.0 custom

    