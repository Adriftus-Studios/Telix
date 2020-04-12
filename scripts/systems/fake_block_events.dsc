
fake_block_events:
  type: world
  debug: false
  events:
    on delta time secondly:
      - stop
      - foreach <server.list_online_players>:
        - adjust <queue> linked_player:<[value]>
        - foreach <player.fake_block_locations.exclude[<player.location.find.blocks.within[4]>]>:
          - showfake <[value]> cancel
        - foreach <player.location.find.blocks.within[4].include[<player.fake_block_locations>].deduplicate> as:block:
          - if <[block].notable_name.starts_with[fake_block__]||false>:
            - if <player.has_flag[<[block].notable_name.split[__].get[2]>]>:
              - showfake air <[block]> duration:1m players:<player>
    on player walks:
      - foreach <player.fake_block_locations.exclude[<player.location.find.blocks.within[4]>]>:
        - showfake <[value]> cancel
      - foreach <player.location.find.blocks.within[4].include[<player.fake_block_locations>].deduplicate> as:block:
        - if <[block].notable_name.starts_with[fake_block__]||false>:
          - if <player.has_flag[<[block].notable_name.split[__].get[2]>]>:
            - showfake air <[block]> duration:1m players:<player>
    on player places block:
      - if <player.has_flag[placing_fake_block]>:
        - note <context.location> as:fake_block__<player.flag[placing_fake_block]>
        - narrate "Placed fake block <context.material>"
    on player breaks block:
      - if <player.has_flag[placing_fake_block]>:
        - if <context.location.notable_name||null> != null:
          - note remove as:<context.location.notable_name>
          - narrate "Removed fake block."
      

  
fake_block_command:
  type: command
  name: fake_block
  permission: fake_block
  tab complete:
  - if <context.args.size> == 1:
    - determine <list[place|break]>
  script:
  - if <context.args.get[1]> == place
    - if <player.has_flag[placing_fake_block]>:
      - narrate "Fake Block placing mode deactivated for flag <context.args.get[2]>"
      - flag <player> placing_fake_block:!
    - else:
      - narrate "Fake Block placing mode activated for flag <context.args.get[2]>"
      - flag <player> placing_fake_block:<context.args.get[1]>
  - if <context.args.get[1]> == break:
    - if <player.has_flag[breaking_fake_blocks]>:
      - narrate "Fake Block breaking mode deactivated"
      - flag <player> breaking_fake_blocks:!
    - else:
      - narrate "Fake Block breaking mode activated"
      - flag <player> breaking_fake_blocks