####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_pistol_3

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s pistol_3_cl 1
execute as @s[scores={pistol_3_rl=0,pistol_3_cl=1..}] run function flytre:abilities/loot/pistol_3_clip
execute as @s[scores={pistol_3_cl=..0}] run scoreboard players set @s pistol_3_rl -40
scoreboard players set @s pistol_3_cd -5
