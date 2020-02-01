####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

particle minecraft:explosion ~ ~ ~ 0 0 0 0 10 force
effect give @a[gamemode=!spectator,team=!green,distance=..4] instant_damage 1 0 true
scoreboard players remove @a[gamemode=!spectator,team=!green,distance=..4] health 100
scoreboard players remove @a[gamemode=!spectator,team=!green,distance=..3] health 100
scoreboard players remove @a[gamemode=!spectator,team=!green,distance=..2] health 300
scoreboard players remove @a[gamemode=!spectator,team=!green,distance=..1] health 500
execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death,tag=!quadKill]","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death] run scoreboard players add @s kills 1
execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death] run scoreboard players add @s kills2 1
execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death,tag=quadKill]","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@s","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!green,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
tag @a[scores={health=..0},distance=..4,tag=!gun_death,gamemode=!spectator,team=!green] add gun_death
tag @a[distance=..0.7,tag=t_rocket] remove t_rocket
