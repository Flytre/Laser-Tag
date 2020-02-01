####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"dash",CustomModelData:9}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§eDash","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=15..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §eDash","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..14}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §eDash","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=15..},team=green] carrot_on_a_stick{display:{Name:"\"§eDash\"",Lore:["\"§7Gain Speed §62§7 for §65§7 seconds.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"dash",CustomModelData:9}
give @s[tag=!preowner,scores={credits=15..},team=blue] carrot_on_a_stick{display:{Name:"\"§eDash\"",Lore:["\"§7Gain Speed §62§7 for §65§7 seconds.\"","\"§7The same ability does §cNOT§7 stack.\""]},ability:"dash",CustomModelData:9}
scoreboard players remove @s[tag=!preowner,scores={credits=15..}] credits 15
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
