#Flag player with view_social_media with uuid (- flag player view_social_media:<player.uuid> duration:5s)
qol_social_media_inventory:
  type: inventory
  debug: true
  title: <&b>Social Media
  size: 27
  procedural items:
    - define heads:<list[]>
    - define creator:false
    - if <player.flag[view_social_media]||null> == null:
      - define uuid:<player.uuid>
    - else:
      - define uuid:<player.flag[view_social_media]>
    - foreach <script[telix_creator_codes].list_keys>:
      - if <script[telix_creator_codes].yaml_key[<[value]>.uuid]> == <[uuid]>:
        - define creator:<[value]>
    - if !<[creator]>:
      - foreach <yaml[player.<player.flag[view_social_media]>].list_keys[social]>:
        - if <yaml[player.<[uuid]>].read[social.<[value]>]||None> != None:
          - define heads:->:<item[custom_<[value]>_head].with[nbt=<list[account/<yaml[player.<[uuid]>].read[social.<[value]>]>]>]>
    - else:
      - foreach <script[telix_creator_codes].list_keys[<[creator]>.social]>:
        - define heads:->:<item[custom_<[value]>_head].with[nbt=<list[account/<script[telix_creator_codes].read[<[creator]>.social.<[value]>]>]>]>
    - determine <[heads]>
  definitions:
    w_filler: <item[gui_invisible_item]>
  slots:
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"
  - "[w_filler] [] [] [] [] [] [] [] [w_filler]"
  - "[w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler] [w_filler]"

qol_social_media_inventory_events:
  type: world
  debug: true
  events:
    on player clicks in qol_social_media_inventory priority:10:
      - determine cancelled
     
    on player clicks player_head in qol_social_media_inventory:
      - narrate "something"


##Items (Generated through qol_social_media_inventory using flag view_social_media)
#Twitter
custom_twitter_head:
  type: item
  debug: false
  material: player_head
  display name: <&b>Twitter
  mechanisms:
    skull_skin: <element[eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzY4NWEwYmU3NDNlOTA2N2RlOTVjZDhjNmQxYmEyMWFiMjFkMzczNzFiM2Q1OTcyMTFiYjc1ZTQzMjc5In19fQ==]>
  prefix: "@"
  link: https://twitter.com/