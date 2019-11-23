####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=50..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Omega §rBlaster","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..49}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Omega §rBlaster","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=50..},team=green] carrot_on_a_stick{display:{Name:"\"§6Omega §rBlaster\"",Lore:["\"§7Damage: §c5\"","\"§7Speed: §c4.0\"","\"§7Range: §c25\"","\"§7Spray: §c10\"","\"§7Armor Pierce: §c70%\"","\"§7Dropoff: §c0.01\""]},ability:"ar_2",scope:1,CustomModelData:5}
give @s[scores={credits=50..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Omega §rBlaster\"",Lore:["\"§7Damage: §c5\"","\"§7Speed: §c4.0\"","\"§7Range: §c25\"","\"§7Spray: §c10\"","\"§7Armor Pierce: §c70%\"","\"§7Dropoff: §c0.01\""]},ability:"ar_2",scope:1,CustomModelData:6}
scoreboard players remove @s[scores={credits=50..}] credits 50
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
