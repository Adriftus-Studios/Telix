## Nations Menu

#Nation Menu
gui_nations_menu:
  type: inventory
  debug: true
  inventory: CHEST
  size: 27
  title: <&7>Nation<&sp>Menu<&sp><&8>|<&sp><proc[getNationData].context[<player.flag[nation]>|display.color].parse_color><proc[getNationData].context[<player.flag[nation]>|display.name]>
  definitions:
    nationitem: <proc[getNationData].context[<player.flag[nation]>|display.item].as_item>
    border: <item[white_stained_glass_pane]>
    close: <item[gui_close_btn]>
  slots: 
    - "[nationitem] [] [] [] [] [] [] [] [nationitem]"
    - "[border] [] [] [] [] [] [] [] [border]"
    - "[border] [] [] [] [close] [] [] [] [border]"
