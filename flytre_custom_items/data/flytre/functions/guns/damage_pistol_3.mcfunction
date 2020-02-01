####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

scoreboard players set @a[distance=..0.7,tag=t_pistol_3] armor2 100
effect give @a[distance=..0.7,tag=t_pistol_3] instant_damage 1 0 true
tag @a[distance=..0.7,tag=t_pistol_3] add shot
scoreboard players operation @a[distance=..0.7,tag=t_pistol_3] armor2 -= pistol_3 armorPen
execute as @a[distance=..0.7,tag=t_pistol_3] run scoreboard players operation @s armor2 *= @s armor
execute as @a[distance=..0.7,tag=t_pistol_3] run scoreboard players operation @s armor2 /= 100 dropoff
scoreboard players set @s damage2 100
scoreboard players add @s range 1000000
scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_pistol_3] armor2
scoreboard players operation @s damage *= @s damage2
scoreboard players operation @s damage /= 100 dropoff
scoreboard players operation @a[distance=..0.7,tag=t_pistol_3] health -= @s damage
execute as @a[distance=..0.7,tag=t_pistol_3] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_pistol_3]","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death] run scoreboard players add @s kills 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death] run scoreboard players add @s kills2 1
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@p[scores={health=..0},distance=..0.7,tag=t_pistol_3]","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
tag @a[scores={health=..0},distance=..0.7,tag=t_pistol_3,tag=!gun_death] add gun_death
tag @a[distance=..0.7,tag=t_pistol_3] remove t_pistol_3
function flytre:sync_xp
