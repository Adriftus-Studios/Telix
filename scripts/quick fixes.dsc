fixes_command:
  type: command
  name: fixes
  permission: fixes
  script:
  - narrate <player.we_selection.blocks.filter[material.name.is[==].to[stone]].filter[up[1].material.name.is[==].to[air]].filter[down[1].material.name.is[==].to[air]].filter[left[1].material.name.is[==].to[air]].filter[right[1].material.name.is[==].to[air]].filter[forward[1].material.name.is[==].to[air]].filter[backward[1].material.name.is[==].to[air]].size>
  - stop
  - foreach <player.we_selection.blocks.filter[material.name.is[==].to[stone]].filter[up[1].material.name.is[==].to[air]].filter[down[1].material.name.is[==].to[air]].filter[left[1].material.name.is[==].to[air]].filter[right[1].material.name.is[==].to[air]].filter[forward[1].material.name.is[==].to[air]].filter[backward[1].material.name.is[==].to[air]]> as:block:
    - modifyblock <[block]> <list[sand|gravel|terracotta].random>