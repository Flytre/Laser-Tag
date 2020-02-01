####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
function flytre:guns/fire_minigun

#Update the clip, reload time, cooldown, and item.
scoreboard players remove @s minigun_cl 1
execute as @s[scores={minigun_rl=0,minigun_cl=1..}] run function flytre:abilities/loot/minigun_clip
execute as @s[scores={minigun_cl=..0}] run scoreboard players set @s minigun_rl -130
scoreboard players set @s minigun_cd 0
