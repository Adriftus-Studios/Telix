quest_gui_main:
  type: inventory
  title: <&6>◆ <&a><&n>Quest Menu<&r> <&6>◆
  size: 45
  definitions:
    gui_top: <item[quest_main_top]>
    gui_bottom: <item[quest_bottom]>
    info_button: <item[info_button]>
    quest_info: <item[quest_info_button]>
    closeitem: <item[gui_close_btn]>
    filler: <item[gui_invisible_item]>
    
  slots:
  - "[quest_info] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  - "[filler] [] [] [] [] [] [] [] [filler]"
  - "[gui_top] [] [] [] [] [] [] [] [filler]"
  - "[gui_bottom] [] [] [] [] [] [] [] [filler]"
  - "[filler] [filler] [filler] [filler] [closeitem] [filler] [filler] [filler] [filler]"

quest_accept_gui:
  type: inventory
  title: Quest Accept/Decline
  size: 27
  definitions:
    # Will make a custom small gui. No more doing GUI specific artwork. That will make the pack massive.
    gui_top: <item[quest_top]>
    gui_bottom: <item[quest_bottom]>
    # On click these items, should start or decline the quest for the player.
    # ie. modify name of acceptbutton/declinebutton to be "Accept <quest_name>". And when that button is clicked, flag player or however it's being done.
    acceptbutton: <item[quest_accept_button]>
    declinebutton: <item[quest_decline_button]>
    closeitem: <item[gui_close_btn]>
    # The lore on this item should be dynamically generated from yaml, and not hard coded for each quest GUI.
    info_button: <item[quest_info_button]>
    filler: <item[gui_invisible_item]>
  slots:
  - "[filler] [filler] [filler] [filler] [info_button] [filler] [filler] [filler] [filler]"
  - "[filler] [] [acceptbutton] [] [] [] [declinebutton] [] [filler]"
  - "[filler] [filler] [filler] [filler] [closeitem] [filler] [filler] [filler] [filler]"

