
fake_block_events:
  type: world
  debug: false
  events:
    on delta time secondly:
      - foreach <server.list_online_players>:
        - adjust <queue> linked_player:<[value]>
        - foreach <player.location.find.blocks.within[4].include[<player.fake_block_locations>].deduplicate> as:block:
          - if <[block].notable_name.starts_with[fake_block__]||false>:
            - narrate 1
            - if <player.has_flag[<[block].notable_name.split[__].get[2]>]>:
              - narrate 2
              - showfake <item[air]> <[block]> duration:1m
    on player places block:
      - if <player.has_flag[placing_fake_block]>:
        - note <context.location> as:fake_block__<player.flag[placing_fake_block]>
        - narrate 1
  
fake_block_command:
  type: command
  name: fake_block
  permission: fake_block
  script:
  - if <player.has_flag[placing_fake_block]>:
    - narrate "Fake Block placing mode deactivated for flag <context.args.get[1]>"
    - flag <player> placing_fake_block:!
  - else:
    - narrate "Fake Block placing mode activated for flag <context.args.get[1]>"
    - flag <player> placing_fake_block:<context.args.get[1]>