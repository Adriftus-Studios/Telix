citadel_events:
  type: world
  events:
    on player clicks block with *_lock:
      - if <context.location.material.name.ends_with[_door]> || <context.location.material.name.ends_with[_trapdoor]>:
        - run lock_door def:<player>|<context.location>|<context.item.script.yaml_key[lock_strength]>
    on delta time secondly every:1:
      - foreach <server.list_flags.filter[starts_with[unload_timer_]]>:
        - if <server.flag[<[value]>].expiration.in_seconds> <= 1:
          - yaml id:<[value].replace[unload_timer_].with[]> unload

lock_door:
  type: task
  definitions: player|location|strength
  script:
  - yaml id:locked_door_<[location].simple> create
  - yaml id:locked_door_<[location].simple> set strength:<[strength]>
  - yaml id:locked_door_<[location].simple> set owner:<[player]>
  - yaml id:locked_door_<[location].simple> savefile:DONT_PUT_SHIT_IN_HERE/locked_doors/<[location].simple>.yml
  - flag server unload_timer_locked_door_<[location].simple> duration:10s

unload_timer:
  type: task
  definitions: id|duration
  script:
  - flag server unload_timer_<[id]> duration:<[duration]>

custom_iron_lock:
  type: item
  material: iron_ingot
  display name: <&7>Iron Lock
  lock_strength: 100

custom_lock_pick:
  type: item
  material: stick
  display name: <&7>Lock Pick