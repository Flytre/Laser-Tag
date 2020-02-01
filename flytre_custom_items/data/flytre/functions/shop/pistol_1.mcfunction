####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"pistol_1",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Nova §rLethalMark","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Nova §rLethalMark","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Nova §rLethalMark","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=25..},team=green] carrot_on_a_stick{display:{Name:"\"§6Nova §rLethalMark\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c3 lasers/sec\"","\"§7Range: §c30m\"","\"§7Spray: §c3°\"","\"§7Armor Pierce: §c30%\"","\"§7Dropoff: §c2.0 % per m\"","\"§7Battery Power: §c10 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"pistol_1",scope:1,CustomModelData:1}
give @s[tag=!preowner,scores={credits=25..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Nova §rLethalMark\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c3 lasers/sec\"","\"§7Range: §c30m\"","\"§7Spray: §c3°\"","\"§7Armor Pierce: §c30%\"","\"§7Dropoff: §c2.0 % per m\"","\"§7Battery Power: §c10 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"pistol_1",scope:1,CustomModelData:2}
scoreboard players remove @s[tag=!preowner,scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
