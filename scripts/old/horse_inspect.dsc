mount_inspector:
  type: item
  material: STICK
  display name: <&a>Mount Trainers Inspector
  lore:
  - "<&6><&sp><&sp><&sp><&sp><&sp><&sp><&m>-----------------------<&r><&sp><&sp><&sp><&sp>"
  - "<&6>"
  - "<&b>Sneak + Right Click to use"
  - "<&b>This will show you the stats of your mount"


mount_inspect_handler:
  type: world
  debug: true
  events:
    on player right clicks block with mount_inspector:
    - determine cancelled
################  HORSE  #####################
    on player right clicks horse with mount_inspector:
    - determine passively cancelled
    - if !<player.has_flag[messageHorseStatTimeout]> && <player.is_sneaking>:
      - if <context.entity.is_tamed> == true:
        - determine passively cancelled
        - define jump <context.entity.jump_in_blocks>
      
        - define speed <context.entity.speed>
        - define finalSpeed <[speed].*[43.11953659820958]>
      
        - define percenta <[finalSpeed].-[4.312]>
        - define percentb <[percenta].div[4.312]>
        - define percentfinal <[percentb].*[100]>
      
        - define healthmax <context.entity.health.max>
        - define healthcurrent <context.entity.health>
      
        - narrate "<&6>--------------- <&3>Statistics for <context.entity.name.to_titlecase><&6>---------------"
        - if <context.entity.name> == HORSE:
          - narrate "<&l>Name<&co><&r> <&c>No name given"
        - else:
          - narrate "<&l>Name<&co><&r> <&2><context.entity.name>"
########## JUMP   
        - if <[jump]> <= 2.0:
          - narrate "<&l>Jump Height<&co><&r> <&c><[jump].round_to[2]>"
        - else if <[jump]> <= 2.9:
          - narrate "<&l>Jump Height<&co><&r> <&a><[jump].round_to[2]>"
        - else if <[jump]> <= 3.9:
          - narrate "<&l>Jump Height<&co><&r> <&b><[jump].round_to[2]>"
        - else:
          - narrate "<&l>Jump Height<&co><&r> <&6><[jump].round_to[2]>"
########## SPEED
        - if <[finalSpeed]> <= 9.999:
          - narrate "<&l>Speed<&co> <&c><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else if <[finalSpeed]> <= 12.999:
          - narrate "<&l>Speed<&co> <&a><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else if <[finalSpeed]> <= 13.999.000:
          - narrate "<&l>Speed<&co> <&b><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else:
          - narrate "<&l>Speed<&co> <&6><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
########## HEALTH
        - if <[healthmax]> <= 19:
          - narrate "<&l>Health<&co> <&4>❤<&c><[healthmax].round_to[0]> / <&4>❤<&c><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 24:
          - narrate "<&l>Health<&co> <&4>❤<&a><[healthmax].round_to[0]> / <&4>❤<&a><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 29:
          - narrate "<&l>Health<&co> <&4>❤<&b><[healthmax].round_to[0]> / <&4>❤<&b><[healthcurrent].round_to[0]>"
        - else:
          - narrate "<&l>Health<&co> <&4>❤<&6><[healthmax].round_to[0]> / <&4>❤<&6><[healthcurrent].round_to[0]>"
     
        - if <context.entity.is_tamed> == true:
          - narrate "<&l>Tamed<&co><&r> <&2>Yes"
        - else:
          - narrate "<&l>Tamed<&co><&r> <&c>No"
      
        - narrate "<&l>Owner<&co><&r> <&a><context.entity.owner.name||<&c>None>"
      
        - if <context.entity.breeding> == true:
          - narrate "<&l>Breed<&co><&r> <&a>This horse has eaten."
        - else:
          - narrate "<&l>Breed<&co><&r> <&c>This horse must be fed to breed."
########## Armor
        - if <context.entity.horse_armor> == i@air:
          - narrate "<&l>Armor<&co><&r> <&c>None"
        - else if <context.entity.horse_armor> == i@leather_horse_armor:
          - narrate "<&l>Armor<&co><&r> <&a>Leather Horse Armor"
        - else if <context.entity.horse_armor> == i@iron_horse_armor:
          - narrate "<&l>Armor<&co><&r> <&a>Iron Horse Armor"
        - else if <context.entity.horse_armor> == i@golden_horse_armor:
          - narrate "<&l>Armor<&co><&r> <&a>Golden Horse Armor"
        - else if <context.entity.horse_armor> == i@diamond_horse_armor:
          - narrate "<&l>Armor<&co><&r> <&a>Diamond Horse Armor"
      
      
        - flag player messageHorseStatTimeout duration:10t
        - determine cancelled
        
      - else:
        - Narrate "<&c>You cannot inspect a wild <context.entity.entity_type.to_titlecase>!"
        - flag player messageHorseStatTimeout duration:10t
        - determine cancelled
    - else if !<player.has_flag[messageHorseStatTimeout]>:
      - narrate "<&c>You must be sneaking to see the stats of this <context.entity.entity_type.to_titlecase>!"
      - flag player messageHorseStatTimeout duration:10t
      - determine cancelled
################  MULE/DONKEY  #####################
    on player right clicks donkey|mule with mount_inspector:
    - determine passively cancelled
    - if !<player.has_flag[messageHorseStatTimeout]> && <player.is_sneaking>:
      - flag player messageHorseStatTimeout duration:10t
      - if <context.entity.is_tamed> == true:
        - determine passively cancelled
        - define jump <context.entity.jump_in_blocks>
      
        - define speed <context.entity.speed>
        - define finalSpeed <[speed].*[43.11953659820958]>
      
        - define percenta <[finalSpeed].-[4.312]>
        - define percentb <[percenta].div[4.312]>
        - define percentfinal <[percentb].*[100]>
      
        - define healthmax <context.entity.health.max>
        - define healthcurrent <context.entity.health>
      
        - narrate "<&6>--------------- <&3>Statistics for <context.entity.name.to_titlecase><&6>---------------"
        - if <context.entity.name> == MULE|DONKEY:
          - narrate "<&l>Name<&co><&r> <&c>No name given"
        - else:
          - narrate "<&l>Name<&co><&r> <&2><context.entity.name>"
########## JUMP   
        - if <[jump]> <= 2.0:
          - narrate "<&l>Jump Height<&co><&r> <&c><[jump].round_to[2]>"
        - else if <[jump]> <= 2.9:
          - narrate "<&l>Jump Height<&co><&r> <&a><[jump].round_to[2]>"
        - else if <[jump]> <= 3.9:
          - narrate "<&l>Jump Height<&co><&r> <&b><[jump].round_to[2]>"
        - else:
          - narrate "<&l>Jump Height<&co><&r> <&6><[jump].round_to[2]>"
########## SPEED
        - if <[finalSpeed]> <= 9.999:
          - narrate "<&l>Speed<&co> <&a><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else if <[finalSpeed]> <= 13.999.000:
          - narrate "<&l>Speed<&co> <&b><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else:
          - narrate "<&l>Speed<&co> <&6><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
########## HEALTH
        - if <[healthmax]> <= 19:
          - narrate "<&l>Health<&co> <&4>❤<&c><[healthmax].round_to[0]> / <&4>❤<&c><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 24:
          - narrate "<&l>Health<&co> <&4>❤<&a><[healthmax].round_to[0]> / <&4>❤<&a><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 29:
          - narrate "<&l>Health<&co> <&4>❤<&b><[healthmax].round_to[0]> / <&4>❤<&b><[healthcurrent].round_to[0]>"
        - else:
          - narrate "<&l>Health<&co> <&4>❤<&6><[healthmax].round_to[0]> / <&4>❤<&6><[healthcurrent].round_to[0]>"
     
        - if <context.entity.is_tamed> == true:
          - narrate "<&l>Tamed<&co><&r> <&2>Yes"
        - else:
          - narrate "<&l>Tamed<&co><&r> <&c>No"
      
        - narrate "<&l>Owner<&co><&r> <&a><context.entity.owner.name||<&c>None>"
      
      
        - flag player messageHorseStatTimeout duration:10t
        - determine cancelled
        
      - else:
        - Narrate "<&c>You cannot inspect a wild <context.entity.entity_type.to_titlecase>!"
        - flag player messageHorseStatTimeout duration:10t
        - determine cancelled
    - else if !<player.has_flag[messageHorseStatTimeout]>:
      - narrate "<&c>You must be sneaking to see the stats of this <context.entity.entity_type.to_titlecase>!"
      - flag player messageHorseStatTimeout duration:10t
      - determine cancelled
      
################  LLAMA  #####################
    on player right clicks llama with mount_inspector:
    - determine passively cancelled
    - if !<player.has_flag[messageHorseStatTimeout]> && <player.is_sneaking>:
      - flag player messageHorseStatTimeout duration:10t
      - if <context.entity.is_tamed> == true:
        - determine passively cancelled
        - define slots <context.entity.strength.*[3]>
      
        - define speed <context.entity.speed>
        - define finalSpeed <[speed].*[43.11953659820958]>
      
        - define percenta <[finalSpeed].-[4.312]>
        - define percentb <[percenta].div[4.312]>
        - define percentfinal <[percentb].*[100]>
      
        - define healthmax <context.entity.health.max>
        - define healthcurrent <context.entity.health>
      
        - narrate "<&6>--------------- <&3>Statistics for <context.entity.name.to_titlecase><&6>---------------"
        - if <context.entity.name> == DONKEY:
          - narrate "<&l>Name<&co><&r> <&c>No name given"
        - else:
          - narrate "<&l>Name<&co><&r> <&2><context.entity.name>"
########## SLOTS   
        - if <[slots]> <= 3.0:
          - narrate "<&l>Cargo Weight<&co><&r> <&c><[slots]> <&7>slots"
        - else if <[slots]> <= 6:
          - narrate "<&l>Cargo Weight<&co><&r> <&a><[slots]> <&7>slots"
        - else if <[slots]> <= 9:
          - narrate "<&l>Cargo Weight<&co><&r> <&b><[slots]> <&7>slots"
        - else:
          - narrate "<&l>Cargo Weight<&co><&r> <&6><[slots]> <&7>slots"
########## SPEED
        - if <[finalSpeed]> <= 9.999:
          - narrate "<&l>Speed<&co> <&a><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else if <[finalSpeed]> <= 13.999.000:
          - narrate "<&l>Speed<&co> <&b><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
        - else:
          - narrate "<&l>Speed<&co> <&6><[finalSpeed].round_to[3]> <&7>( <&a><[percentfinal].round_to[0]><&7>% faster than walking )"
########## HEALTH
        - if <[healthmax]> <= 19:
          - narrate "<&l>Health<&co> <&4>❤<&c><[healthmax].round_to[0]> / <&4>❤<&c><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 24:
          - narrate "<&l>Health<&co> <&4>❤<&a><[healthmax].round_to[0]> / <&4>❤<&a><[healthcurrent].round_to[0]>"
        - else if <[healthmax]> <= 29:
          - narrate "<&l>Health<&co> <&4>❤<&b><[healthmax].round_to[0]> / <&4>❤<&b><[healthcurrent].round_to[0]>"
        - else:
          - narrate "<&l>Health<&co> <&4>❤<&6><[healthmax].round_to[0]> / <&4>❤<&6><[healthcurrent].round_to[0]>"
     
        - if <context.entity.is_tamed> == true:
          - narrate "<&l>Tamed<&co><&r> <&2>Yes"
        - else:
          - narrate "<&l>Tamed<&co><&r> <&c>No"
      
        - narrate "<&l>Owner<&co><&r> <&a><context.entity.owner.name||<&c>None>"
        
      - else:
        - Narrate "<&c>You cannot inspect a wild <context.entity.entity_type.to_titlecase>!"
        - flag player messageHorseStatTimeout duration:10t
        - determine cancelled
    - else if !<player.has_flag[messageHorseStatTimeout]>:
      - narrate "<&c>You must be sneaking to see the stats of this <context.entity.entity_type.to_titlecase>!"
      - flag player messageHorseStatTimeout duration:10t
      - determine cancelled
     