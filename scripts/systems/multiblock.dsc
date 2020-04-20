multiblock_testblock:
  type: item
  material: furnace
  multiblock: guild_bank

multiblock_testtask:
  type: task
  script:
    - narrate "Woo! it worked!"

multiblock_types:
  type: yaml data
  guild_bank:
    armor_stand: armor_stand
    on_click_task: multiblock_testtask

multiblock_place:
  type: world
  events:
    on player places block:
      - determine passively cancelled
      - wait 1t
      - if <context.item_in_hand.script.yaml_key[multiblock]||null> == null:
        - stop
      - define location:<context.location.with_yaw[<player.location.yaw.round_to_precision[90]>].with_pitch[0]>
      - define cuboid:<cuboid[<[location].left>|<[location].forward_flat[2].right.above[2]>]>
      - define cuboid2:<cuboid[<[location].left>|<[location].right.above[2]>]>
      - if <[cuboid].blocks[air].size> != 27:
        - narrate "<&c>There is not enough room in this location."
        - narrate "<&e>This block requires a 3x3 space to be placed."
        - stop
      - define uuid:<util.random.uuid>
      - note <[cuboid]> as:multiblock-area.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>
      - note <[cuboid2]> as:multiblock-usable.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>
      - note <context.item> as:multiblock-item.<context.item_in_hand.script.yaml_key[multiblock]>^<[uuid]>
      - modifyblock <[cuboid].outline> stone
      - modifyblock <[cuboid].center> torch
      - spawn <script[multiblock_types].yaml_key[<context.item_in_hand.script.yaml_key[multiblock]>.armor_stand]> <[cuboid].center>
    on player right clicks stone:
      - define cuboids:<context.location.cuboids.filter[starts_with[multiblock-usable]]>
      - if <[cuboids].size> > 0:
        - foreach <[cuboids]>:
          - run <script[multiblock_types].yaml_key[<[value].notable_name.after[.].before[^]>.on_click_task]>
    on player breaks stone bukkit_priority:MONITOR:
      - define cuboids:<context.location.cuboids.filter[starts_with[multiblock-area]]>
      - if <[cuboids].size> > 0:
        - foreach <[cuboids]>:
          - define identifier:<[value].notable_name.after[.]>
          - define item_to_drop:<item[multiblock-item.<[identifier]>]>
          - modifyblock <cuboid[multiblock-area.<[identifier]>]> air
          - remove <[value].center.find.entities[armor_stand].within[1]>
          - note remove as:multiblock-item.<[identifier]>
          - note remove as:multiblock-usable.<[identifier]>
          - note remove as:multiblock-area.<[identifier]>
          - drop <[item_to_drop]> <context.location>
        
        
        


        