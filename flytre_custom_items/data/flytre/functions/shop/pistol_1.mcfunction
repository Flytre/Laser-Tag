####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Nova §rLethalMark","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Nova §rLethalMark","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=25..},team=green] carrot_on_a_stick{display:{Name:"\"§6Nova §rLethalMark\"",Lore:["\"§7Damage: §c5\"","\"§7Speed: §c3.0\"","\"§7Range: §c30\"","\"§7Spray: §c12\"","\"§7Armor Pierce: §c20%\"","\"§7Dropoff: §c0.06\""]},ability:"pistol_1",scope:1,CustomModelData:1}
give @s[scores={credits=25..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Nova §rLethalMark\"",Lore:["\"§7Damage: §c5\"","\"§7Speed: §c3.0\"","\"§7Range: §c30\"","\"§7Spray: §c12\"","\"§7Armor Pierce: §c20%\"","\"§7Dropoff: §c0.06\""]},ability:"pistol_1",scope:1,CustomModelData:2}
scoreboard players remove @s[scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
