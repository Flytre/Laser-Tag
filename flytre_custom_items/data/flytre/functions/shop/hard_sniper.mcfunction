####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"hard_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:94868,UUIDMost:156850,Slot:"mainhand"}]}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6FlyteForce §rNightmare","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=100..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6FlyteForce §rNightmare","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..99}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6FlyteForce §rNightmare","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=100..},team=green] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rNightmare\"",Lore:["\"§7Damage: §c2200\"","\"§7Fire Speed: §c0.14 lasers/sec\"","\"§7Range: §c50m\"","\"§7Armor Pierce: §c90%\"","\"§7Movement Speed: §c-10%\""]},ability:"hard_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:94868,UUIDMost:156850,Slot:"mainhand"}],CustomModelData:3}
give @s[tag=!preowner,scores={credits=100..},team=blue] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rNightmare\"",Lore:["\"§7Damage: §c2200\"","\"§7Fire Speed: §c0.14 lasers/sec\"","\"§7Range: §c50m\"","\"§7Armor Pierce: §c90%\"","\"§7Movement Speed: §c-10%\""]},ability:"hard_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:94868,UUIDMost:156850,Slot:"mainhand"}],CustomModelData:4}
scoreboard players remove @s[tag=!preowner,scores={credits=100..}] credits 100
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
