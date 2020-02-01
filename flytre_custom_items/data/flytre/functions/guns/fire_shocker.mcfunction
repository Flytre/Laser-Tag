####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

playsound flytre.shocker.fire player @a[distance=..10] ~ ~ ~ 0.3
scoreboard players set @s range 0
scoreboard players set @s damage 700
function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= shocker spray
execute as @s[scores={gunSneak=1..,rng=..3}] run scoreboard players add @s rng 2
execute as @s[scores={gunSneak=1..,rng=5..}] run scoreboard players remove @s rng 2
execute if score @s rng matches 0 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-4 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 0 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-4 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 1 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-3 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 1 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-3 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 2 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-2 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 2 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-2 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 3 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-1 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 3 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-1 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 4 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~0 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 4 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~0 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 5 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~1 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 5 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~1 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 6 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~2 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 6 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~2 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 7 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~3 ~ run function flytre:guns/fire2_shocker
execute if score @s rng matches 7 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~3 ~ run function flytre:guns/fire2_shocker
execute as @s[scores={gunSneak=1..,rng=..3}] run scoreboard players add @s rng 2
execute as @s[scores={gunSneak=1..,rng=5..}] run scoreboard players remove @s rng 2
scoreboard players set @s gunSneak 0
