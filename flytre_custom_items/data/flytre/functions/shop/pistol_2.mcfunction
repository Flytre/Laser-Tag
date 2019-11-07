####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=30..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Nova §rBeamer","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..29}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Nova §rBeamer","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=30..},team=green] carrot_on_a_stick{display:{Name:"\"§6Nova §rBeamer\"",Lore:["\"§7Damage: §c8\"","\"§7Speed: §c2.0\"","\"§7Range: §c20\"","\"§7Spray: §c10\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c0.06\""]},ability:"pistol_2",scope:1,CustomModelData:1}
give @s[scores={credits=30..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Nova §rBeamer\"",Lore:["\"§7Damage: §c8\"","\"§7Speed: §c2.0\"","\"§7Range: §c20\"","\"§7Spray: §c10\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c0.06\""]},ability:"pistol_2",scope:1,CustomModelData:2}
scoreboard players remove @s[scores={credits=30..}] credits 30
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
