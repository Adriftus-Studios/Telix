# Guild API Documentation
This page is purely for more information regarding usage of the Guild tasks/procedures

## Direct Data Saving
THIS SHOULD NOT BE THE GO-TO WAY OF ADDING DATA  
Use this as an interface for other system wrappers.

### setGuildData
Type: Task  
Definitions: Guild_Name | Data_Name | Data_Value  
Examples:  
`- run setGuildData def:Mages|members.leader|Xeane`

### getGuildData
Type: Procedure  
Definitions: Guild_Name | Data_Name  
Examples:  
`- define guildLeader:<proc[getGuildData].context[Mages|members.leader]>`

### setGuildData_multiple
Type: Task  
Definitions: Guild_Name | DataList(ListTag - NBT Formatting - `.escaped`)  
Examples:  
`- run setGuildData_multiple def:Mages|<list[members.leader/Xeane|display.name/Mages|display.color/<&b>].escaped>`

## Creating/Removing Guilds
These are used for creating new Guilds, or removing current Guilds

### guilds_createGuild
Type: Task  
Definitions: Guild_Name  
Examples:
` - run guilds_createGuild def:Mages`

### guilds_deleteGuild
Type: Task  
Definitions: Guild_Name  
Examples:  
` - run guilds_deleteGuild def:Mages`

## Adding/Remove Guild Skills
This will Add or Remove skill trees to the guild
Members of the guild will have their skills updated accordingly.

### guilds_addSkill
Type: Task  
Definitions: Guild_Name | Skill_Name  
Examples:  
` - run guilds_addSkill def:Mages|Arcane<&sp>Magic`

### guilds_removeSkill
Type: Task  
Definitions: Guild_Name | Skill_Name  
Examples:  
` - run guilds_removeSkill def:Mages|Arcane<&sp>Magic`