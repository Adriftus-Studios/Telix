# https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/event/player/PlayerFishEvent.State.html

# All GUI's will be in format 'afgui_<name>'

#Injecting the YAML keys.
fishing_reload:
  type: world
  fish_reload:
      - yaml load:data/af_config.yml id:fish_info
  events:
    on server start:
      - inject locally fish_reload
    on script reload:
      - inject locally fish_reload

## Event Listeners ##

fishing_inventory_listener:
  type: world
  events:
    on player clicks in afgui_* priority:10:
      - determine cancelled
    on player clicks back_item in afgui_*:
      - inventory open d:<inventory[afgui_main]>
    on player clicks af_bait_shop_button in afgui_*:
      - inventory open d:<inventory[afgui_bait_shop]>
    on player clicks af_rod_shop_button in afgui_*:
      - inventory open d:<inventory[afgui_rod_shop]>
    on player clicks af_gutting_station_button in afgui_*:
      - inventory open d:<inventory[afgui_gutting_station]>
    on player clicks gui_close_btn in afgui_*:
      - inventory close
    
    # Bait Shop Listen
    on player left clicks af_bait_* in afgui_bait_shop:
      - if <context.clicked_inventory.script_name> == "afgui_bait_shop":
        - give <context.item>
        - narrate "<&6>You have just purchased <&a>1 <context.item.display><&6>."
    on player right clicks af_bait_* in afgui_bait_shop:
      - if <context.clicked_inventory.script_name> == "afgui_bait_shop":
        - give <context.item> quantity:8
        - narrate "<&6>You have just purchased <&a>8 <context.item.display><&6>."
    
    # Rod Shop Listen
    on player left clicks af_rod_* in afgui_rod_shop:
      - if <context.clicked_inventory.script_name> == "afgui_rod_shop":
        - define item:<context.item>
        - inject build_item
        - give <[item]>
        - narrate "<&6>You have just purchased a <&a><context.item.display><&6>."
    
    # Gutting Station Listen

### Debug Message - Disable after testing
#    on player fishes:
#      - narrate "State<&co> <&a><context.state>"
#      - narrate "Biome<&co> <&a><context.hook.location.biome.name>"
#      - narrate "Material<&co> <&a><context.hook.location.material.name>"
#      - narrate "Bait<&co> <&a><player.item_in_hand.nbt[baited].as_script.yaml_key[display<&sp>name].parsed||None>"
############################################################################################

    on player right clicks with af_rod_*:
      - if <player.is_sneaking>:
        - determine passively cancelled
        - inventory open d:<inventory[afgui_main]>
        - narrate "<&6>You have opened the <&a><&n><&l>Fishing Menu<&r>"
      - else if !<context.item.has_nbt[baited]>:
        - narrate "<&c>Are you going to fish without using bait?"
        - determine cancelled
      - else:
        - stop
    
    on player clicks af_rod_* in inventory with af_bait_*:
      - determine passively cancelled
      - if !<context.item.has_nbt[baited]>:
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> "lore:<context.item.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <context.cursor_item.display>]>"
        - wait 1t
        - adjust <player> item_on_cursor:<player.item_on_cursor.with[quantity=<player.item_on_cursor.quantity.-[1]>]>
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> nbt:baited/<context.cursor_item.scriptname>
        - narrate "<&6>Baited with<&co> <context.cursor_item.display>"
      - else if <context.item.has_nbt[baited]>:
        - narrate "<&c>Your <&a><context.item.display><&c> already has <&a><context.item.nbt[baited].as_script.yaml_key[display<&sp>name].parsed><&r> <&c>applied!"
      - else:
        - narrate "<&c>You can't place any bait on this rod"
    
    on player right clicks af_rod_* in inventory:
      - determine passively cancelled
      - if <context.item.has_nbt[baited]> && <player.item_on_cursor.material.name> == air:
        - narrate "<&6>You have removed the <&a><context.item.nbt[baited].as_script.yaml_key[display<&sp>name].parsed><&r> <&6>from your <&a><context.item.display>."
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> "lore:<context.item.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <&7>Nothing]>"
        - adjust <player> item_on_cursor:<context.item.nbt[baited]>
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> remove_nbt:baited
      - else if <context.item.has_nbt[baited]>:
        - narrate "<&c>You can only remove bait with an empty hand!"
      - else:
        - narrate "<&c>This rod does not have any bait attached."

    on player fishes while bite:
      - playeffect bubble_column_up <context.hook.location> targets:<player> quantity:60
      - narrate "<&6>HOOKED!"

    on player fishes while caught_fish:
      - define number <util.random.int[1].to[100]>
      - define weight_lblow <util.random.int[0].to[30]>
      - define weight_lbmid <util.random.int[30].to[100]>
      - define weight_lbhigh <util.random.int[100].to[500]>
      - define weight_lbhighest <util.random.int[550].to[1000]>
      - define weight_oz <util.random.int[0].to[15]>
      - foreach <yaml[fish_info].list_keys[general.<player.item_in_hand.nbt[baited].as_script.yaml_key[yaml_name]>.<context.hook.location.biome.name>].numerical||<yaml[fish_info].list_keys[general.fallback].numerical>>:
        - if <[number]> <= <[value]>:
          - define caught_fish <yaml[fish_info].read[general.<player.item_in_hand.nbt[baited].as_script.yaml_key[yaml_name]>.<context.hook.location.biome.name>.<[value]>].random.as_item||<yaml[fish_info].read[general.fallback.<[value]>].random.as_item>>
          - determine passively caught:<[caught_fish]>
          - foreach stop
      - wait 1t
      - if <[number]> <= 5:
        - inventory adjust slot:<player.held_item_slot> remove_nbt:baited
        - inventory adjust slot:<player.held_item_slot> "lore:<player.item_in_hand.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <&7>Nothing]>"
        - playsound <player> sound:ambient_underwater_exit volume:1.0 pitch:0.2
        - narrate "<&6>You caught a massive <&3><[weight_lbhighest]>lb<&6>, <&3><[weight_oz]>oz <&a><[caught_fish].display>"
        - narrate "<&6>    and it stole your bait!"
      - else if <[number]> <= 15:
        - inventory adjust slot:<player.held_item_slot> remove_nbt:baited
        - inventory adjust slot:<player.held_item_slot> "lore:<player.item_in_hand.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <&7>Nothing]>"
        - playsound <player> sound:ambient_underwater_exit volume:1.0 pitch:0.8
        - narrate "<&6>You caught a giant <&3><[weight_lbhigh]>lb<&6>, <&3><[weight_oz]>oz <&a><[caught_fish].display>"
        - narrate "<&6>    and it stole your bait!"
      - else if <[number]> <= 50:
        - playsound <player> sound:ambient_underwater_exit volume:1.0 pitch:1.2
        - narrate "<&6>You caught a decent <&3><[weight_lbmid]>lb<&6>, <&3><[weight_oz]>oz <&a><[caught_fish].display>"
      - else if <[number]> <= 99:
        - playsound <player> sound:ambient_underwater_exit volume:1.0 pitch:2.0
        - narrate "<&6>You caught a tiny <&3><[weight_lblow]>lb<&6>, <&3><[weight_oz]>oz <&a><[caught_fish].display>"
      - else:
        - firework <context.hook.location> power:0.5 star primary:yellow fade:white flicker
        - give af_fish_token
        - playsound <player> sound:entity_generic_explode volume:1.0 pitch:1.5
        - playsound <player> sound:block_anvil_hit volume:0.3 pitch:2.0
        - narrate "<&6>You have recieved a shiny new <&a>Fish Token<&6>!"