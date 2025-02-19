multiblock_testblock:
  type: item
  material: furnace
  multiblock: guild_bank

multiblock_testtask:
  type: task
  script:
    - narrate "This would activate the multiblock task script!"

multiblock_teststand:
  type: entity
  entity_type: armor_stand
  marker: true
  visible: false
  equipment: air|air|air|stick[custom_model_data=8]

multiblock_types:
  type: yaml data
  guild_bank:
    armor_stand: guild_vault_entity
    on_click_task: multiblock_testtask
    on_place_task: null

multiblock_place:
  type: world
  events:
    on player places block bukkit_priority:HIGHEST:
      - if <context.item_in_hand.script.yaml_key[multiblock]||null> == null:
        - stop
      - define this_yaw:<player.location.yaw.round_to_precision[90]>
      - determine passively cancelled
      - wait 1t
      - define location:<context.location.with_yaw[<[this_yaw]>].with_pitch[0]>
      - define cuboid:<cuboid[<[location].left>|<[location].forward_flat[2].right.above[2]>]>
      - define cuboid2:<cuboid[<[location].left>|<[location].right.above[2]>]>
      - if <[cuboid].blocks[air].size> != 27:
        - narrate "<&c>There is not enough room in this location."
        - narrate "<&e>This block requires a 3x3 space to be placed."
        - stop
      - define uuid:<util.random.uuid>
      - note <[cuboid]> as:multiblock-area.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>
      - note <[cuboid2]> as:multiblock-usable.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>
      - flag server multiblock-item.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>:<context.item_in_hand.script.name>
      - modifyblock <[cuboid].blocks.exclude[<[cuboid].center>]> stone
      - modifyblock <[cuboid].center> torch
      - spawn <script[multiblock_types].yaml_key[<context.item_in_hand.script.yaml_key[multiblock]>.armor_stand]> <[cuboid].center.with_yaw[<[this_yaw].-[180]>]>
      - if <script[multiblock_types].yaml_key[<context.item_in_hand.script.yaml_key[multiblock]>.on_place_task]||null> != null:
        - inject <script[multiblock_types].yaml_key[<context.item_in_hand.script.yaml_key[multiblock]>.on_place_task]>
    on player right clicks stone:
      - define cuboids:<context.location.cuboids.parse[notable_name].filter[starts_with[multiblock-usable]]>
      - if <[cuboids].size> > 0:
        - foreach <[cuboids]>:
          - run <script[multiblock_types].yaml_key[<[value].after[.].before[^]>.on_click_task]>
    on player breaks stone|air bukkit_priority:MONITOR priority:10000:
      - define cuboids:<context.location.cuboids.parse[notable_name].filter[starts_with[multiblock-area]]>
      - if <[cuboids].size> > 0:
        - foreach <[cuboids]>:
          - define identifier:<[value].as_cuboid.notable_name.after[.]>
          - define item_to_drop:<server.flag[multiblock-item.<[identifier]>].as_item>
          - remove <[value].as_cuboid.center.find.entities[armor_stand].within[1]>
          - modifyblock <cuboid[multiblock-area.<[identifier]>].center> air
          - modifyblock <cuboid[multiblock-area.<[identifier]>]> air
          - flag server multiblock-item.<[identifier]>:!
          - note remove as:multiblock-usable.<[identifier]>
          - note remove as:multiblock-area.<[identifier]>
          - drop <[item_to_drop]> <context.location>
          - if <script[multiblock_types].yaml_key[<[identifier].after[^]>.on_place_task]||null> != null:
            - inject <script[multiblock_types].yaml_key[<[identifier].after[^]>.on_break_task]>

        