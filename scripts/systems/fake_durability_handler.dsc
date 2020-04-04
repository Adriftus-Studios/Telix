fake_durability_handler:
  type: world
  events:
    on player item takes damage:
      - stop
      - define item:<proc[fake_durability_use].context[<player.item_in_hand>]||null>
      - if <[item]> != null:
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<proc[fake_durability_use].context[<player.item_in_hand>]>
    on player mends item:
      - if <context.item.script.yaml_key[fake_durability]||null> == null:
        - stop
      - define item:<context.item>
      - define amount:<context.repair_amount>
      - inject fake_durability_modify
      - define item:<[new_item]>
      - inject build_item
      - inventory set slot:<context.slot> d:<player.inventory> o:<[item]>

fake_durability_use:
  type: procedure
  definitions: item
  script:
    - if <[item].material.name> == air:
      - determine <item[air]>
    - if <[item].script.yaml_key[fake_durability]||null> == null:
      - stop
    - define amount:-1
    - if !<[item].enchantments.contains_any[DURABILITY]>:
      - inject fake_durability_modify
      - determine <[new_item]>
    - else:
      - if <util.random.int[0].to[100]> < <util.random.int[100].to[100]./[<[item].enchantments.level[DURABILITY].+[1]>]>:
        - inject fake_durability_modify
        - determine <[new_item]>

fake_durability_modify:
  type: task
  script:
    - if <[item].script.yaml_key[fake_durability]||null> != null:
      - adjust def:item nbt:durability/<[item].nbt[durability].+[<[amount]>]||<[item].script.yaml_key[fake_durability].+[<[amount]>]>>
      - if <[item].nbt[durability]> > <[item].script.yaml_key[fake_durability]>:
        - adjust def:item nbt:durability/<[item].script.yaml_key[fake_durability]>
      - adjust def:item durability:<[item].max_durability.-[<[item].nbt[durability]./[<[item].script.yaml_key[fake_durability]>].*[<[item].max_durability>]>]>
      - inject build_item
      - if <[item].nbt[durability]> < 0:
        - define new_item:<item[air]>
      - else:
        - define new_item:<[item]>
    - else:
      - adjust def:item durability:<[item].max_durability.+[<[amount]>]>
      - define new_item:<[item]>
