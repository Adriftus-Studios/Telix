
mob_ability_boomboom_explode:
  type: task
  name: mob_ability_boomboom_explode
  ability_tree: Nether
  cooldown: 10s
  warmup: 1s
  requires_target: true
  requires_target_in_sight: true
  definitions: entity
  script:
    - explode power:2 location:<[entity].location> fire
    - remove <[entity]>
