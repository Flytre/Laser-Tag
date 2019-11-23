####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=65..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6Omega §rShowstopper","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..64}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6Omega §rShowstopper","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=65..},team=green] carrot_on_a_stick{display:{Name:"\"§6Omega §rShowstopper\"",Lore:["\"§7Damage: §c7\"","\"§7Speed: §c1.0\"","\"§7Range: §c8\"","\"§7Spray: §c18\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c0.09\"","\"§7Projectiles: §c5\""]},ability:"shotty",scope:1,CustomModelData:12}
give @s[scores={credits=65..},team=blue] carrot_on_a_stick{display:{Name:"\"§6Omega §rShowstopper\"",Lore:["\"§7Damage: §c7\"","\"§7Speed: §c1.0\"","\"§7Range: §c8\"","\"§7Spray: §c18\"","\"§7Armor Pierce: §c50%\"","\"§7Dropoff: §c0.09\"","\"§7Projectiles: §c5\""]},ability:"shotty",scope:1,CustomModelData:13}
scoreboard players remove @s[scores={credits=65..}] credits 65
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
