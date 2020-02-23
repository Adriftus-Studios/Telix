# / EX RECORD
qol_debug_record:
  type: world
  debug: false
  events:
    on ex command:
      - if <context.args.get[1]||null> == record:
        - execute as_player "denizen debug -r"
        - determine fulfilled


# / EX SUBMIT
qol_debug_submit:
  type: world
  debug: false
  events:
    on ex command:
      - if <context.args.get[1]||null> == submit:
        - execute as_player "denizen submit"
        - determine fulfilled