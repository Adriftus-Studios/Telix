
fake_block_events:
  type: world
  debug: false
  events:
    on delta time secondly:
      - foreach <player.location.find.blocks.within[4]> as:block:
        - if <[block].notable_name.starts_with[fake_block__]||false>:
          - if <player.has_flag[<[block].notable_name.split[__].get[2]>]>
            - showfake <item[air]> <[block]> duration:1m
    on player places block:
      - if <player.has_flag[placing_fake_block]>:
        - note <context.location> as:fake_block__<player.flag[placing_fake_block]>
  
fake_block_command:
  type: command
  name: fake_block
  permission: fake_block
  script:
  - if <player.has_flag[placing_fake_block]>:
    - flag <player> placing_fake_block:!
  - else:
    - flag <player> placing_fake_block:<context.args.get[1]>