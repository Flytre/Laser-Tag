####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_ar_2

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s ar_2_cl 1
execute as @s[scores={ar_2_rl=0,ar_2_cl=1..}] run function flytre:abilities/loot/ar_2_clip
execute as @s[scores={ar_2_cl=..0}] run scoreboard players set @s ar_2_rl -42
scoreboard players set @s ar_2_cd -5
