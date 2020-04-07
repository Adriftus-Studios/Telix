#Flag player with view_social_media with uuid (- flag player view_social_media:<player.uuid> duration:5s)
qol_social_media_inventory:
  type: inventory
  debug: true
  title: <&b>Social Media
  size: 27
  procedural items:
    - if <player.flag[view_social_media]||null> == null:
      - flag player view_social_media:<player.uuid> duration:5s
    - define heads:<list[]>
    - foreach <yaml[player.<player.flag[view_social_media]>].list_keys[social]>:
      - if <yaml[].read[social.<[value]>]||None> != None:
        - define heads:->:<item[custom_<[value]>_head]>
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
      - narrate <context.item.script.yaml_key[account]>


##Items (Generated through qol_social_media_inventory using flag view_social_media)
#Twitter
custom_twitter_head:
  type: item
  debug: false
  material: player_head
  display name: <&b>Twitter
  lore:
    - "<&e>Handle: @<script.yaml_key[account]>"
  mechanisms:
    skull_skin: <element[eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzY4NWEwYmU3NDNlOTA2N2RlOTVjZDhjNmQxYmEyMWFiMjFkMzczNzFiM2Q1OTcyMTFiYjc1ZTQzMjc5In19fQ==]>
  account: <yaml[player.<player.flag[view_social_media]>].read[social.twitter]>
