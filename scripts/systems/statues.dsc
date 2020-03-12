statues_inventory:
  type: inventory
  title: Statues
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

statue_baseplate:
  type: entity
  entity_type: armor_stand
  visible: false
  gravity: false
  invulnerable: true
  equipment: <item[air]>|<item[air]>|<item[air]>|<item[custom_statue_baseplate]>

custom_statue_baseplate:
  type: item
  material: armor_stand
  mechanisms:
    custom_model_data: 1
  display name: Statue Baseplate

custom_statue_creeper_normal:
  type: item
  material: armor_stand
  mechanisms:
    custom_model_data: 2
  display name: Creeper Statue
  statue:
    size: normal
    entity: creeper

custom_statue_zombie_normal:
  type: item
  material: armor_stand
  mechanisms:
    custom_model_data: 2
  display name: Zombie Statue
  statue:
    size: normal
    entity: zombie

statues_events:
  type: world
  events:
    on player right clicks block with custom_statue_*:
      - determine passively cancelled
      - if <context.item.script.name> == custom_statue_baseplate:
        - adjust <context.relative> block_type:barrier
        - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
        - spawn <entity[statue_baseplate]> <context.location.center.up[0.5]> save:statue
        - note <inventory[statues_inventory]> as:statue_<context.relative>
        - inventory adjust d:<inventory[statue_<context.relative>]> slot:1 nbt:entity/<entry[statue].spawned_entity>
    on player right clicks barrier:
      - if <inventory[statue_<context.location>]||null> != null:
        - inventory open d:<inventory[statue_<context.location>]>
    on player opens statues_inventory:
      - inventory set d:<context.inventory> slot:14 o:<context.inventory.slot[1].nbt[entity].as_entity.equipment.helmet>
    on player clicks in statues_inventory:
      - if <context.raw_slot> < 28:
        - if <context.raw_slot> == 14:
          - if <context.item.script.name> == custom_statue_baseplate:
            - if <context.cursor_item.material.name> == air:
              - determine passively cancelled
            - else if <context.cursor_item.script.yaml_key[statue]||null> != null:
              - wait 1t
              - adjust <player> item_on_cursor:<item[air]>
              - adjust <context.inventory.slot[1].nbt[entity].as_entity> equipment:<item[air]>|<item[air]>|<item[air]>|<context.cursor_item>
          - else:
            - if <context.cursor_item.material.name> == air:
              - wait 1t
              - adjust <context.inventory.slot[1].nbt[entity].as_entity> equipment:<item[air]>|<item[air]>|<item[air]>|<item[custom_statue_baseplate]>
            - else if <context.cursor_item.script.yaml_key[statue]||null> != null:
              - wait 1t
              - adjust <context.inventory.slot[1].nbt[entity].as_entity> equipment:<item[air]>|<item[air]>|<item[air]>|<context.cursor_item>
        - determine passively cancelled
        - define pose:<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head]>
        - if <context.raw_slot> == 16:

        - if <context.raw_slot> == 17:
          - narrate <context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head]>
          - adjust <context.inventory.slot[1].nbt[entity].as_entity> armor_pose:head|<context.inventory.slot[1].nbt[entity].as_entity.armor_pose[head].add[1,0,0]>