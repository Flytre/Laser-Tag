####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

playsound flytre.pistol.fire player @a[distance=..10] ~ ~ ~ 0.3
scoreboard players set @s range 0
scoreboard players set @s damage 500
function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= pistol_1 spray
execute as @s[scores={gunSneak=1..,rng=..0}] run scoreboard players add @s rng 0
execute as @s[scores={gunSneak=1..,rng=2..}] run scoreboard players remove @s rng 0
execute if score @s rng matches 0 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-1 ~ run function flytre:guns/fire2_pistol_1
execute if score @s rng matches 0 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-1 ~ run function flytre:guns/fire2_pistol_1
execute if score @s rng matches 1 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~0 ~ run function flytre:guns/fire2_pistol_1
execute if score @s rng matches 1 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~0 ~ run function flytre:guns/fire2_pistol_1
execute if score @s rng matches 2 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~1 ~ run function flytre:guns/fire2_pistol_1
execute if score @s rng matches 2 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~1 ~ run function flytre:guns/fire2_pistol_1
execute as @s[scores={gunSneak=1..,rng=..0}] run scoreboard players add @s rng 0
execute as @s[scores={gunSneak=1..,rng=2..}] run scoreboard players remove @s rng 0
scoreboard players set @s gunSneak 0
