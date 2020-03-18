command_code:
  type: command
  debug: true
  name: code
  tab complete:
    - define arguments:<list[help|join|version]>
    - if <context.args.size||0> == 0:
      - determine <[arguments]>
    - else if <context.args.size> == 1 && <context.raw_args.ends_with[<&sp>].not>:
      - determine <[arguments].filter[starts_with[<context.args.get[1]>]]>
  help:
    - define code:<player.name>
    - foreach <script[telix_creator_codes].list_keys>:
      - if <script[telix_creator_codes].yaml_key[<[value]>.uuid]> == <player.uuid>:
        - define code:<script[telix_creator_codes].yaml_key[<[value]>.display]>
    - narrate "<&2><&l>Telix Codes"
    - narrate "<&a>Support your favourite Telix Creators by entering their creator code once a week!"
    - narrate "<&a>Entering a creator's code shows support for their content on the server."
    - narrate "<&6>How do I get a Telix code? <&e>You already have one, <&b><[code]><&e>!"
    - narrate "<&6>Are you a creator? <&e>Type <&a>/code join <&e>for more information."
  join:
    - narrate "<&2><&l>Telix Creators - Affiliate Program"
    - narrate "<&e>Contact <&b>Kyu#5957 <&e>on <&9>discord.AuroraGaming.org <&e>to apply for an affiliate code."
    - narrate "<&c>You must link your relevant social media accounts to your Discord account."
    - narrate "<&c>These accounts MUST be visible through <&a>Account Name <&6><&gt> <&a>Display on profile."
    - narrate "<&e>Don't know how? <&6>Click <&b>User Settings <&6><&gt> <&b>Connections <&6><&gt> <&b>Connect Your Accounts."
  version:
    - narrate "<&2><&l>Codes <&e>by <&b>@Estyria (Kyu#5957)"
    - narrate "<&a>Telix Codes - 2020-03-18"
  script:
    - if <context.args.get[1]||null> == null:
      - narrate "<&e>Correct usage: <&a>/code <&lt>code<&gt>"
    - else if <context.args.get[1].to_lowercase> == help:
      - inject locally help
    - else if <context.args.get[1].to_lowercase> == join:
      - inject locally join
    - else if <context.args.get[1].to_lowercase> == version:
      - inject locally version
    - else:
      - inject command_code_redeem
      
#Injected task (<context.args.get[1]>)
command_code_redeem:
  type: task
  debug: false
  affiliate:
    - narrate "<&2>You have entered <&a><[code]><&2>'s code."
  user:
    - narrate "<&b>You have entered <&3><[code]><&b>'s code."
  script:
    - define code:<context.args.get[1].to_lowercase>
    - if <script[telix_creator_codes].list_keys.contains[<[code]>]>:
      - inject locally affiliate
    - else if <server.list_players.parse[name.to_lowercase].filter[starts_with[<[code]>]].get[1]||null> == <[code]>:
      - inject locally user
    - else:
      - narrate "<&c>You have entered an invalid code!"
