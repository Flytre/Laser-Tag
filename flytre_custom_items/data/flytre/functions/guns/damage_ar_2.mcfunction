####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

scoreboard players set @a[distance=..0.7,tag=t_ar_2] armor2 100
effect give @a[distance=..0.7,tag=t_ar_2] instant_damage 1 0 true
tag @a[distance=..0.7,tag=t_ar_2] add shot
scoreboard players operation @a[distance=..0.7,tag=t_ar_2] armor2 -= ar_2 armorPen
execute as @a[distance=..0.7,tag=t_ar_2] run scoreboard players operation @s armor2 *= @s armor
execute as @a[distance=..0.7,tag=t_ar_2] run scoreboard players operation @s armor2 /= 100 dropoff
scoreboard players set @s damage2 100
scoreboard players add @s range 1000000
scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_ar_2] armor2
scoreboard players operation @s damage *= @s damage2
scoreboard players operation @s damage /= 100 dropoff
scoreboard players operation @a[distance=..0.7,tag=t_ar_2] health -= @s damage
execute as @a[distance=..0.7,tag=t_ar_2] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_ar_2]","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death] run scoreboard players add @s kills 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death] run scoreboard players add @s kills2 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_ar_2]","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
tag @a[scores={health=..0},distance=..0.7,tag=t_ar_2,tag=!gun_death] add gun_death
tag @a[distance=..0.7,tag=t_ar_2] remove t_ar_2
function flytre:sync_xp
