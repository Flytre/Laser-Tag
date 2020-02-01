####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

particle block yellow_concrete ~ ~ ~ 0 0 0 0 1 force
execute positioned ~ ~-1 ~ unless entity @a[tag=shocking,distance=..0.7] positioned ~ ~1 ~ positioned ^ ^ ^0.25 run function flytre:guns/shock_line_shocker
