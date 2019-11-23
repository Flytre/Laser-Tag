####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=20..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §eSpectral Eye","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..19}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §eSpectral Eye","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=20..},team=green] carrot_on_a_stick{display:{Name:"\"§eSpectral Eye\"",Lore:["\"§7Reveal players within §612§7 blocks.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"spectral_eye",CustomModelData:15}
give @s[scores={credits=20..},team=blue] carrot_on_a_stick{display:{Name:"\"§eSpectral Eye\"",Lore:["\"§7Reveal players within §612§7 blocks.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"spectral_eye",CustomModelData:15}
scoreboard players remove @s[scores={credits=20..}] credits 20
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
