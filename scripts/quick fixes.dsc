fixes_command:
  type: command
  name: fixes
  permission: fixes
  script:
  - foreach <player.we_selection.blocks.filter[material.name.is[==].to[stone]]> as:block:
    - if <[block].up[1].material.name> == air || <[block].down[1].material.name> == air || <[block].left[1].material.name> == air || <[block].right[1].material.name> == air || <[block].forward[1].material.name> == air || <[block].backward[1].material.name> == air:
      - modifyblock <[block]> <list[sand|gravel|terracotta].random>