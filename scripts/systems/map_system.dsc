map_test:
  type: world
  debug: true
  events:
    on player swaps items:
    - if <context.offhand.material.name> == "filled_map":
      - map <player.item_in_hand.map> resize:1
      - wait 1t
      - while <player.item_in_offhand.material.name> == "filled_map":
        - map <player.item_in_offhand.map> reset:<player.location>
        - wait 1s
    - else if <context.main.material.name> == "filled_map":
      - wait 1t
      - while <player.item_in_hand.material.name> == "filled_map":
        - map <player.item_in_hand.map> reset:<player.location>
        - wait 1s

    on player holds item item:filled_map:
    - wait 1t
    - while <player.item_in_hand.material.name> == "filled_map":
      - map <player.item_in_hand.map> reset:<player.location>
      - wait 1s