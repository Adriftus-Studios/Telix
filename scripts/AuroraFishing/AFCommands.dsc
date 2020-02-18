
### MAIN COMMAND ###
fish:
  type: command
  name: fish
  description: Opens the Fish menu.
  usage: /fish
<<<<<<< HEAD
#  permission: custom.fish
=======
  # permission: custom.fish
>>>>>>> 88e0acf2263ee30443a29a7e2e919bcb1dfbcd5d
  script:
    - if <context.arg.is_empty||true>:
      - inventory open d:<inventory[afgui_main]>
      - narrate "<&e>You open the fish menu."
    - else:
      - narrate "<&c>Usage<&co> <&a>/fish"