fake_durability_handler:
    type: world
    debug: true
    events:
        on player item takes damage:
        - define item:<context.item>
        - define slot:<context.slot>
        - define inventory:<player.inventory>
        - define amount:-1
        - if !<[item].enchantments.contains_any[DURABILITY]>:
            - inject fake_durability_modify
        - else:
            - if <util.random.int[0].to[100]> < <util.random.int[100].to[100]./[<[item].enchantments.level[DURABILITY].+[1]>]>:
                - inject fake_durability_modify
        on player mends item:
        - define item:<context.item>
        - define slot:<player.inventory.find[<context.item>]>
        - define inventory:<player.inventory>
        - define amount:<context.repair_amount>
        - inject fake_durability_modify

fake_durability_modify:
    type: task
    script:
    - if <[item].script.yaml_key[fake_durability]||null> != null:
        - adjust def:item nbt:durability/<[item].nbt[durability].+[<[amount]>]||<[item].script.yaml_key[fake_durability].+[<[amount]>]>>
        - if <[item].nbt[durability]> > <[item].script.yaml_key[fake_durability]>:
            - adjust def:item nbt:durability/<[item].script.yaml_key[fake_durability]>
        - adjust def:item durability:<[item].max_durability.-[<[item].nbt[durability]./[<[item].script.yaml_key[fake_durability]>].*[<[item].max_durability>]>]>
        - adjust def:item lore:<[item].lore.replace[regex:(.*)Durability(.*)].with[<&f>Durability:<&sp><[item].nbt[durability]><&sp>/<&sp><[item].script.yaml_key[fake_durability]>]>
        - if <[item].nbt[durability]> < 0:
            - inventory set slot:<[slot]> d:<[inventory]> o:<item[air]>
        - else:
            - inventory set slot:<[slot]> d:<[inventory]> o:<[item]>
    - else:
        - adjust def:item durability:<[item].max_durability.+[<[amount]>]>
        - inventory set slot:<[slot]> d:<[inventory]> o:<[item]>

fake_durability_test_item:
    type: item
    material: diamond_pickaxe
    display_name: Testitem
    fake_durability: 5
    lore:
        - "<&r>Durability: <script.yaml_key[fake_durability]>"

fake_durability_give_test_item:
    type: command
    debug: true
    name: fake_durability_give_test_item
    script:
    - inventory set d:<player.inventory> slot:<player.item_in_hand.slot> o:<item[fake_durability_test_item]>