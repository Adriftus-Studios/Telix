
# Main GUI

afgui_main:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Fishing Menu<&r> <&6>◆
  size: 54
  definitions:
    gui_top: <item[fish_main_top]>
    gui_bottom: <item[fish_main_bottom]>
    gut_station: <item[af_gutting_station_button]>
    bait_shop: <item[af_ait_shop_button]>
    closeitem: <item[gui_close_btn]>
    rod: <item[af_rod_basic]>
    merchantbutton: <item[af_merchant_button]>
  slots:
  - "[] [] [] [] [merchantbutton] [] [] [] []"
  - "[] [gut_station] [] [bait_shop] [] [] [] [] []"
  - "[] [] [] [] [] [] [] [] []"
  - "[gui_top] [] [] [] [] [] [] [] []"
  - "[gui_bottom] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [closeitem] [] [] [] []"

afgui_bait_shop:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Bait Shop<&r> <&6>◆
  size: 54
  definitions:
    wfiller: <item[w_filler]>
    closeitem: <item[gui_close_btn]>
  slots:
  - "[wfiller] [wfiller] [wfiller] [wfiller] [wfiller] [wfiller] [wfiller] [wfiller] [wfiller]"
  - "[wfiller] [] [] [] [] [] [] [] [wfiller]"
  - "[wfiller] [] [] [] [] [] [] [] [wfiller]"
  - "[wfiller] [] [] [] [] [] [] [] [wfiller]"
  - "[wfiller] [] [] [] [] [] [] [] [wfiller]"
  - "[wfiller] [wfiller] [wfiller] [wfiller] [closeitem] [wfiller] [wfiller] [wfiller] [wfiller]"

