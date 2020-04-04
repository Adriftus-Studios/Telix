qol_cosmetics_command:
  type: command
  debug: false
  name: cosmetics
  aliases:
    - co
  script:
    - inventory open d:<inventory[abilities_characterAbilityTrees]>

qol_equipment_command:
  type: command
  debug: false
  name: equipment
  aliases:
    - equip
    - eq
  script:
    - inventory open d:<inventory[equipment_character]>

qol_statistics_command:
  type: command
  debug: false
  name: statistics
  aliases:
    - stats
    - st
  script:
    - inventory open d:<inventory[stats_character]>

qol_skills_command:
  type: command
  debug: false
  name: skills
  aliases:
    - sk
    - abilities
    - ab
  script:
    - inventory open d:<inventory[abilities_characterAbilityTrees]>
    
qol_recipebook_command:
  type: command
  debug: false
  name: recipebook
  aliases:
    - rb
  script:
    - inventory open d:<inventory[recipe_book_inventory]>
