custom_feed_command:
  type: command
  name: feed
  description: Feed yourself
  usage: /feed
  permission: custom.command.feed
  script:
    - run setPlayerData def:stats.food.current|<yaml[player.<player.uuid>].read[stats.food.max]>
    - narrate "<&5>You have been fed"

custom_drink_command:
  type: command
  name: drink
  description: Quench your thirst.
  usage: /drink
  permission: custom.command.drink
  script:
    - run setPlayerData def:stats.thirst.current|<yaml[player.<player.uuid>].read[stats.thirst.max]>
    - narrate "<&5>You drink water"


custom_heal_command:
  type: command
  name: heal
  description: Fully heal yourself.
  usage: /heal
  script:
    - yaml id:player.<player.uuid> set stats.food.current:<yaml[player.<player.uuid>].read[stats.food.max]>
    - yaml id:player.<player.uuid> set stats.thirst.current:<yaml[player.<player.uuid>].read[stats.thirst.max]>
    - heal
    - adjust <player> food_level:19
    - narrate "<&5>You are fully healed"