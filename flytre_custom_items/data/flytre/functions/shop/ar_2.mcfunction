####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"ar_2",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Omega §rBlaster","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=50..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Omega §rBlaster","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..49}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Omega §rBlaster","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=50..},team=green] carrot_on_a_stick{display:{Name:"\"§6Omega §rBlaster\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c25m\"","\"§7Spray: §c10°\"","\"§7Armor Pierce: §c60%\"","\"§7Dropoff: §c1.0 % per m\"","\"§7Battery Power: §c30 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"ar_2",scope:1,CustomModelData:5}
give @s[tag=!preowner,scores={credits=50..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Omega §rBlaster\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c25m\"","\"§7Spray: §c10°\"","\"§7Armor Pierce: §c60%\"","\"§7Dropoff: §c1.0 % per m\"","\"§7Battery Power: §c30 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"ar_2",scope:1,CustomModelData:6}
scoreboard players remove @s[tag=!preowner,scores={credits=50..}] credits 50
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
