####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"team_heal",CustomModelData:16}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§eTeam Heal","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §eTeam Heal","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §eTeam Heal","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=25..},team=green] carrot_on_a_stick{display:{Name:"\"§eTeam Heal\"",Lore:["\"§7Heal your team for §61.5§7 hearts.\"","\"§7The same ability does §cNOT§7 stack for the same person.\""]},ability:"team_heal",CustomModelData:16}
give @s[tag=!preowner,scores={credits=25..},team=blue] carrot_on_a_stick{display:{Name:"\"§eTeam Heal\"",Lore:["\"§7Heal your team for §61.5§7 hearts.\"","\"§7The same ability does §cNOT§7 stack for the same person.\""]},ability:"team_heal",CustomModelData:16}
scoreboard players remove @s[tag=!preowner,scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
