####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"pistol_2",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Nova §rBeamer","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=30..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Nova §rBeamer","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..29}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Nova §rBeamer","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=30..},team=green] carrot_on_a_stick{display:{Name:"\"§6Nova §rBeamer\"",Lore:["\"§7Damage: §c800\"","\"§7Fire Speed: §c2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c5°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c6.0 % per m\"","\"§7Battery Power: §c20 lasers\"","\"§7Charging Time: §c3.0 secs\""]},ability:"pistol_2",scope:1,CustomModelData:1}
give @s[tag=!preowner,scores={credits=30..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Nova §rBeamer\"",Lore:["\"§7Damage: §c800\"","\"§7Fire Speed: §c2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c5°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c6.0 % per m\"","\"§7Battery Power: §c20 lasers\"","\"§7Charging Time: §c3.0 secs\""]},ability:"pistol_2",scope:1,CustomModelData:2}
scoreboard players remove @s[tag=!preowner,scores={credits=30..}] credits 30
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
