####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_ar_1

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s ar_1_cl 1
execute as @s[scores={ar_1_rl=0,ar_1_cl=1..}] run function flytre:abilities/loot/ar_1_clip
execute as @s[scores={ar_1_cl=..0}] run scoreboard players set @s ar_1_rl -64
scoreboard players set @s ar_1_cd -3
