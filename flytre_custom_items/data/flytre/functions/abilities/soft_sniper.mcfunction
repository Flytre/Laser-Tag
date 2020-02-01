####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_soft_sniper

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s soft_sniper_cl 1
execute as @s[scores={soft_sniper_rl=0,soft_sniper_cl=1..}] run function flytre:abilities/loot/soft_sniper_clip
execute as @s[scores={soft_sniper_cl=..0}] run scoreboard players set @s soft_sniper_rl -240
scoreboard players set @s soft_sniper_cd -50
