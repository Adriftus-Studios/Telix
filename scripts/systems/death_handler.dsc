player_death_handler:
  type: world
  events:
    on player dies:
      - determine <context.drops.filter[script.yaml_key[drops_on_death]]>