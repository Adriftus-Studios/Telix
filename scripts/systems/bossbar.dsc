#BB - Multi-instanceable player notifications and timers with durations for bossbars
# Bossbar Definitions:
# - <[title]> - The bossbar text. You MUST use <&sp> for spaces in titles. [Default > Notification]
# - <[duration]> - Duration of notification/length of the timer. [Default > 10s]
# - <[color]> - The colour of the bossbar. BLUE, GREEN, PINK, PURPLE, RED, WHITE, YELLOW. [Default > WHITE]
# - <[progress]> - Progress (how much of the bossbar is filled) of the bossbar. Decimal number between 0.0 and 1.0. [Default > 1.0]
# - <[targets]> - List of players the bossbar will be sent to. [Default > <player>] UNUSED
# - Style of bossbar notifications are always SOLID.
# * - run bb_notification def:title|duration|color|progress|targets

#bb_notification (Run task)
bb_notification:
  type: task
  debug: false
  definitions: title|duration|color|progress|targets
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
    - if <[targets]||null> == null || !<[targets].exists>:
      - define targets:<player>
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:5s
    - if !<list[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW].contains[<[color]>]>:
      - define color:WHITE
    - if <[progress]> < 0:
      - define progress:0
    - else if <[progress]> > 1:
      - define progress:1

    #Define timestamp id and create bossbar
    - define id:<[targets].as_list.get[1].uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]> color:<[color]> progress:<[progress]> targets:<[targets]> style:SOLID

    #Wait for specified duration of time
    - wait <[duration]>

    #Remove bossbar
    - bossbar remove <[id]>


#bb_timer (Run task)
bb_timer:
  type: task
  debug: false
  definitions: title|duration|color|targets
  script:
    #Check for existing definitions and set defaults as necessary
    - if <[title]||null> == null || !<[title].exists>:
      - define title:10s<&sp>Timer
    - if <[duration]||null> == null || !<[duration].exists>:
      - define duration:10s
    - if <[color]||null> == null || !<[color].exists>:
      - define color:YELLOW
    - if <[targets]||null> == null || !<[targets].exists>:
      - define targets:<player>
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:10s
    - if !<list[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW].contains[<[color]>]>:
      - define color:YELLOW

    #Define timestamp id, create bossbar, and define length of time
    - define id:<[targets].as_list.get[1].uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]> color:<[color]> style:SOLID
    - define length:<[duration].as_duration.in_seconds.+[1]>

    #Wait for specified duration of time
    - repeat <[duration].as_duration.in_seconds>:
      - define length:--
      - bossbar update <[id]> title:<[title]> progress:<[length]./[<[duration].as_duration.in_seconds>].round_to_precision[0.01]>
      - wait 1s

    #Remove bossbar
    - bossbar remove <[id]>
