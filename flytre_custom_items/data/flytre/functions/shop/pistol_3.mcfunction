####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=30..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Omega §rLaserSpeed","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..29}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Omega §rLaserSpeed","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=30..},team=green] carrot_on_a_stick{display:{Name:"\"§6Omega §rLaserSpeed\"",Lore:["\"§7Damage: §c6\"","\"§7Speed: §c4.0\"","\"§7Range: §c15\"","\"§7Spray: §c21\"","\"§7Armor Pierce: §c10%\"","\"§7Dropoff: §c0.08\""]},ability:"pistol_3",scope:1,CustomModelData:1}
give @s[scores={credits=30..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Omega §rLaserSpeed\"",Lore:["\"§7Damage: §c6\"","\"§7Speed: §c4.0\"","\"§7Range: §c15\"","\"§7Spray: §c21\"","\"§7Armor Pierce: §c10%\"","\"§7Dropoff: §c0.08\""]},ability:"pistol_3",scope:1,CustomModelData:2}
scoreboard players remove @s[scores={credits=30..}] credits 30
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
