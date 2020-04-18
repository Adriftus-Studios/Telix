
### MAIN COMMAND ###
fish:
  type: command
  name: fish
  description: Opens the Fish menu.
  usage: /fish
  permission: custom.command.fish
  # permission: custom.fish
  script:
    - if <context.arg.is_empty||true>:
      - inventory open d:<inventory[afgui_main]>
      - narrate "<&e>You open the fish menu."
    - else:
      - narrate "<&c>Usage<&co> <&a>/fish"