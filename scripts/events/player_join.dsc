player_join_event:
  type: world
  events:
    on player joins:
      - if <yaml[player.<player.uuid>].read[stats.basespeed]||null> == null:
        - inject stats_setup
      - wait 1t
      - adjust <player> health_scale:20
      - inject playerLevel_showXP
      - if <player.equipment.get[1].material.name> == air:
        - inject system_equipment_set