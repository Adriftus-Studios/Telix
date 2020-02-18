abilities_slotting_crouchleft:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_left:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_crouchright:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_right:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_swap:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_crouchswap:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_drop:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_slotting_crouchdrop:
  type: item
  material: stone
  mechanisms:
    custom_model_data: 1

abilities_usage_slotting:
  type: world
  events:
    on player shift_right clicks item in inventory:
      - if <context.item.script.yaml_key[has_ability_slots]||false>:
        - define inventory:<inventory[abilities_slotting_inventory]>
        - foreach <context.item.script.list_keys[ability_slots].alphabetical>:
          - define items:|:<item[GUIitem_abilities_slot_<[value]>]>
          - define item:|:<context.item.nbt[abilities_slot_<[value]>].as_item||<item[air]>>
        - inventory add o:<[items]> d:<[inventory]>
        - inventory open d:<[inventory]>

abilities_slotting_inventory:
  type: inventory
  title: <&a>Ability Slots
  slots:
    - "[gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item]"
    - "[] [] [gui_invisible_item] [] [] [gui_invisible_item] [] [] [gui_invisible_item]"
    - "[gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item]"
    - "[] [] [gui_invisible_item] [] [] [gui_invisible_item] [] [] [gui_invisible_item]"
    - "[] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item]"
    - "[] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item] [gui_invisible_item]"