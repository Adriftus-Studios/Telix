player_respawn:
  type: world
  events:
    on player respawns bukkit_priority:HIGHEST:
      - yaml id:player.<player.uuid> set stats.food.current:100
      - yaml id:player.<player.uuid> set stats.thirst.current:100
      - yaml id:player.<player.uuid> set stats.temperature:100
      - inject system_equipment_set