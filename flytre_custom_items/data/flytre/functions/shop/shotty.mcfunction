####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{ability:"shotty",scope:1}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§6Omega §rShowstopper","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=65..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Omega §rShowstopper","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..64}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Omega §rShowstopper","color":"gold"},{"text":".","color":"none"}]
give @s[tag=!preowner,scores={credits=65..},team=green] carrot_on_a_stick{display:{Name:"\"§6Omega §rShowstopper\"",Lore:["\"§7§oShoots multiple laser at a time.\"","\"§7Damage: §c500\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c8m\"","\"§7Spray: §c18°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c9.0 % per m\"","\"§7Lasers: §c5\"","\"§7Battery Power: §c2 lasers\"","\"§7Charging Time: §c2.2 secs\""]},ability:"shotty",scope:1,CustomModelData:12}
give @s[tag=!preowner,scores={credits=65..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Omega §rShowstopper\"",Lore:["\"§7§oShoots multiple laser at a time.\"","\"§7Damage: §c500\"","\"§7Fire Speed: §c4 lasers/sec\"","\"§7Range: §c8m\"","\"§7Spray: §c18°\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c9.0 % per m\"","\"§7Lasers: §c5\"","\"§7Battery Power: §c2 lasers\"","\"§7Charging Time: §c2.2 secs\""]},ability:"shotty",scope:1,CustomModelData:13}
scoreboard players remove @s[tag=!preowner,scores={credits=65..}] credits 65
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
