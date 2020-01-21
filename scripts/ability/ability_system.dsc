abilities_reload:
  type: task
  script:
    - yaml create id:server.skills_by_level
    - foreach <server.list_scripts>:
      - if <[value].starts_with[ability]>:
        - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[level]>:|:<[value].yaml_key[name]>

abilities_checkGeneralAbilities:
  type: task
  script:
    - if <yaml[server.skills_by_level].read[general.<[level]>]||null> != null:
      - yaml id:player.<player.uuid> set general.skills:|:<yaml[server.skills_by_level].read[general.<[level]>]>
      - narrate "<&e>You have unlocked new <&b>General<&e> abilities<&co>"
      - foreach <yaml[server.skills_by_level].read[general.<[level]>]>:
        - narrate "<&a><[value].replace[_].with[<&sp>].to_titlecase"