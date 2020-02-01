####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"rocket",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Arcix §rZardieren","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=75..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Arcix §rZardieren","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..74}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Arcix §rZardieren","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=75..},team=green] carrot_on_a_stick{display:{Name:"\"§6Arcix §rZardieren\"",Lore:["\"§7§oExplosive laser can hit\"","\"§7§omultiple enemies at once.\"","\"§7Damage: §c100-1200\"","\"§7Fire Speed: §c0.2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Armor Pierce: §c100%\""]},ability:"rocket",scope:1,CustomModelData:19}
give @s[tag=!preowner,scores={credits=75..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Arcix §rZardieren\"",Lore:["\"§7§oExplosive laser can hit\"","\"§7§omultiple enemies at once.\"","\"§7Damage: §c100-1200\"","\"§7Fire Speed: §c0.2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Armor Pierce: §c100%\""]},ability:"rocket",scope:1,CustomModelData:20}
scoreboard players remove @s[tag=!preowner,scores={credits=75..}] credits 75
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
