## Example Nations Extended Task (NXT) Plugin | nxt_(example).dsc
## example = Name of NXT Plugin, what you put in "nations_config.yml" under [nxt]. 
## Set the value of [nxt.example] to "true" OR "false" to enable/disable the plugin

## nxt_(example)_info | YAML Data Script
nxt_example_info:
  type: yaml data
  #General Information
  name: "Example NXT Plugin"
  version: 1.0
  revision: "2019-12-29"
  author: "Author's Name"
  contributors: "Contributor #1, Contributor #2"
  dependencies: "Dependency #1, Dependency #2"
  plugins: "Plugin #1, Plugin #2"
  #Denizen Scripts for Documentation and API purposes
  world: <list[nxt_example_events]>
  taskrun: <list[nxt_example_setdata]>
  taskinject: <list[nxt_example_narratemsg]>
  procedure: <list[nxt_example_getdata]>
  command: <list[nxt_example_plugincmd]>
  item: <list[nxt_example_coolitem]>
  entity: <list[nxt_example_custompig]>
  inventory: <list[nxt_example_maingui]>

## Info File YAML Keys ##
## General Information Keys
# name = Name of the NXT Plugin
# version = Version Number (Semantic Versioning, if you want to use it)
# revision = Revision Date (ISO 8601, pretty please!)
# author = Name of NXT Plugin Author
# contributors = List of Contributors
# dependencies = List of Dependendant Denizen Scripts
# plugins = List of Dependendant Server Plugins (Using Depenizen, or by other means)

## Denizen Script & Tag Keys ##
# world = World Events (on player breaks block)
# taskrun = Run Denizen Tasks (- run, /ex run)
# taskinject = Injected Denizen Tasks (- inject)
# procedure = Procedure Scripts (<proc[system_nations_getnxt].context[list|all]>)
# command = Command Scripts (system_nations_maincmd)
# item = Item Scripts (snowball_launcher)
# entity = Entity Scripts (oot_epona)
# inventory = Inventory Scripts (game_menu)

## Put scripts below!