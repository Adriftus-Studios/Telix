
abilities_reload:
  type: world
  debug: true
  abilities_reload:
      - yaml load:data/skill_trees.yml id:ability_trees
      - yaml create id:server.skills_by_level
      - foreach <server.list_scripts>:
        - if <[value].name.starts_with[ability]>:
          - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[points_to_unlock]>:|:<[value].yaml_key[name]>
  events:
    on server start:
      - inject locally abilities_reload
    on script reload:
      - inject locally abilities_reload

abilities_checkAbilities:
  type: task
  definitions: ability_tree
  script:
      - if <yaml[server.skills_by_level].read[<[ability_tree]>.<yaml[player.<player.uuid>].read[skills.<[ability_tree]>.level]>]||null> != null:
        - narrate "<&e>You have unlocked new <&b><[ability_tree]><&e> abilities<&co>"
        - foreach <yaml[server.skills_by_level].read[<[ability_tree]>.<[level]>]>:
          - narrate "<&a><[value].replace[_].with[<&sp>].to_titlecase>"

abilities_characterAbilityTrees:
  type: inventory
  title: <&b>Ability Trees
  definitions:
    filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  procedural items:
    - foreach <yaml[ability_trees].list_keys[skill_trees]> as:value1:
      - if <yaml[ability_trees].read[skill_trees.<[value1]>.available_check].parsed>:
        - define list:|:<yaml[ability_trees].read[skill_trees.<[value1]>.GUIItem].as_item.with[display_name=<&b><[value1]>;custom_model_data=<yaml[ability_trees].read[skill_trees.<[value1]>.custom_model_data]>;nbt=skillname/<[value1]>]>
    - determine <[list]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  
ability_item:
  type: item
  material: stone
  display name: <&c>BROKEN - REPORT THIS


abilityTree_inventory:
  type: inventory
  title: <&c>ERROR - REPORT THIS
  definitions:
    filler: <item[white_stained_glass_pane].with[display_name=<&c>]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

abilityTree_inventory_events:
  type: world
  events:
    on player clicks in abilityTree_inventory:
      - determine passively cancelled
      - if <script[<context.item.nbt[skillname]>].yaml_key[ability_type]||nope> == active:
        - adjust <player> item_on_cursor:<script[<context.item.nbt[skillname]>].yaml_key[ability_type]>

ability_item_buildLore:
  type: task
  script:
    - define "lore:!|:<&e>-------------------------"
    - define "lore:|:<&b><script[ability_<context.item.nbt[skillname]>].yaml_key[description]>"
    - define "lore:|:<&a>Ability Type<&co> <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_type].to_titlecase>"
    - define "lore:|:<&c>Power Cost<&co> <script[ability_<context.item.nbt[skillname]>].yaml_key[power_cost]>"
    - define "lore:|:<&e>-------------------------"
        

ability_characterAbilities_events:
  type: world
  events:
    on player left clicks item in abilities_characterAbilityTrees:
      - determine passively cancelled
      - if <context.item.has_nbt[skillname]>:
        - define inventory:<inventory[abilityTree_inventory]>
        - adjust def:inventory title:<context.item.nbt[skillname].to_titlecase>
        - foreach <yaml[server.skills_by_level].list_keys[<context.item.nbt[skillname]>].numerical> as:skilllevel:
          - foreach <yaml[server.skills_by_level].read[<context.item.nbt[skillname]>.<[skilllevel]>].alphabetical> as:ability:
            - inject ability_item_buildLore
            - define list:|:<item[ability_item].with[material=<script[ability_<[ability]>].yaml_key[icon.material]>;custom_model_data=<script[ability_<[ability]>].yaml_key[icon.custom_model_data98]>;display_name=<[ability].replace[_].with[<&sp>].to_titlecase>;lore=<[lore]>;nbt=skillname/<[ability]>]>
        - inventory add d:<[inventory]> o:<[list]>
        - inventory open d:<[inventory]>

    on player shift left clicks item in abilities_characterAbilityTrees priority:10:
      - determine passively cancelled
      - ratelimit <player> 2t
      - wait 1t
      - if <yaml[player.<player.uuid>].read[lessons.current]> >= 1:
        - yaml id:player.<player.uuid> set skills.<contextn.item.nbt[skillname]>.level:+:1
        - yaml id:player.<player.uuid> set lessons.current:-:1
        - run abilities_checkAbilities def:<context.item.nbt[skillname]>
        - inventory adjust d:<context.inventory> "title:<&b><yaml[player.<player.uuid>].read[lessons.current]> <&e>Lessons Available."
        - inventory set slot:<context.slot> <item[GUIItem_AbilityTree_<context.item.nbt[skillname]>]>


#FOR LATER CODE
#    - foreach <yaml[player.<player.uuid>].read[skills.general.skills]>:
#      - define list:|:<script[ability_<[value]>].yaml_key[display_item].as_item>
#    - foreach <yaml[player.<player.uuid>].read[playerskills]> as:value1:
#      - foreach <yaml[player.<player.uuid>].read[skills.<[value1]>.skills]> as:value2:
#        - define list:|:<script[ability_<[value2]>].yaml_key[display_item].as_item>
#    - determine <[list]>