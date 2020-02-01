####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_goo

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s goo_cl 1
execute as @s[scores={goo_rl=0,goo_cl=1..}] run function flytre:abilities/loot/goo_clip
execute as @s[scores={goo_cl=..0}] run scoreboard players set @s goo_rl -108
scoreboard players set @s goo_cd -10
