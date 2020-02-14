equipment_character:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  - define items
  - foreach <list[hat|shirt|pants|shoes|gloves|cape|pendent|charm|amulet|ring|earrings|face_accessory]>:
    - determine items:|:<yaml[player.<player.uuid>].read[equipment.<[value]>]||equipment_filler_<[value]>>
  definitions:
    w_filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [ring_equipment_filler] [charm_equipment_filler] [] [] [] [hat_equipment_filler] [] [w_filler]"
  - "[w_filler] [ring_equipment_filler] [amulet_equipment_filler] [] [] [cape_equipment_filler] [shirt_equipment_filler] [gloves_equipment_filler] [w_filler]"
  - "[w_filler] [ring_equipment_filler] [pendent_equipment_filler] [] [] [] [pants_equipment_filler] [] [w_filler]"
  - "[w_filler] [earring_equipment_filler] [face_accessory_equipment_filler] [] [] [] [shoes_equipment_filler] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"
