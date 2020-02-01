####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_pistol_1

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s pistol_1_cl 1
execute as @s[scores={pistol_1_rl=0,pistol_1_cl=1..}] run function flytre:abilities/loot/pistol_1_clip
execute as @s[scores={pistol_1_cl=..0}] run scoreboard players set @s pistol_1_rl -42
scoreboard players set @s pistol_1_cd -6
