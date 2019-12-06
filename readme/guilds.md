# Guild API Documentation
This page is purely for more information regarding usage of the Guild tasks/procedures

## Direct Data Saving
THIS SHOULD NOT BE THE GO-TO WAY OF ADDING DATA  
Use this as an interface for other system wrappers.

### setGuildData
Type: Task  
Definitions: Guild_Name | Data_Name | Data_Value  
Examples:  `- run setGuildData def:Mages|members.leader|Xeane`

### getGuildData
Type: Procedure  
Definitions: Guild_Name | Data_Name  
Examples:  `- define guildLeader:<proc[getGuildData].context[Mages|members.leader]>`

### setGuildData_multiple
Type: Task  
Definitions: Guild_Name | DataList(ListTag - NBT Formatting)  
Examples:  `- run setGuildData_multiple def:Mages|<list[members.leader/Xeane|display.name/Mages|display.color/<&b>].escaped>`

## 