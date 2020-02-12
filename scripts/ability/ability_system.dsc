abilities_reload:
  type: task
  script:
    - yaml create id:server.skills_by_level
    - foreach <server.list_scripts>:
      - if <[value].starts_with[ability]>:
        - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[level]>:|:<[value].yaml_key[name]>

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
    filler: <item[white_stained_glass].with[display_name=<&c>]>
  procedural items:
    - foreach <yaml[player.<player.uuid>].read[playerskills]> as:value1:
      - define list:|:<item[GUIItem_abilityTree_<[value1]>].with[nbt=skillname/<[value1]>]>
    - determine <[list]>
  slots:
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
    - "[] [filler] [] [filler] [] [filler] [] [filler] []"
    - "[filler] [] [filler] [] [filler] [] [filler] [] [filler]"
    - "[] [filler] [] [filler] [] [filler] [] [filler] []"
    - "[filler] [] [filler] [] [filler] [] [filler] [] [filler]"
    - "[] [filler] [] [filler] [] [filler] [] [filler] []"
    - "[filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]"
  

ability_characterAbilities_events:
  type: world
  events:
    on player clicks item in abilities_characterAbilityTrees:
      - if !<context.item.has_nbt[skillname]>:
        - determine cancelled

    on player left clicks item in abilities_characterAbilityTrees priority:10:
      - determine passively cancelled
      - inventory open d:<inventory[abilityTree_<context.item.nbt[skillname]>]>

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