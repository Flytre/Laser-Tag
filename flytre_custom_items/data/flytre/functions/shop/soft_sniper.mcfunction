####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=55..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6SpaceTech §rSeeker","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..54}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6SpaceTech §rSeeker","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=55..},team=green] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rSeeker\"",Lore:["\"§7Damage: §c13\"","\"§7Speed: §c0.4\"","\"§7Range: §c50\"","\"§7Spray: §c2\"","\"§7Armor Pierce: §c70%\"","\"§7Dropoff: §c0.0\"","\"§7Movement Speed: §c-10%\""]},ability:"soft_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:23156,UUIDMost:150233,Slot:"mainhand"}],CustomModelData:3}
give @s[scores={credits=55..},team=blue] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rSeeker\"",Lore:["\"§7Damage: §c13\"","\"§7Speed: §c0.4\"","\"§7Range: §c50\"","\"§7Spray: §c2\"","\"§7Armor Pierce: §c70%\"","\"§7Dropoff: §c0.0\"","\"§7Movement Speed: §c-10%\""]},ability:"soft_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:23156,UUIDMost:150233,Slot:"mainhand"}],CustomModelData:4}
scoreboard players remove @s[scores={credits=55..}] credits 55
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
