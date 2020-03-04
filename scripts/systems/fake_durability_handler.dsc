fake_durability_handler:
  type: world
  debug: true
  events:
    on player item takes damage:
      - if <context.item.script.yaml_key[fake_durability]||null> == null:
        - stop
      - define item:<context.item>
      - define amount:-1
      - if !<[item].enchantments.contains_any[DURABILITY]>:
        - inject fake_durability_modify def:<[item]>|<[amount]>
        - inventory set slot:<context.slot> d:<player.inventory> o:<[new_item]>
      - else:
        - if <util.random.int[0].to[100]> < <util.random.int[100].to[100]./[<[item].enchantments.level[DURABILITY].+[1]>]>:
          - inject fake_durability_modify def:<[item]>|<[amount]>
          - inventory set slot:<context.slot> d:<player.inventory> o:<[new_item]>
    on player mends item:
      - if <context.item.script.yaml_key[fake_durability]||null> == null:
        - stop
      - define item:<context.item>
      - define amount:<context.repair_amount>
      - inject fake_durability_modify
      - inventory set slot:<context.slot> d:<player.inventory> o:<[new_item]>

fake_durability_modify:
  type: task
  definitions: item|amount
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

fake_durability_test_item:
  type: item
  material: diamond_pickaxe
  display_name: Testitem
  fake_durability: 5
  unobtainable: true
  lore:
  - "<&r>Durability: <script.yaml_key[fake_durability]> / <script.yaml_key[fake_durability]>"

fake_durability_give_test_item:
  type: command
  debug: true
  name: fake_durability_give_test_item
  script:
    - inventory set d:<player.inventory> slot:<player.item_in_hand.slot> o:<item[fake_durability_test_item]>