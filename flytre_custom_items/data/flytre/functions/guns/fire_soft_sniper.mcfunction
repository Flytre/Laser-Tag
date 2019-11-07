####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

playsound flytre.sniper.fire player @a[distance=..10] ~ ~ ~ 0.3
scoreboard players set @s range 0
scoreboard players set @s damage 1300
function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= soft_sniper spray
execute as @s[scores={gunSneak=1..,rng=..0}] run scoreboard players add @s rng 0
execute as @s[scores={gunSneak=1..,rng=2..}] run scoreboard players remove @s rng 0
execute if score @s rng matches 0 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~-1 ~ run function flytre:guns/fire2_soft_sniper
execute if score @s rng matches 0 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~-1 ~ run function flytre:guns/fire2_soft_sniper
execute if score @s rng matches 1 if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~0 ~ run function flytre:guns/fire2_soft_sniper
execute if score @s rng matches 1 if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~0 ~ run function flytre:guns/fire2_soft_sniper
execute as @s[scores={gunSneak=1..,rng=..0}] run scoreboard players add @s rng 0
execute as @s[scores={gunSneak=1..,rng=2..}] run scoreboard players remove @s rng 0
scoreboard players set @s gunSneak 0
