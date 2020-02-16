ability_false_door:
  type: task
  name: false_door
  ability_tree: Thievery
  ability_type: active
  duration: 5
  points_to_unlock: 10
  power_cost: 10
  description: Open yourself a 2x1 door you can pass through
  icon:
    material: stone
    custom_model_data: 1
  script:
    - inject abilities_check
    - if <player.location.forward_flat> != air:
    - showfake air <player.location.forward_flat>|<player.location.forward_flat.above> duration:10s
    - playeffect crit at:<player.location.forward_flat.center.above[1]> quantity:30 offset:0.5 targets:<player>
    - adjust <player> noclip:true
    - wait 10s
    - adjust <player> noclip:false
