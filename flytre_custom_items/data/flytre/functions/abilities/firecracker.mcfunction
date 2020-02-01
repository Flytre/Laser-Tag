####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_firecracker

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s firecracker_cl 1
execute as @s[scores={firecracker_rl=0,firecracker_cl=1..}] run function flytre:abilities/loot/firecracker_clip
execute as @s[scores={firecracker_cl=..0}] run scoreboard players set @s firecracker_rl -42
scoreboard players set @s firecracker_cd -5
