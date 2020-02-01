####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"ar_1",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6SpaceTech §rHunter","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=70..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6SpaceTech §rHunter","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..69}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6SpaceTech §rHunter","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=70..},team=green] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rHunter\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c6 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c12°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c4.0 % per m\"","\"§7Battery Power: §c25 lasers\"","\"§7Charging Time: §c3.2 secs\""]},ability:"ar_1",scope:1,CustomModelData:5}
give @s[tag=!preowner,scores={credits=70..},team=blue] carrot_on_a_stick{display:{Name:"\"§6SpaceTech §rHunter\"",Lore:["\"§7Damage: §c500\"","\"§7Fire Speed: §c6 lasers/sec\"","\"§7Range: §c20m\"","\"§7Spray: §c12°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c4.0 % per m\"","\"§7Battery Power: §c25 lasers\"","\"§7Charging Time: §c3.2 secs\""]},ability:"ar_1",scope:1,CustomModelData:6}
scoreboard players remove @s[tag=!preowner,scores={credits=70..}] credits 70
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
