####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

function flytre:rand_num
scoreboard players operation @s rng = num rng
scoreboard players operation @s rng %= ar_1 spray
execute if score @s rng matches 0 rotated ~ ~-7 run function flytre:guns/beam_ar_1
execute if score @s rng matches 1 rotated ~ ~-6 run function flytre:guns/beam_ar_1
execute if score @s rng matches 2 rotated ~ ~-5 run function flytre:guns/beam_ar_1
execute if score @s rng matches 3 rotated ~ ~-4 run function flytre:guns/beam_ar_1
execute if score @s rng matches 4 rotated ~ ~-3 run function flytre:guns/beam_ar_1
execute if score @s rng matches 5 rotated ~ ~-2 run function flytre:guns/beam_ar_1
execute if score @s rng matches 6 rotated ~ ~-1 run function flytre:guns/beam_ar_1
execute if score @s rng matches 7 rotated ~ ~0 run function flytre:guns/beam_ar_1
execute if score @s rng matches 8 rotated ~ ~1 run function flytre:guns/beam_ar_1
execute if score @s rng matches 9 rotated ~ ~2 run function flytre:guns/beam_ar_1
execute if score @s rng matches 10 rotated ~ ~3 run function flytre:guns/beam_ar_1
execute if score @s rng matches 11 rotated ~ ~4 run function flytre:guns/beam_ar_1
execute if score @s rng matches 12 rotated ~ ~5 run function flytre:guns/beam_ar_1
execute if score @s rng matches 13 rotated ~ ~6 run function flytre:guns/beam_ar_1
execute if score @s rng matches 14 rotated ~ ~7 run function flytre:guns/beam_ar_1
