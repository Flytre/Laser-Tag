####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= pistol_1 spray
execute if score @s rng matches 0 rotated ~ ~-1 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 1 rotated ~ ~0 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 2 rotated ~ ~1 run function flytre:guns/beam_pistol_1
