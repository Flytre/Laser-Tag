####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

scoreboard players set @a[distance=..0.7,tag=t_minigun] armor2 100
effect give @a[distance=..0.7,tag=t_minigun] instant_damage 1 0 true
tag @a[distance=..0.7,tag=t_minigun] add shot
scoreboard players operation @a[distance=..0.7,tag=t_minigun] armor2 -= minigun armorPen
execute as @a[distance=..0.7,tag=t_minigun] run scoreboard players operation @s armor2 *= @s armor
execute as @a[distance=..0.7,tag=t_minigun] run scoreboard players operation @s armor2 /= 100 dropoff
scoreboard players set @s damage2 100
scoreboard players add @s range 1000000
scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_minigun] armor2
scoreboard players operation @s damage *= @s damage2
scoreboard players operation @s damage /= 100 dropoff
scoreboard players operation @a[distance=..0.7,tag=t_minigun] health -= @s damage
execute as @a[distance=..0.7,tag=t_minigun] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_minigun]","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death] run scoreboard players add @s kills 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death] run scoreboard players add @s kills2 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_minigun]","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
tag @a[scores={health=..0},distance=..0.7,tag=t_minigun,tag=!gun_death] add gun_death
tag @a[distance=..0.7,tag=t_minigun] remove t_minigun
function flytre:sync_xp
