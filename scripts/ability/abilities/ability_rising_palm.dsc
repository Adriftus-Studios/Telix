ability_rising_palm:
  type: task
  name: rising_palm
  ability_tree: Fisticuffs
  ability_type: active
  points_to_unlock: 20
  power_cost: 10
  description: Stun your target for 3s.
  icon:
    material: iron_nugget
    custom_model_data: 12
  script:
    - inject abilties_check
    - if <player.target||null> == null || <player.has_flag[no_move]>:
      - stop
    - inject abilities_cost
    - define target:<player.target>
    - playeffect crit <[target].eye_location> quantity:30 offset:0.15
    - narrate targets:<[target]> "<&c>STUNNED."
    - flag <[target]> no_move:->:rising_palm
    - wait 3s
    - flag <[target]> no_move:<-:rising_palm