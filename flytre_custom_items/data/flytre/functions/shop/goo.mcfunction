####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"goo",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Arcix §rSlime Hunter","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=50..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Arcix §rSlime Hunter","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..49}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Arcix §rSlime Hunter","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=50..},team=green] carrot_on_a_stick{display:{Name:"\"§6Arcix §rSlime Hunter\"",Lore:["\"§7§oLasers carry sticky slime.\"","\"§7Damage: §c200\"","\"§7Fire Speed: §c2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c4°\"","\"§7Slow: §c45%\"","\"§7Battery Power: §c10 lasers\"","\"§7Charging Time: §c5.4 secs\""]},ability:"goo",scope:1,CustomModelData:17}
give @s[tag=!preowner,scores={credits=50..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Arcix §rSlime Hunter\"",Lore:["\"§7§oLasers carry sticky slime.\"","\"§7Damage: §c200\"","\"§7Fire Speed: §c2 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c4°\"","\"§7Slow: §c45%\"","\"§7Battery Power: §c10 lasers\"","\"§7Charging Time: §c5.4 secs\""]},ability:"goo",scope:1,CustomModelData:18}
scoreboard players remove @s[tag=!preowner,scores={credits=50..}] credits 50
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
