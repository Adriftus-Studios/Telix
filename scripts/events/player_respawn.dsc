player_respawn:
  type: world
  events:
    on player respawns bukkit_priority:HIGHEST:
      - inject survival_stats_reset
      - inject system_equipment_set