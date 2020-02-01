####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"minigun",HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.4,Operation:1,UUIDLeast:14322,UUIDMost:130580,Slot:"mainhand"}]}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Xilian §rUltron","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=85..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Xilian §rUltron","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..84}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Xilian §rUltron","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=85..},team=green] carrot_on_a_stick{display:{Name:"\"§6Xilian §rUltron\"",Lore:["\"§7Damage: §c210\"","\"§7Fire Speed: §c20 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c30°\"","\"§7Armor Pierce: §c10%\"","\"§7Dropoff: §c4.0 % per m\"","\"§7Movement Speed: §c-40%\"","\"§7Battery Power: §c100 lasers\"","\"§7Charging Time: §c6.5 secs\""]},ability:"minigun",HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.4,Operation:1,UUIDLeast:14322,UUIDMost:130580,Slot:"mainhand"}],CustomModelData:23}
give @s[tag=!preowner,scores={credits=85..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Xilian §rUltron\"",Lore:["\"§7Damage: §c210\"","\"§7Fire Speed: §c20 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c30°\"","\"§7Armor Pierce: §c10%\"","\"§7Dropoff: §c4.0 % per m\"","\"§7Movement Speed: §c-40%\"","\"§7Battery Power: §c100 lasers\"","\"§7Charging Time: §c6.5 secs\""]},ability:"minigun",HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.4,Operation:1,UUIDLeast:14322,UUIDMost:130580,Slot:"mainhand"}],CustomModelData:24}
scoreboard players remove @s[tag=!preowner,scores={credits=85..}] credits 85
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
