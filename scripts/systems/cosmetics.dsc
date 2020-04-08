
pink_lucids_wing:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[rabbit_hide].with[custom_model_data=2]>
  gravity: false
  visible: false
  invulnerable: true

lucids_wing:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[rabbit_hide].with[custom_model_data=1]>
  gravity: false
  visible: false
  invulnerable: true


cosmetic_command:
  type: command
  name: cosmetic
  tab complete:
  - if <context.raw_args.split[].count[<&sp>]> == 0:
    - determine <list[curve1|sphere2|lucid1|lucid2].filter[starts_with[<context.args.get[1]||>]]>
  - else:
    - determine <list[]>
  script:
  - if <player.has_flag[cosmetic]>:
    - if <context.args.get[1]> == lucid3:
      - if <player.has_flag[lucid]>:
        - narrate "<&b>Deactivated cosmetic effect lucid"
        - flag <player> lucid:!
      - else:
        - narrate "<&b>Activated cosmetic effect lucid"
        - flag <player> lucid
        - spawn pink_lucids_wing <player.location.below[0.5]> save:wing1
        - spawn pink_lucids_wing <player.location.below[0.5]> save:wing2
        - define left_wing:<entry[wing1].spawned_entity>
        - define right_wing:<entry[wing2].spawned_entity>
        - adjust <[left_wing]> armor_pose:head|0,<element[30].to_radians>,0
        - adjust <[right_wing]> armor_pose:head|0,<element[-30].to_radians>,0
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
      - while <player.has_flag[lucid]>:
        - teleport <[left_wing]> <player.location.below[0.5]>
        - teleport <[right_wing]> <player.location.below[0.5]>
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
        - wait 1t
        - if !<player.is_online>:
          - while stop
      - if <[left_wing]||null> != null:
        - remove <[left_wing]>
      - if <[right_wing]||null> != null:
        - remove <[right_wing]>
    - if <context.args.get[1]> == lucid2:
      - if <player.has_flag[lucid]>:
        - narrate "<&b>Deactivated cosmetic effect lucid"
        - flag <player> lucid:!
      - else:
        - narrate "<&b>Activated cosmetic effect lucid"
        - flag <player> lucid
        - spawn lucids_wing <player.location.below[0.5]> save:wing1
        - spawn lucids_wing <player.location.below[0.5]> save:wing2
        - define left_wing:<entry[wing1].spawned_entity>
        - define right_wing:<entry[wing2].spawned_entity>
        - adjust <[left_wing]> armor_pose:head|0,<element[30].to_radians>,0
        - adjust <[right_wing]> armor_pose:head|0,<element[-30].to_radians>,0
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
      - while <player.has_flag[lucid]>:
        - teleport <[left_wing]> <player.location.below[0.5]>
        - teleport <[right_wing]> <player.location.below[0.5]>
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
        - wait 1t
        - if !<player.is_online>:
          - while stop
      - if <[left_wing]||null> != null:
        - remove <[left_wing]>
      - if <[right_wing]||null> != null:
        - remove <[right_wing]>
    - if <context.args.get[1]> == lucid1:
      - if <player.has_flag[lucid]>:
        - narrate "<&b>Deactivated cosmetic effect lucid"
        - flag <player> lucid:!
      - else:
        - narrate "<&b>Activated cosmetic effect lucid"
        - flag <player> lucid
        - spawn lucids_wing <player.location.below[0.5]> save:wing1
        - spawn lucids_wing <player.location.below[0.5]> save:wing2
        - define left_wing:<entry[wing1].spawned_entity>
        - define right_wing:<entry[wing2].spawned_entity>
        - define sphere:<proc[define_sphere1].context[<player.location>|3|1]>
        - define center:<player.location>
        - adjust <[left_wing]> armor_pose:head|0,<element[30].to_radians>,0
        - adjust <[right_wing]> armor_pose:head|0,<element[-30].to_radians>,0
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
      - while <player.has_flag[lucid]>:
        - teleport <[left_wing]> <player.location.below[0.5]>
        - teleport <[right_wing]> <player.location.below[0.5]>
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
        - define offset:<player.location.sub[<[center]>]>
        - run cosmetic_command_lucid_animation def:<[offset].add[<[sphere].random>].with_world[<player.location.world>]>|<[offset].add[<[sphere].random>].with_world[<player.location.world>]>
        - wait 1t
        - if !<player.is_online>:
          - while stop
      - if <[left_wing]||null> != null:
        - remove <[left_wing]>
      - if <[right_wing]||null> != null:
        - remove <[right_wing]>
    - if <context.args.get[1]> == sphere2:
      - define layers:<proc[define_sphere2].context[<player.location.above>|1.5|0.3]>
      - define center:<player.location>
      - flag <player> sphere2:true
      - if <player.has_flag[sphere]>:
        - narrate "<&b>Deactivated cosmetic effect sphere2"
        - flag <player> sphere:!
      - else:
        - narrate "<&b>Activated cosmetic effect sphere2"
        - flag <player> sphere
      - while <player.has_flag[sphere]||false>:
        - repeat <[layers].size>:
          - define offset:<player.location.sub[<[center]>]>
          - define points:<[layers].get[<[value]>].unescaped>
          - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
          - playeffect redstone at:<[points].parse[add[<[offset]>].with_world[<player.location.world>]]> quantity:1 offset:0 visibility:100 special_data:1|<co@159,152,216>
          - wait 1t
        - if !<player.is_online>:
          - while stop
    - else if <context.args.get[1]> == curve1:
      - define sphere:<proc[define_sphere1].context[<player.location>|1.5|1]>
      - define center:<player.location>
      - if <player.has_flag[curve]>:
        - narrate "<&b>Deactivated cosmetic effect curve1"
        - flag <player> curve:!
      - else:
        - narrate "<&b>Activated cosmetic effect curve1"
        - flag <player> curve
      - while <player.has_flag[curve]||false>:
        - define point:<[sphere].random>
        - define offset:<player.location.sub[<[center]>]>
        - run cosmetic_command_curve1_animation def:<player.location>|<[offset].add[<[point]>].with_world[<player.location.world>]>
        - wait 3t
        - if !<player.is_online>:
          - while stop
  - else:
    - narrate "<&c>You do not have permission for this command."

cosmetic_command_lucid_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|0|0.1]>
  - define color:<list[<co@221,91,182>|<co@169,191,250>|<co@121,160,213>|<co@135,172,169>].random>
  - foreach <[points]> as:point:
    - playeffect redstone <[point]> offset:0 visibility:300 quantity:1 special_data:1|<[color]>
    - wait 1t

cosmetic_command_curve1_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|0|0.1]>
  - foreach <[points]> as:point:
    - playeffect spell_witch <[point]> offset:0 visibility:300 quantity:1
    - wait 1t

lucids_wing:
  type: entity
  entity_type: armor_stand
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[rabbit_hide].with[custom_model_data=1]>
  gravity: false
  visible: false
  invulnerable: true

cosmetic_command:
  type: command
  name: cosmetic
  tab complete:
  - if <context.raw_args.split[].count[<&sp>]> == 0:
    - determine <list[curve1|sphere2|lucid1|lucid2].filter[starts_with[<context.args.get[1]||>]]>
  - else:
    - determine <list[]>
  script:
  - if <player.has_flag[cosmetic]>:
    - if <context.args.get[1]> == lucid2:
      - if <player.has_flag[lucid]>:
        - narrate "<&b>Deactivated cosmetic effect lucid"
        - flag <player> lucid:!
      - else:
        - narrate "<&b>Activated cosmetic effect lucid"
        - flag <player> lucid
        - spawn lucids_wing <player.location.below[0.5]> save:wing1
        - spawn lucids_wing <player.location.below[0.5]> save:wing2
        - define left_wing:<entry[wing1].spawned_entity>
        - define right_wing:<entry[wing2].spawned_entity>
        - adjust <[left_wing]> armor_pose:head|0,<element[30].to_radians>,0
        - adjust <[right_wing]> armor_pose:head|0,<element[-30].to_radians>,0
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
      - while <player.has_flag[lucid]>:
        - teleport <[left_wing]> <player.location.below[0.5]>
        - teleport <[right_wing]> <player.location.below[0.5]>
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
        - wait 1t
        - if !<player.is_online>:
          - while stop
      - if <[left_wing]||null> != null:
        - remove <[left_wing]>
      - if <[right_wing]||null> != null:
        - remove <[right_wing]>
    - if <context.args.get[1]> == lucid1:
      - if <player.has_flag[lucid]>:
        - narrate "<&b>Deactivated cosmetic effect lucid"
        - flag <player> lucid:!
      - else:
        - narrate "<&b>Activated cosmetic effect lucid"
        - flag <player> lucid
        - spawn lucids_wing <player.location.below[0.5]> save:wing1
        - spawn lucids_wing <player.location.below[0.5]> save:wing2
        - define left_wing:<entry[wing1].spawned_entity>
        - define right_wing:<entry[wing2].spawned_entity>
        - define sphere:<proc[define_sphere1].context[<player.location>|3|1]>
        - define center:<player.location>
        - adjust <[left_wing]> armor_pose:head|0,<element[30].to_radians>,0
        - adjust <[right_wing]> armor_pose:head|0,<element[-30].to_radians>,0
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
      - while <player.has_flag[lucid]>:
        - teleport <[left_wing]> <player.location.below[0.5]>
        - teleport <[right_wing]> <player.location.below[0.5]>
        - adjust <player> passengers:<list[<[left_wing]>|<[right_wing]>]>
        - define offset:<player.location.sub[<[center]>]>
        - run cosmetic_command_lucid_animation def:<[offset].add[<[sphere].random>].with_world[<player.location.world>]>|<[offset].add[<[sphere].random>].with_world[<player.location.world>]>
        - wait 1t
        - if !<player.is_online>:
          - while stop
      - if <[left_wing]||null> != null:
        - remove <[left_wing]>
      - if <[right_wing]||null> != null:
        - remove <[right_wing]>
    - if <context.args.get[1]> == sphere2:
      - define layers:<proc[define_sphere2].context[<player.location.above>|1.5|0.3]>
      - define center:<player.location>
      - flag <player> sphere2:true
      - if <player.has_flag[sphere]>:
        - narrate "<&b>Deactivated cosmetic effect sphere2"
        - flag <player> sphere:!
      - else:
        - narrate "<&b>Activated cosmetic effect sphere2"
        - flag <player> sphere
      - while <player.has_flag[sphere]||false>:
        - repeat <[layers].size>:
          - define offset:<player.location.sub[<[center]>]>
          - define points:<[layers].get[<[value]>].unescaped>
          - define points:|:<[layers].get[<[layers].size.sub[<[value]>]>].unescaped>
          - playeffect redstone at:<[points].parse[add[<[offset]>].with_world[<player.location.world>]]> quantity:1 offset:0 visibility:100 special_data:1|<co@159,152,216>
          - wait 1t
        - if !<player.is_online>:
          - while stop
    - else if <context.args.get[1]> == curve1:
      - define sphere:<proc[define_sphere1].context[<player.location>|1.5|1]>
      - define center:<player.location>
      - if <player.has_flag[curve]>:
        - narrate "<&b>Deactivated cosmetic effect curve1"
        - flag <player> curve:!
      - else:
        - narrate "<&b>Activated cosmetic effect curve1"
        - flag <player> curve
      - while <player.has_flag[curve]||false>:
        - define point:<[sphere].random>
        - define offset:<player.location.sub[<[center]>]>
        - run cosmetic_command_curve1_animation def:<player.location>|<[offset].add[<[point]>].with_world[<player.location.world>]>
        - wait 3t
        - if !<player.is_online>:
          - while stop
  - else:
    - narrate "<&c>You do not have permission for this command."

cosmetic_command_lucid_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|0|0.1]>
  - define color:<list[<co@221,91,182>|<co@169,191,250>|<co@121,160,213>|<co@135,172,169>].random>
  - foreach <[points]> as:point:
    - playeffect redstone <[point]> offset:0 visibility:300 quantity:1 special_data:1|<[color]>
    - wait 1t

cosmetic_command_curve1_animation:
  type: task
  definitions: start|end
  script:
  - define points:<proc[define_curve1].context[<[start]>|<[end]>|1|0|0.1]>
  - foreach <[points]> as:point:
    - playeffect spell_witch <[point]> offset:0 visibility:300 quantity:1
    - wait 1t