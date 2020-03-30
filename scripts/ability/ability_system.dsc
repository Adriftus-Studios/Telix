abilities_check:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[skills.<queue.script.yaml_key[ability_tree]>.current]||0> < <queue.script.yaml_key[points_to_unlock]||100>:
      - stop

abilities_cost:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[stats.power.current]> < <queue.script.yaml_key[power_cost]>:
      - stop
    - yaml id:player.<player.uuid> set stats.power.current:-:<queue.script.yaml_key[power_cost]>
    - if <yaml[player.<player.uuid>].read[stats.power.current]./[<yaml[player.<player.uuid>].read[stats.power.max]>].*[20]||null> != null:
      - adjust <player> food_level:<yaml[player.<player.uuid>].read[stats.power.current]./[<yaml[player.<player.uuid>].read[stats.power.max]>].*[20]>
      - inject actionbar_stats_update


# check systems/script_reload.dsc

#abilities_reload:
#  type: world
#  debug: true
#  events:
#      - if <yaml[server.skills_by_level].read[<[ability_tree]>.<yaml[player.<player.uuid>].read[skills.<[ability_tree]>.level]>]||null> != null:
#        - narrate "<&e>You have unlocked new <&b><[ability_tree]><&e> abilities<&co>"
#        - foreach <yaml[server.skills_by_level].read[<[ability_tree]>.<[level]>]>:
#          - narrate "<&a><[value].replace[_].with[<&sp>].to_titlecase>"

abilities_characterAbilityTrees:
  type: inventory
  title: <&b>Ability Trees
  definitions:
    filler: <item[gui_invisible_item]>
    gui_top: <item[gui_abilities_top]>
    gui_bottom: <item[gui_abilities_bottom]>
  procedural items:
    - foreach <script[abilitytrees].list_keys[trees].alphabetical> as:value1:
      - if <script[abilitytrees].yaml_key[trees.<[value1]>.available_check].parsed>:
        - define list:|:<script[abilitytrees].yaml_key[trees.<[value1]>.GUIItem].as_item.with[display_name=<&b><[value1]>;custom_model_data=<script[abilitytrees].yaml_key[trees.<[value1]>.custom_model_data]>;nbt=skillname/<[value1]>]>
    - determine <[list]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[gui_abilities_top] [] [] [] [] [] [] [] [filler]"
    - "[gui_abilities_bottom] [] [] [] [] [] [] [] [filler]"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  
abilities_item:
  type: item
  material: stone
  display name: <&c>BROKEN - REPORT THIS
  drops_on_death: false

abilites_item_use:
  type: world
  events:
    on player right clicks with abilities_item:
      - determine passively cancelled
      - ratelimit <player> 1s
      - if <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_tree]> != Ender && <player.has_flag[ender_world]>:
        - stop
      - run ability_<context.item.nbt[skillname]>

abilities_item_buildLore:
  type: task
  script:
    - define "lore:<&e>-------------------------"
    - define "lore:|:<&b><script[ability_<context.item.nbt[skillname]>].yaml_key[description]>"
    - define "lore:|:<&c>Power Cost<&co> <script[ability_<context.item.nbt[skillname]>].yaml_key[power_cost]>"
    - define "lore:|:<&e>-------------------------"

abilityTree_inventory:
  type: inventory
  title: <&c>ERROR - REPORT THIS
  definitions:
    filler: <item[gui_invisible_item]>
    gui_top: <item[gui_abilities_top]>
    gui_bottom: <item[gui_abilities_bottom]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[filler] [] [] [] [] [] [] [] [filler]"
    - "[gui_abilities_top] [] [] [] [] [] [] [] [filler]"
    - "[gui_abilities_bottom] [] [] [] [] [] [] [] [filler]"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"

abilityTree_inventory_events:
  type: world
  events:
    on player clicks item in abilityTree_inventory:
      - if <context.raw_slot> < 46:
        - determine passively cancelled
        - if <context.item.script.name> == gui_invisible_item:
          - inventory open d:abilities_characterAbilityTrees
        - if <script[ability_<context.item.nbt[skillname]||null>].yaml_key[ability_type]||null> == active:
          - inject abilities_item_BuildLore
          - adjust <player> item_on_cursor:<item[abilities_item].with[display_name=<context.item.nbt[skillname].replace[_].with[<&sp>].to_titlecase>;lore=<[lore]>;nbt=skillname/<context.item.nbt[skillname]>;material=<script[ability_<context.item.nbt[skillname]>].yaml_key[icon.material]>;custom_model_data=<script[ability_<context.item.nbt[skillname]>].yaml_key[icon.custom_model_data]>]>

abilities_GUIitem_buildLore:
  type: task
  script:
    - define "lore:<&e>-------------------------"
    - define "lore:|:<&b><script[ability_<[ability]>].yaml_key[description]>"
    - define "lore:|:<&a>Ability Type<&co> <script[ability_<[ability]>].yaml_key[ability_type].to_titlecase>"
    - if <script[ability_<[ability]>].yaml_key[ability_type]> == command:
      - define "lore:|:<&a>Usage<&co> <&e>/<script[ability_<[ability]>].yaml_key[command_usage]>"
    - else if <script[ability_<[ability]>].yaml_key[usage]||null> != null:
      - define "lore:|:<&a>Usage<&co> <&e><script[ability_<[ability]>].yaml_key[usage]>"
    - define "lore:|:<&c>Power Cost<&co> <script[ability_<[ability]>].yaml_key[power_cost]>"
    - define "lore:|:<&e>-------------------------"

abilities_characterAbilities_events:
  type: world
  events:
    on player drops item:
      - if <player.open_inventory.script_name||null> == abilities_characterAbilityTrees:
        - if <context.item.has_nbt[skillname]>:
          - remove <context.entity>
          - inventory open d:abilities_characterAbilityTrees
          # note: determine cancelled doesnt work
    on player clicks item in abilities_characterAbilityTrees:
      - if <context.raw_slot> < 46:
        - determine passively cancelled
        - if <context.item.has_nbt[skillname]>:
          - define inventory:<inventory[abilityTree_inventory]>
          - adjust def:inventory title:<context.item.nbt[skillname].to_titlecase>
          - foreach <yaml[server.skills_by_level].list_keys[<context.item.nbt[skillname]>].numerical||<list[]>> as:skilllevel:
            - foreach <yaml[server.skills_by_level].read[<context.item.nbt[skillname]>.<[skilllevel]>].alphabetical||<list[]>> as:ability:
              - if <yaml[player.<player.uuid>].read[skills.<context.item.nbt[skillname]>.current]> < <[skilllevel]>:
                - inventory add d:<[inventory]> o:<item[abilities_item].with[material=barrier;display_name=<&4>Locked<&sp><&r><[ability].replace[_].with[<&sp>].to_titlecase>;lore=<&c>Required<&sp>Points:<&sp><[skilllevel]>|<&b><script[ability_<[ability]>].yaml_key[description]>]>
              - else:
                - inject abilities_GUIitem_buildLore
                - inventory add d:<[inventory]> o:<item[abilities_item].with[material=<script[ability_<[ability]>].yaml_key[icon.material]>;custom_model_data=<script[ability_<[ability]>].yaml_key[icon.custom_model_data]>;display_name=<[ability].replace[_].with[<&sp>].to_titlecase>;lore=<[lore]>;nbt=skillname/<[ability]>]>
          - inventory open d:<[inventory]>
    on player shift clicks item in abilities_characterAbilityTrees priority:10:
      - if <context.raw_slot> < 46:
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
