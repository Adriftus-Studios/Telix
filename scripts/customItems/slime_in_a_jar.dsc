
custom_slime_jar_rest:
  type: item
  material: music_disk_13
  mechanisms:
    custom_model_data: 1
  display name: <&b>Slime-in-a-Jar
  lore:
    - <&6>The <&a>Slime-in-a-Jar<&6> will start
    - <&6>to jump with joy when you bring it to
    - <&6>a familiar place!
    - <&7>
    - <&c>TIP<&co> Hold <&a>F3 + G<&c> to see your chunks
    - <&c><&sp><&sp>Right click outside of the area to reset.

custom_slime_jar_jump:
  type: item
  material: music_disk_13
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
    - if <player.location.chunk.spawn_slimes> == true && !<player.has_flag[slimeTimeout]>:
      - flag player slimeTimeout:true duration:60t
      - narrate "<&6>Your little slime starts to bounce around in its jar!"
      - take slot:<context.slot> quantity:1
      - inventory set d:<player.inventory> o:custom_slime_jar_jump slot:<context.slot>
    - else if <player.location.chunk.spawn_slimes> == false && && !<player.has_flag[slimeTimeout]>:
      - flag player slimeTimeout:true duration:60t
      - narrate "<&6>Your little slime is calm now."
      - take slot:<context.slot> quantity:1
      - inventory set d:<player.inventory> o:custom_slime_jar_rest slot:<context.slot>
    - else:
      - narrate "Shit broke somehow?"