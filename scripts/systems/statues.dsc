statues_inventory:
  type: inventory
  title: Statues
  size: 27
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"

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

statues_events:
  type: world
  events:
    on player right clicks block with custom_statue_*:
      - determine passively cancelled
      - if <context.item.script.name> == custom_statue_baseplate:
        - adjust <context.relative> block_type:barrier
        - inventory adjust d:<player.inventory> slot:<player.held_item_slot> quantity:<player.item_in_hand.quantity.sub[1]>
        - spawn <entity[statue_baseplate]> <context.location.center>
        - note <inventory[statues_inventory]> as:statue_<context.relative>
    on player right clicks barrier:
      - if <inventory[statue_<context.location>]||null> != null:
        - inventory open d:<inventory[statue_<context.location>]>