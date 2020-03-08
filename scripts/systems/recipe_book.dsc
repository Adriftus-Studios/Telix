recipe_book_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Recipe Book<&r> <&6>◆
  size: 54
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[w_filler] [w_filler] [w_filler] [] [closeitem] [] [w_filler] [w_filler] [w_filler]"

recipe_book_events:
  type: world
  events:
    on player opens recipe_book_inventory:
      - define page:<context.inventory>
    on player clicks in recipe_book_inventory:
      - narrate <context.raw_slot>