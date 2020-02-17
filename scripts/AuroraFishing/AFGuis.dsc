
# Main GUI

afgui_main:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Fishing Menu<&r> <&6>◆
  size: 45
  definitions:
    gui_top: <item[fish_main_top]>
    gui_bottom: <item[fish_main_bottom]>
    gut_station: <item[af_gutting_station_button]>
    bait_shop: <item[af_bait_shop_button]>
    closeitem: <item[gui_close_btn]>
    rod: <item[af_rod_basic]>
    merchantbutton: <item[af_merchant_button]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [gut_station] [] [bait_shop] [] [merchantbutton] [] [] []"
  - "[gui_top] [] [] [] [] [] [] [] []"
  - "[gui_bottom] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [closeitem] [] [] [] []"

afgui_bait_shop:
  type: inventory
  title: <green><&6>◆ <&a><&n><&l>Bait Shop<&r> <&6>◆
  size: 45
  definitions:
    gui_top: <item[fish_main_top]>
    gui_bottom: <item[fish_main_bottom]>
    closeitem: <item[gui_close_btn]>
    shop_info: <item[af_bait_shop_info]>
    bait_chum: <item[af_bait_chum]>
    bait_honeycomb: <item[af_bait_honeycomb]>
  slots:
  - "[] [] [] [] [] [] [] [] []"
  - "[] [bait_chum] [bait_honeycomb] [] [] [] [] [] []"
  - "[gui_top] [] [] [] [] [] [] [] []"
  - "[gui_bottom] [] [] [] [] [] [] [] []"
  - "[] [] [] [] [closeitem] [] [] [] []"

