statues_inventory:
  type: inventory
  title: Statues
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
    rotate_btn: <item[compass].with[display_name=<&c>Rotate<&sp>;lore=<&d>Right/Left<&sp>Click<&sp>to<&sp>rotate<&sp>90<&sp>degrees.|<&d>Shift<&sp>Click<&sp>to<&sp>rotate<&sp>22.5<&sp>degrees.]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler] [rotate_btn] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

entity_statue:
  type: entity
  entity_type: armor_stand
  visible: false
  gravity: false
  invulnerable: true

custom_statue_creeper_normal:
  type: item
  material: armor_stand
  mechanisms:
    custom_model_data: 2
  display name: Creeper Statue
  statue:
    size: normal
    entity: creeper

statues_events:
  type: world
  events:
    on player right clicks block with custom_statue_*:
      - determine passively cancelled
      - adjust <context.relative> block_type:barrier
      - adjust <context.relative.up[1]> block_type:barrier
      - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
      - spawn <entity[entity_statue]> <context.location.center.up[0.5]> save:statue
      - adjust <entry[statue].spawned_entity> equipment:<item[air]>|<item[air]>|<item[air]>|<context.item.with[quantity=1]>
      - note <inventory[statues_inventory]> as:statue_<context.relative>
      - inventory adjust d:<inventory[statue_<context.relative>]> slot:1 nbt:entity/<entry[statue].spawned_entity>
    on player clicks barrier:
      - if <player.is_sneaking>:
        - if <inventory[statue_<context.location>]||null> != null:
          - remove <inventory[statue_<context.location>].slot[1].nbt[entity].as_entity>
          - adjust <context.location> block_type:air
          - adjust <context.location.up[1]> block_type:air
          - note remove as:statue_<context.location>
        - if <inventory[statue_<context.location.down[1]>]||null> != null:
          - remove <inventory[statue_<context.location.down[1]>].slot[1].nbt[entity].as_entity>
          - adjust <context.location> block_type:air
          - adjust <context.location.down[1]> block_type:air
          - note remove as:statue_<context.location.down[1]>
    on player right clicks barrier:
      - if <inventory[statue_<context.location>]||null> != null:
        - inventory open d:<inventory[statue_<context.location>]>
      - if <inventory[statue_<context.location.down[1]>]||null> != null:
        - inventory open d:<inventory[statue_<context.location.down[1]>]>
    on player opens statues_inventory:
      - inventory set d:<context.inventory> slot:14 o:<context.inventory.slot[1].nbt[entity].as_entity.equipment.helmet>
    on player clicks in statues_inventory:
      - if <context.raw_slot> < 28:
        - determine passively cancelled
        - define pose:<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head]>
        - narrate <context.is_shift_click>
        - if <context.raw_slot> == 17:
          - if <context.click> == shift_right:
            - adjust <context.inventory.slot[1].nbt[entity].as_entity> armor_pose:head|<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head].add[0,<el@22.5.to_radians>,0]>
          - if <context.click> == shift_left:
            - adjust <context.inventory.slot[1].nbt[entity].as_entity> armor_pose:head|<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head].add[0,<el@-22.5.to_radians>,0]>
          - if <context.click> == right:
            - adjust <context.inventory.slot[1].nbt[entity].as_entity> armor_pose:head|<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head].add[0,<el@90.to_radians>,0]>
          - if <context.click> == left:
            - adjust <context.inventory.slot[1].nbt[entity].as_entity> armor_pose:head|<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head].add[0,<el@-90.to_radians>,0]>