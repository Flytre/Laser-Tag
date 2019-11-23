####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

playsound flytre.sniper.fire player @a[distance=..10] ~ ~ ~ 0.3
scoreboard players set @s range 0
scoreboard players set @s damage 2200
execute if score @s gunSneak matches 0 positioned ~ ~1.6 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_hard_sniper
execute if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_hard_sniper
