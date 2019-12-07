# Guild API Documentation
This page is purely for more information regarding usage of the Guild tasks/procedures.  
## Table of Contents:
* [Direct Data Saving](#direct-data-saving)
* [Creating or Remove Guilds](#creating-or-removing-guilds)
* [Adding or Removing Guild Skills](#add-or-remove-guild-skills)
* [Modifying Members](#modifying-membership)  


## Direct Data Saving
> THIS SHOULD NOT BE THE GO-TO WAY OF ADDING DATA! Use this as an interface for other system wrappers.

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

## Creating or Removing Guilds
> These tasks are used for creating new Guilds, or removing currently existing Guilds.

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

### guilds_listGuilds
Type: Procedure  
Returns: ListTag of ElementTags
Definitions: NONE
Examples:  
` - define allGuilds:<proc[guilds_listGuilds]>`


## Add or Remove Guild Skills
> This will Add or Remove skill trees to the guild. Members of the guild will have their skills updated accordingly.

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

### guilds_getSkills
Type: Procedure  
Returns: ListTag of ElementTags  
Definitions: Guild_Name  
Examples:  
` - define skills:<proc[guilds_getSkills].context[Mages]>`  

## Modifying Membership
> These tasks, and procedures are for getting/setting variosu aspects of member data in Guilds.  

### guilds_setLeader
Type: Task  
Definitions: Guild_Name  
Examples:  
` - run guilds_setLeader def:Mages player:<server.match_player[Xeane]>`  

### guilds_removeLeader
Type: Task  
Definitions: Guild_Name  
Examples:  
` - run guilds_removeLeader def:Mages`  

### guilds_getLeader
Type: Procedure
Returns: PlayerTag  
Definitions: Guild_Name  
Examples:  
` - define GuildLeader:<proc[guilds_getLeader].context[Mages]>`  

### guilds_addMember  
Type: Task  
Definitions: Guild_Name  
Examples:  
` - run guilds_addMember def:Mages player:<server.match_player[Xeane]>`  

### guilds_removeMember  
Type: Task  
Definitions: Guild_Name  
Examples:  
` - run guilds_removeMember def:Mages player:<server.match_player[Xeane]>`  

### guilds_listMembers  
Type: Procedure  
Definitions: Guild_Name  
Examples:  
` - define GuildMembers:<proc[guilds_listMembers].context[Mages]>`  