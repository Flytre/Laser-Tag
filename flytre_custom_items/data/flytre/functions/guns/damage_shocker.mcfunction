####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @a remove shocked
tag @a remove shock
tag @a remove initial_shocker
tag @s add initial_shocker
tag @a[distance=..0.7,tag=t_shocker,limit=1] add shocked
execute as @a[distance=..0.7,tag=t_shocker,limit=1] at @s run function flytre:guns/shock_shocker
tag @a[distance=..0.7,tag=t_shocker] remove t_shocker
function flytre:sync_xp
