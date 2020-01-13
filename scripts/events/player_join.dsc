player_join_event:
  type: world
  events:
    on player joins:
      - if <yaml[player.<player.uuid>].read[stats.level]||null> == null:
        - inject stats_setup
      - wait 1t
      - adjust <player> health_scale:20
      - inject playerLevel_showXP
<<<<<<< HEAD
      - if <player.equipment.get[1].material.name> == air:
=======
      - if <player.equipment.contains[air]>:
>>>>>>> d8e2ccad088ee0a7668fd261198881ba5fcd3f04
        - inject system_equipment_set