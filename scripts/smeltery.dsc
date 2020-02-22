
smeltery_inventory:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Equipment Menu<&r> <&6>◆
  size: 54
  procedural items:
  definitions:
    w_filler: <item[gui_invisible_item]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [] [] [w_filler] [] [w_filler] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [closeitem] [w_filler] [w_filler] [w_filler] [w_filler]"

smeltery_events:
  type: world
  events:
    on player clicks in smeltery_inventory:
      - define slotmap:<list[11/in1|12/in2|16/out1|17/out2|20/in3|21/in4|25/out3|26/out4|29/in5|30/in6|34/out5|35/out6]>
      - if !<context.is_shift_click>:
        - if <context.raw_slot> > 54:
          - narrate <context.raw_slot>
          - narrate <context.item>
          - narrate <context.cursor_item>
      - else:
        - if !<context.raw_slot> > 54:
          - determine passively cancelled
          - narrate <context.raw_slot>