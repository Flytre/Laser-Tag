####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_smg

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s smg_cl 1
execute as @s[scores={smg_rl=0,smg_cl=1..}] run function flytre:abilities/loot/smg_clip
execute as @s[scores={smg_cl=..0}] run scoreboard players set @s smg_rl -50
scoreboard players set @s smg_cd -2
