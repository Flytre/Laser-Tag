####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=70..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6FlyteForce §rRapidStrike","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..69}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6FlyteForce §rRapidStrike","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=70..},team=green] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rRapidStrike\"",Lore:["\"§7Damage: §c4\"","\"§7Speed: §c8.0\"","\"§7Range: §c12\"","\"§7Spray: §c20\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c0.07\""]},ability:"smg",scope:1,CustomModelData:5}
give @s[scores={credits=70..},team=blue] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rRapidStrike\"",Lore:["\"§7Damage: §c4\"","\"§7Speed: §c8.0\"","\"§7Range: §c12\"","\"§7Spray: §c20\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c0.07\""]},ability:"smg",scope:1,CustomModelData:6}
scoreboard players remove @s[scores={credits=70..}] credits 70
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
