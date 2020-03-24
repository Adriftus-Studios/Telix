
custom_slime_jar_rest:
  type: item
  material: music_disc_13
  mechanisms:
    custom_model_data: 1
    flags: hide_all
  display name: <&b>Slime-in-a-Jar
  lore:
    - <&6>The <&a>Slime-in-a-Jar<&6> will start
    - <&6>to jump with joy when you bring it to
    - <&6>a familiar place!
    - <&7>
    - <&c>TIP<&co> Hold <&a>F3 + G<&c> to see your chunks
    - <&c><&sp><&sp>Right click outside of the area to reset.

# We don't really need this item script, because we're adjsuting the CMD directly, but it's here in case we need it for a GUI or anything.
custom_slime_jar_jump:
  type: item
  material: music_disc_13
  mechanisms:
    custom_model_data: 2
  display name: <&b>Slime-in-a-Jar
  lore:
    - <&6>The <&a>Slime-in-a-Jar<&6> will start
    - <&6>to jump with joy when you bring it to
    - <&6>a familiar place!
    - <&7>
    - <&c>TIP<&co> Hold <&a>F3 + G<&c> to see your chunks
    - <&c><&sp><&sp>Right click outside of the area to reset.



slime_in_a_jar_listener:
  type: world
  events:
    on player right clicks block with custom_slime_jar_*:
    - if <player.location.chunk.spawn_slimes> == true:
      - flag player slimeWait2:!
      - if <player.item_in_hand> == custom_slime_jar_jump:
        - stop
      - else if !<player.has_flag[slimeWait]>:
        - define slimeSlot:<player.held_item_slot>
        - narrate "<&6>Your little slime starts to bounce around in its jar!"
        - take slot:<[slimeSlot]> quantity:1
        - inventory set d:<player.inventory> o:custom_slime_jar_jump slot:<[slimeSlot]>
        - title title:<&a>Slime! "subtitle:<&6>Your little slime has found its family!"
        - playsound <player> sound:entity_player_levelup sound_category:master volume:1
        - flag player slimeWait duration:10s
      - else:
        - playsound <player> sound:block_dispenser_fail sound_category:master volume:1
        - narrate "<&c>You are working your little slime too hard. Please wait another <&4><player.flag[slimeWait].expiration.as_duration.formatted><&c>."
    - else if <player.location.chunk.spawn_slimes> == false:
      - flag player slimeWait:!
      - if <player.item_in_hand> == custom_slime_jar_rest:
        - stop
      - else if !<player.has_flag[slimeWait2]>:
        - define slimeSlot:<player.held_item_slot>
        - narrate "<&6>Your little slime is calm now."
        - take slot:<[slimeSlot]> quantity:1
        - inventory set d:<player.inventory> o:custom_slime_jar_rest slot:<[slimeSlot]>
        - flag player slimeWait2 duration:10s
      - else:
        - playsound <player> sound:block_dispenser_fail sound_category:master volume:1
        - narrate "<&c>You are working your little slime too hard. Please wait another <&4><player.flag[slimeWait2].expiration.as_duration.formatted><&c>."
    - else:
      - narrate "Shit broke somehow?"

# Stop from putting the slime in a jukebox. That doesn't sound like fun.
    on player right clicks jukebox with custom_slime_jar_*:
    - determine cancelled