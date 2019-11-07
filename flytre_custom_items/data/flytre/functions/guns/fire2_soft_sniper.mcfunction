####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= soft_sniper spray
execute if score @s rng matches 0 rotated ~ ~-1 run function flytre:guns/beam_soft_sniper
execute if score @s rng matches 1 rotated ~ ~0 run function flytre:guns/beam_soft_sniper
