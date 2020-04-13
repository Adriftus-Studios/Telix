#BB - Multi-instanceable player notifications and timers with durations for bossbars
# Bossbar Definitions:
# - <[title]> - The bossbar text. You MUST use <&sp> for spaces in titles. [Default > Notification]
# - <[duration]> - Duration of notification/length of the timer. [Default > 10s]
# - <[color]> - The colour of the bossbar. BLUE, GREEN, PINK, PURPLE, RED, WHITE, YELLOW. [Default > WHITE]
# - <[progress]> - Progress (how much of the bossbar is filled) of the bossbar. Decimal number between 0.0 and 1.0. [Default > 1.0]
# - <[players]> - List of players the bossbar will be sent to. Pass in an input list with .escaped. [Default > <player>]
# - Style of bossbar notifications are always SOLID.
# * - run bb_notification def:title|duration|color|progress|players

#bb_notification (Run task)
bb_notification:
  type: task
  debug: false
  definitions: title|duration|color|progress|players
  script:
    #Check for existing definitions and set defaults as necessary
    - if <[title]||null> == null || !<[title].exists>:
      - define title:Notification
    - if <[duration]||null> == null || !<[duration].exists>:
      - define duration:5s
    - if <[color]||null> == null || !<[color].exists>:
      - define color:WHITE
    - if <[progress]||null> == null || !<[progress].exists>:
      - define progress:1
    - if <[players]||null> == null || !<[players].exists>:
      - define players:<player>
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:5s
    - if !<list[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW].contains[<[color]>]>:
      - define color:WHITE
    - if <[progress]> < 0:
      - define progress:0
    - else if <[progress]> > 1:
      - define progress:1
    - define players:<[players].unescaped>
    - narrate <[players]>
    
    #Define timestamp id and create bossbar
    - define id:<[players].unescaped.as_list.get[1].uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]> color:<[color]> progress:<[progress]> players:<[players]> style:SOLID
    
    #Wait for specified duration of time
    - wait <[duration]>

    #Remove bossbar
    - bossbar remove <[id]>


#bb_timer (Run task)
bb_timer:
  type: task
  debug: false
  definitions: title|duration|color|players
  script:
    #Check for existing definitions and set defaults as necessary
    - if <[title]||null> == null || !<[title].exists>:
      - define title:10s<&sp>Timer
    - if <[duration]||null> == null || !<[duration].exists>:
      - define duration:10s
    - if <[color]||null> == null || !<[color].exists>:
      - define color:YELLOW
    - if <[players]||null> == null || !<[players].exists>:
      - define players:<player>
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:10s
    - if !<list[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW].contains[<[color]>]>:
      - define color:YELLOW
    - define players:<[players].unescaped>
      
    #Define timestamp id, create bossbar, and define length of time
    - define id:<[players].unescaped.as_list.get[1].uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]> color:<[color]> players:<[players]> style:SOLID
    - define length:<[duration].as_duration.in_seconds.+[1]>

    #Wait for specified duration of time
    - repeat <[duration].as_duration.in_seconds>:
      - define length:--
      - bossbar update <[id]> title:<[title]> progress:<[length]./[<[duration].as_duration.in_seconds>].round_to_precision[0.01]>
      - wait 1s

    #Remove bossbar
    - bossbar remove <[id]>

#Add bb_progress

#bb_status (Run task)
bb_status:
  type: task
  debug: true
  definitions: effect|duration|players
  script:
    #Check for existing definitions and set defaults as necessary
    - if <[effect]||null> == null || !<[effect].exists>:
      - define effect:stun
    - if <[duration]||null> == null || !<[duration].exists>:
      - define duration:5s
    - if <[players]||null> == null || !<[players].exists>:
      - define players:<player>
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:5s
    #- if !<list[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW].contains[<[color]>]>:
    #  - define color:YELLOW
    - define players:<[players].unescaped>
      
    #Check for effect, define title
    - choose <[effect]>:
      #Abilities
      - case fire_arrows:
        - define title:<&c><&l><[effect].replace[_].with[<&sp>].to_titlecase>
        - define icon:<&c>⇱
        - define color:RED
      #Effects
      - case stun:
        - define title:<&e><&l><[effect].to_titlecase>
        - define icon:<&e>⚡
        - define color:YELLOW
      - case freeze:
        - define title:<&b><&l><[effect].to_titlecase>
        - define icon:<&b>☐
        - define color:BLUE
      - case burn:
        - define title:<&c><&l><[effect].to_titlecase>
        - define icon:<&c>☀
        - define color:RED
      #Default
      - default:
        - define title:<&7><&l><[effect].to_titlecase>
        - define icon:<&7>x
        - define color:WHITE
    
    #Define timestamp id, create bossbar, and define length of time
    - define id:<[players].unescaped.as_list.get[1].uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]><&sp><&f><[duration].as_duration.in_seconds>s<&sp><[icon]> color:<[color]> players:<[players]> style:SOLID
    - define length:<[duration].as_duration.in_seconds.+[1]>
    
    #Wait for specified duration of time
    - repeat <[duration].as_duration.in_seconds>:
      - define length:--
      - bossbar update <[id]> title:<[title]><&sp><&f><[length]>s<&sp><[icon]> progress:<[length]./[<[duration].as_duration.in_seconds>].round_to_precision[0.01]>
      - wait 1s
      
    #Remove bossbar
    - bossbar remove <[id]>
