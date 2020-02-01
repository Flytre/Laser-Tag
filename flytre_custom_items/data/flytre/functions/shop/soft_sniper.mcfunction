####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"soft_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:54397,UUIDMost:155465,Slot:"mainhand"}]}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6SpaceTech §rSeeker","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=55..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6SpaceTech §rSeeker","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..54}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6SpaceTech §rSeeker","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=55..},team=green] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rSeeker\"",Lore:["\"§7Damage: §c1400\"","\"§7Fire Speed: §c0.4 lasers/sec\"","\"§7Range: §c50m\"","\"§7Spray: §c2°\"","\"§7Armor Pierce: §c70%\"","\"§7Movement Speed: §c-10%\"","\"§7Battery Power: §c5 lasers\"","\"§7Charging Time: §c12.0 secs\""]},ability:"soft_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:54397,UUIDMost:155465,Slot:"mainhand"}],CustomModelData:3}
give @s[tag=!preowner,scores={credits=55..},team=blue] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rSeeker\"",Lore:["\"§7Damage: §c1400\"","\"§7Fire Speed: §c0.4 lasers/sec\"","\"§7Range: §c50m\"","\"§7Spray: §c2°\"","\"§7Armor Pierce: §c70%\"","\"§7Movement Speed: §c-10%\"","\"§7Battery Power: §c5 lasers\"","\"§7Charging Time: §c12.0 secs\""]},ability:"soft_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:54397,UUIDMost:155465,Slot:"mainhand"}],CustomModelData:4}
scoreboard players remove @s[tag=!preowner,scores={credits=55..}] credits 55
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
