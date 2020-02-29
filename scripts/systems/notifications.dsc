#Notifications - Multi-instanceable player notifications with durations for bossbars
# Bossbar Definitions:
# - <[title]> - The notification text. [Default > Notification]
# - <[duration]> - Duration that the notification is shown to players. [Default > 10s]
# - <[color]> - The colour of the bossbar. BLUE, GREEN, PINK, PURPLE, RED, WHITE, YELLOW. [Default > WHITE]
# - <[progress]> - Progress (how much of the bossbar is filled) of the bossbar. Decimal number between 0.0 and 1.0. [Default > 1.0]
# - <[targets]> - List of players the notification will be sent to. [Default > <player>] UNUSED
# - Style of bossbar notifications are always SOLID.

#bb_notification (Run task)
bb_notification:
  type: task
  debug: true
  definitions: title|duration|color|progress
  script:
    #Check for existing definitions and set defaults as necessary
    - if <[title]||null> == null:
      - define title:Notification
    - else if <[duration]||null> == null:
      - define duration:5s
    - else if <[color]||null> == null:
      - define color:WHITE
    - else if <[progress]||null> == null:
      - define progress:1
    
    #Check for definitions above/below/not what is expected (duration, color, progress)
    - if <[duration].as_duration.in_seconds> <= 0:
      - define duration:10s
    - else if !<[color].contains_any_text[BLUE|GREEN|PINK|PURPLE|RED|WHITE|YELLOW]>:
      - define color:WHITE
    - else if <[progress]> < 0:
      - define progress:0
    - else if <[progress]> > 1:
      - define progress:1

    #Define timestamp id and create bossbar
    - define id:<player.uuid>.<util.date.time.duration.in_seconds>
    - bossbar create <[id]> title:<[title]> color:<[color]> progress:<[progress]> style:SOLID

    #Wait for specified duration of time
    - wait <[duration]>

    #Remove bossbar
    - bossbar remove <[id]>


#at_notification (Run task)