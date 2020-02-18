abilities_check:
  type: task
  script:
    - if <yaml[player.<player.uuid>].read[skills.<queue.script.yaml_key[ability_tree]>.current]> < <queue.script.yaml_key[points_to_unlock]>:
      - stop

abilities_reload:
  type: world
  debug: true
  # check systems/script_reload.dsc
  script:
      - if <yaml[server.skills_by_level].read[<[ability_tree]>.<yaml[player.<player.uuid>].read[skills.<[ability_tree]>.level]>]||null> != null:
        - narrate "<&e>You have unlocked new <&b><[ability_tree]><&e> abilities<&co>"
        - foreach <yaml[server.skills_by_level].read[<[ability_tree]>.<[level]>]>:
          - narrate "<&a><[value].replace[_].with[<&sp>].to_titlecase>"

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
        - define list:|:<script[abilitytrees].yaml_key[trees.<[value1]>.GUIItem].as_item.with[display_name=<&b><[value1]>;custom_model_data=<script[abilitytrees].yaml_key[skill_trees.<[value1]>.custom_model_data]>;nbt=skillname/<[value1]>]>
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
      - if <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_tree]> != Ender && <player.has_flag[ender_world]>:
        - stop
      - run ability_<context.item.nbt[skillname]>

abilities_item_buildLore:
  type: task
  script:
    - define "lore:!|:<&e>-------------------------"
    - define "lore:|:<&b><script[ability_<[ability]>].yaml_key[description]>"
    - define "lore:|:<&c>Power Cost<&co> <script[ability_<[ability]>].yaml_key[power_cost]>"
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
      - determine passively cancelled
      - if <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_type]||nope> == active:
        - inject abilities_item_BuildLore
        - adjust <player> item_on_cursor:<item[abilities_item].with[display_name=<context.item.nbt[skillname].replace[_].with[<&sp>].to_titlecase>;lore=<[lore]>;nbt=skillname/<context.item.nbt[skillname]>;material=<script[ability_<context.item.nbt[skillname]>].yaml_key[icon.material]>;custom_model_data=<script[ability_<context.item.nbt[skillname]>].yaml_key[icon.custom_model_data]>]>

abilities_GUIitem_buildLore:
  type: task
  script:
    - define "lore:!|:<&e>-------------------------"
    - define "lore:|:<&b><script[ability_<context.item.nbt[skillname]>].yaml_key[description]>"
    - define "lore:|:<&a>Ability Type<&co> <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_type].to_titlecase>"
    - if <script[ability_<context.item.nbt[skillname]>].yaml_key[ability_type]> == command:
      - define "lore:|:<&a>Usage<&co> <&e>/<script[ability_<context.item.nbt[skillname]>].yaml_key[command_usage]>"
    - define "lore:|:<&c>Power Cost<&co> <script[ability_<context.item.nbt[skillname]>].yaml_key[power_cost]>"
    - define "lore:|:<&e>-------------------------"
        

abilities_characterAbilities_events:
  type: world
  events:
    on player left clicks item in abilities_characterAbilityTrees:
      - determine passively cancelled
      - if <context.item.has_nbt[skillname]>:
        - define inventory:<inventory[abilityTree_inventory]>
        - adjust def:inventory title:<context.item.nbt[skillname].to_titlecase>
        - foreach <yaml[server.skills_by_level].list_keys[<context.item.nbt[skillname]>].numerical> as:skilllevel:
          - if <yaml[player.<player.uuid>].read[skills.<context.item.nbt[skillname]>.current]> < <[skilllevel]>:
            - foreach next
          - foreach <yaml[server.skills_by_level].read[<context.item.nbt[skillname]>.<[skilllevel]>].alphabetical> as:ability:
            - inject abilities_GUIitem_buildLore
            - define list:|:<item[abilities_item].with[material=<script[ability_<[ability]>].yaml_key[icon.material]>;custom_model_data=<script[ability_<[ability]>].yaml_key[icon.custom_model_data]>;display_name=<[ability].replace[_].with[<&sp>].to_titlecase>;lore=<[lore]>;nbt=skillname/<[ability]>]>
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