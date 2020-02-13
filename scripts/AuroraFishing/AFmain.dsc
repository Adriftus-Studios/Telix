# https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/event/player/PlayerFishEvent.State.html

# All GUI's will be in format 'afgui_<name>'



## Event Listener ##

fishing_inventory_listener:
  type: world
  debug: true
  events:
    on player clicks in afgui_* priority:10:
      - determine cancelled
    on player clicks back_item in afgui_*:
      - inventory open d:<inventory[afgui_main]>
    on player clicks guiclose in afgui_*:
      - inventory close
    
    
    on player right clicks with af_rod_*:
      - if <player.is_sneaking>:
        - determine passively cancelled
        - inventory open d:<inventory[afgui_main]>
        - narrate "<&6>You have opened the <&a><&n><&l>Fishing Menu<&r>"
      - else:
        - stop
    
    on player clicks af_rod_* in inventory with af_bait_*:
      - determine passively cancelled
      - if !<context.item.has_nbt[baited]>:
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> "lore:<context.item.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <context.cursor_item.display>]>"
        - wait 1t
        - adjust <player> item_on_cursor:air
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> nbt:baited/<context.cursor_item.scriptname>
        - narrate "<&6>Baited with<&co> <context.cursor_item.display>"
      - else:
        - narrate "<&c>This rod already has bait applied!"
    
    on player right clicks af_rod_* in inventory:
      - determine passively cancelled
      - if <context.item.has_nbt[baited]>:
        - narrate "<&6>You have removed the <&a><context.item.nbt[baited].as_script.yaml_key[display<&sp>name].parsed><&r> <&6>from your <&a><context.item.display>."
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> "lore:<context.item.lore.replace[regex:(.*)Baited with(.*)].with[<&6>Baited with<&co> <&7>Nothing]>"
        - adjust <player> item_on_cursor:<context.item.nbt[baited]>
        - inventory adjust slot:<context.slot> d:<context.clicked_inventory> remove_nbt:baited
      - else:
        - narrate "<&c>This rod does not have any bait attached!"

    on player fishes:
      - narrate "state<&co> <context.state>"
      - narrate "biome<&co> <context.hook.location.biome.name>"
      - narrate "material<&co> <context.hook.location.material.name>"

    on player fishes while bite:
      - playeffect happy_villager <context.hook.location> targets:<player> quantity:60
      - narrate "<&6>HOOKED!"

    on player fishes while caught_fish:
    # - if <util.random.int[1].to[100]> <= <yaml_key[fish_chance_percent]>
      - if <util.random.int[1].to[100]> <= 1:
        - give <yaml[fish_info].read[general.<context.location.biome.name>.<[platinum]>].random>
      - else if <util.random.int[1].to[100]> <= 10:
        - give <yaml[fish_info].read[general.<context.location.biome.name>.<[diamond]>].random>
      - else if <util.random.int[1].to[100]> <= 20:
        - give <yaml[fish_info].read[general.<context.location.biome.name>.<[gold]>].random>
      - else if <util.random.int[1].to[100]> <= 40:
        - give <yaml[fish_info].read[general.<context.location.biome.name>.<[silver]>].random>
      - else if <util.random.int[1].to[100]> <= 80:
        - give <yaml[fish_info].read[general.<context.location.biome.name>.<[bronze]>].random>
      
      - spawn af_entity_crab <context.hook.location>
      - narrate "<&6>A crab was caught!"
