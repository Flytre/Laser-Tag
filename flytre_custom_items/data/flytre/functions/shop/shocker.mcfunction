####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"shocker",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Xilian §rVolt","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=90..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Xilian §rVolt","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..89}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Xilian §rVolt","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=90..},team=green] carrot_on_a_stick{display:{Name:"\"§6Xilian §rVolt\"",Lore:["\"§7§oArcing lasers hit additional\"","\"§7§onearby enemies.\"","\"§7Damage: §c700\"","\"§7Fire Speed: §c0.8 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c8°\"","\"§7Armor Pierce: §c50%\"","\"§7Arc distance: §c5\""]},ability:"shocker",scope:1,CustomModelData:21}
give @s[tag=!preowner,scores={credits=90..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Xilian §rVolt\"",Lore:["\"§7§oArcing lasers hit additional\"","\"§7§onearby enemies.\"","\"§7Damage: §c700\"","\"§7Fire Speed: §c0.8 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c8°\"","\"§7Armor Pierce: §c50%\"","\"§7Arc distance: §c5\""]},ability:"shocker",scope:1,CustomModelData:22}
scoreboard players remove @s[tag=!preowner,scores={credits=90..}] credits 90
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
