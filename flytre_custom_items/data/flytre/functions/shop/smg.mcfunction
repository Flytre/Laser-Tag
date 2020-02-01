####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"smg",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6FlyteForce §rRapidStrike","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=70..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6FlyteForce §rRapidStrike","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..69}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6FlyteForce §rRapidStrike","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=70..},team=green] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rRapidStrike\"",Lore:["\"§7Damage: §c400\"","\"§7Fire Speed: §c10 lasers/sec\"","\"§7Range: §c12m\"","\"§7Spray: §c15°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c7.000000000000001 % per m\"","\"§7Battery Power: §c40 lasers\"","\"§7Charging Time: §c2.5 secs\""]},ability:"smg",scope:1,CustomModelData:5}
give @s[tag=!preowner,scores={credits=70..},team=blue] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rRapidStrike\"",Lore:["\"§7Damage: §c400\"","\"§7Fire Speed: §c10 lasers/sec\"","\"§7Range: §c12m\"","\"§7Spray: §c15°\"","\"§7Armor Pierce: §c40%\"","\"§7Dropoff: §c7.000000000000001 % per m\"","\"§7Battery Power: §c40 lasers\"","\"§7Charging Time: §c2.5 secs\""]},ability:"smg",scope:1,CustomModelData:6}
scoreboard players remove @s[tag=!preowner,scores={credits=70..}] credits 70
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
