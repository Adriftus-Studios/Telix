teleport_tor_spawn_command:
  type: command
  debug: true
  name: tpisland
  description: Temp command to TP you to the main hub
  usage: /tpisland
  script:
    - teleport <player> <location[-41,70,-74,tor_spawn]>
    - narrate "<&5>You were teleported"

teleport_tor_main_command:
  type: command
  debug: true
  name: tpmain
  description: Temp command to TP you to the main world
  usage: /tpmain
  script:
    - teleport <player> <location[-41,70,-74,tor_mainland]>
    - narrate "<&5>You were teleported"