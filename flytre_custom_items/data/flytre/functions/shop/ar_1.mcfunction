####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=70..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6SpaceTech §rHunter","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..69}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6SpaceTech §rHunter","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=70..},team=green] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rHunter\"",Lore:["\"§7Damage: §c6\"","\"§7Speed: §c6.0\"","\"§7Range: §c20\"","\"§7Spray: §c15\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c0.04\""]},ability:"ar_1",scope:1,CustomModelData:5}
give @s[scores={credits=70..},team=blue] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rHunter\"",Lore:["\"§7Damage: §c6\"","\"§7Speed: §c6.0\"","\"§7Range: §c20\"","\"§7Spray: §c15\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c0.04\""]},ability:"ar_1",scope:1,CustomModelData:6}
scoreboard players remove @s[scores={credits=70..}] credits 70
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
