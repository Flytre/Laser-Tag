####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=15..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §eWeak Heal","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..14}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §eWeak Heal","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=15..},team=green] carrot_on_a_stick{display:{Name:"\"§eWeak Heal\"",Lore:["\"§7Heal §63.0§7 hearts.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"weak_heal",CustomModelData:11}
give @s[scores={credits=15..},team=blue] carrot_on_a_stick{display:{Name:"\"§eWeak Heal\"",Lore:["\"§7Heal §63.0§7 hearts.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"weak_heal",CustomModelData:11}
scoreboard players remove @s[scores={credits=15..}] credits 15
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
