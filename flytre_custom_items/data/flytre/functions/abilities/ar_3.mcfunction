####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_ar_3

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s ar_3_cl 1
execute as @s[scores={ar_3_rl=0,ar_3_cl=1..}] run function flytre:abilities/loot/ar_3_clip
execute as @s[scores={ar_3_cl=..0}] run scoreboard players set @s ar_3_rl -25
scoreboard players set @s ar_3_cd 0
