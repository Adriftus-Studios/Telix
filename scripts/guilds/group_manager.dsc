edit_group_property:
  type: task
  definitions: type|subtype|group|property|value
  script:
  - yaml id:<[type]>.<[subtype]> set <[group]>.<[property]>:<[value]>

set_group_permission:
  type: task
  definitions: type|subtype|group|permission|value
  script:
  - if <[value]> == false:
    - yaml id:<[type]>.<[subtype]> set <[group]>.permissions:<-:<[permission]>
  - else:
    - yaml id:<[type]>.<[subtype]> set <[group]>.permissions:->:<[permission]>

list_group_permissions:
  type: procedure
  definitions: type|subtype|group
  script:
  - determine <yaml[<[type]>.<[subtype]>].read[<[group]>.permissions]>

get_group_property:
  type: procedure
  definitions: type|subtype|group|property
  script:
  - determine <yaml[<[type]>.<[subtype]>].read[<[group]>.<[property]>]>

