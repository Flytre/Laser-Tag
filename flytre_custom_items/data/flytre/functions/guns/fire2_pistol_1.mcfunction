####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= pistol_1 spray
execute if score @s rng matches 0 rotated ~ ~-6 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 1 rotated ~ ~-5 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 2 rotated ~ ~-4 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 3 rotated ~ ~-3 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 4 rotated ~ ~-2 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 5 rotated ~ ~-1 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 6 rotated ~ ~0 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 7 rotated ~ ~1 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 8 rotated ~ ~2 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 9 rotated ~ ~3 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 10 rotated ~ ~4 run function flytre:guns/beam_pistol_1
execute if score @s rng matches 11 rotated ~ ~5 run function flytre:guns/beam_pistol_1
