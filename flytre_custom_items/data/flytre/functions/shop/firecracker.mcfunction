####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"firecracker",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Xilian §rRadeon","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=75..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Xilian §rRadeon","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..74}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Xilian §rRadeon","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=75..},team=green] carrot_on_a_stick{display:{Name:"\"§6Xilian §rRadeon\"",Lore:["\"§7§oLasers spray out from hit enemies.\"","\"§7Damage: §c400\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c20°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c3.0 % per m\"","\"§7Impact Lasers: §c5\"","\"§7Battery Power: §c20 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"firecracker",scope:1,CustomModelData:25}
give @s[tag=!preowner,scores={credits=75..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Xilian §rRadeon\"",Lore:["\"§7§oLasers spray out from hit enemies.\"","\"§7Damage: §c400\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c20°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c3.0 % per m\"","\"§7Impact Lasers: §c5\"","\"§7Battery Power: §c20 lasers\"","\"§7Charging Time: §c2.1 secs\""]},ability:"firecracker",scope:1,CustomModelData:26}
scoreboard players remove @s[tag=!preowner,scores={credits=75..}] credits 75
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
