####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

scoreboard players set @a[distance=..0.7,tag=t_shotty] armor2 100
effect give @a[distance=..0.7,tag=t_shotty] instant_damage 1 0 true
tag @a[distance=..0.7,tag=t_shotty] add shot
scoreboard players operation @a[distance=..0.7,tag=t_shotty] armor2 -= shotty armorPen
execute as @a[distance=..0.7,tag=t_shotty] run scoreboard players operation @s armor2 *= @s armor
execute as @a[distance=..0.7,tag=t_shotty] run scoreboard players operation @s armor2 /= 100 dropoff
scoreboard players set @s damage2 100
scoreboard players add @s range 1000000
scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_shotty] armor2
scoreboard players operation @s damage *= @s damage2
scoreboard players operation @s damage /= 100 dropoff
scoreboard players operation @a[distance=..0.7,tag=t_shotty] health -= @s damage
execute as @a[distance=..0.7,tag=t_shotty] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_shotty]","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death] run scoreboard players add @s kills 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death] run scoreboard players add @s kills2 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_shotty]","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
tag @a[scores={health=..0},distance=..0.7,tag=t_shotty,tag=!gun_death] add gun_death
tag @a[distance=..0.7,tag=t_shotty] remove t_shotty
function flytre:sync_xp
