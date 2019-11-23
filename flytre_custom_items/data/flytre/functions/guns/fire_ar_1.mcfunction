####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

playsound flytre.assault_rifle.fire player @a[distance=..10] ~ ~ ~ 0.3
scoreboard players set @s range 0
scoreboard players set @s damage 600
function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= ar_1 spray
execute as @s[scores={gunSneak=1..,rng=..6}] run scoreboard players add @s rng 3
execute as @s[scores={gunSneak=1..,rng=8..}] run scoreboard players remove @s rng 3
execute if score @s rng matches 0 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-7 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 0 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-7 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 1 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-6 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 1 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-6 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 2 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-5 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 2 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-5 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 3 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-4 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 3 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-4 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 4 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-3 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 4 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-3 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 5 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-2 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 5 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-2 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 6 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-1 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 6 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-1 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 7 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~0 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 7 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~0 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 8 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~1 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 8 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~1 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 9 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~2 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 9 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~2 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 10 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~3 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 10 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~3 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 11 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~4 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 11 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~4 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 12 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~5 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 12 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~5 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 13 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~6 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 13 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~6 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 14 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~7 ~ run function flytre:guns/fire2_ar_1
execute if score @s rng matches 14 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~7 ~ run function flytre:guns/fire2_ar_1
execute as @s[scores={gunSneak=1..,rng=..6}] run scoreboard players add @s rng 3
execute as @s[scores={gunSneak=1..,rng=8..}] run scoreboard players remove @s rng 3
scoreboard players set @s gunSneak 0
