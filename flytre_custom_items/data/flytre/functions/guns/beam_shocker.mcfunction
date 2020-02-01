####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s remove fired
scoreboard players add @s travel_time 1
execute as @s[scores={travel_time=4..}] run scoreboard players set @s travel_time 0
scoreboard players add @s range 1
scoreboard players operation @s damage *= shocker dropoff
scoreboard players operation @s damage /= 10000 dropoff
execute if score game_stage global matches 2 as @s[team=blue] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] add t_shocker
execute if score game_stage global matches 2 as @s[team=green] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] add t_shocker
execute if score game_stage global matches 2 as @s[team=blue,tag=!fired] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_shocker
execute if score game_stage global matches 2 as @s[team=green,tag=!fired] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_shocker
execute if score game_stage global matches 2 as @s[team=blue] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator] add t_shocker
execute if score game_stage global matches 2 as @s[team=green] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator] add t_shocker
execute if score game_stage global matches 2 as @s[team=blue,tag=!fired] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_shocker
execute if score game_stage global matches 2 as @s[team=green,tag=!fired] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function flytre:guns/damage_shocker
execute as @s[team=blue,scores={travel_time=0}] run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s[team=green,scores={travel_time=0}] run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1 force
execute as @s[team=green,scores={travel_time=2}] run particle minecraft:block yellow_concrete ~ ~ ~ 0 0 0 0 1 force
execute as @s[team=blue] unless entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] if score @s range matches ..80 if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function flytre:guns/beam_shocker
execute as @s[team=green] unless entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] if score @s range matches ..80 if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function flytre:guns/beam_shocker
