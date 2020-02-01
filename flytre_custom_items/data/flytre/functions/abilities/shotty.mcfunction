####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/initiate_shotty

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s shotty_cl 1
execute as @s[scores={shotty_rl=0,shotty_cl=1..}] run function flytre:abilities/loot/shotty_clip
execute as @s[scores={shotty_cl=..0}] run scoreboard players set @s shotty_rl -44
scoreboard players set @s shotty_cd -5
