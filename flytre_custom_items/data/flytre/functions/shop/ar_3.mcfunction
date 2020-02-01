####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"ar_3",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Arcix §rTriforce","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=85..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Arcix §rTriforce","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..84}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Arcix §rTriforce","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=85..},team=green] carrot_on_a_stick{display:{Name:"\"§6Arcix §rTriforce\"",Lore:["\"§7Damage: §c600\"","\"§7Fire Speed: §c20 lasers/sec\"","\"§7Range: §c30m\"","\"§7Spray: §c8°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c1.0 % per m\"","\"§7Battery Power: §c3 lasers\"","\"§7Charging Time: §c1.25 secs\""]},ability:"ar_3",scope:1,CustomModelData:5}
give @s[tag=!preowner,scores={credits=85..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Arcix §rTriforce\"",Lore:["\"§7Damage: §c600\"","\"§7Fire Speed: §c20 lasers/sec\"","\"§7Range: §c30m\"","\"§7Spray: §c8°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c1.0 % per m\"","\"§7Battery Power: §c3 lasers\"","\"§7Charging Time: §c1.25 secs\""]},ability:"ar_3",scope:1,CustomModelData:6}
scoreboard players remove @s[tag=!preowner,scores={credits=85..}] credits 85
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
