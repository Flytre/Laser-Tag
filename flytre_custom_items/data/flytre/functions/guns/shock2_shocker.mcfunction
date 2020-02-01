####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s add shocked
tag @s remove shocking
execute as @a[tag=initial_shocker,team=blue] run tag @r[distance=..5,tag=!shocked,team=!blue,gamemode=!spectator] add shocking
execute as @a[tag=initial_shocker,team=green] run tag @r[distance=..5,tag=!shocked,team=!green,gamemode=!spectator] add shocking
execute as @s positioned ~ ~1 ~ if entity @a[tag=shocking,limit=1] facing entity @a[tag=shocking,distance=..5,limit=1] eyes run function flytre:guns/shock_line_shocker
execute as @s at @s as @p[tag=shocking] at @s run function flytre:guns/shock_shocker
