####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

execute at @s run playsound minecraft:flytre.shocker.hit player @a[distance=..7] ~ ~ ~
tag @s add shocking
execute at @s run function flytre:particles/shocker
scoreboard players operation @a[tag=initial_shocker] damage *= 80
scoreboard players operation @a[tag=initial_shocker] damage /= 100
scoreboard players set @s armor2 100
tag @s add shot
scoreboard players operation @s armor2 -= shocker armorPen
scoreboard players operation @s armor2 *= @s armor
scoreboard players operation @s armor2 /= 100 dropoff
scoreboard players set @a[tag=initial_shocker] damage2 100
scoreboard players add @a[tag=initial_shocker] range 1000000
scoreboard players operation @a[tag=initial_shocker] damage2 -= @s armor2
scoreboard players operation @a[tag=initial_shocker] damage *= @a[tag=initial_shocker] damage2
scoreboard players operation @a[tag=initial_shocker] damage /= 100 dropoff
scoreboard players operation @s health -= @a[tag=initial_shocker] damage
effect give @s instant_damage 1 0 true
scoreboard players operation @a[tag=initial_shocker] damage *= 80 damage
scoreboard players operation @a[tag=initial_shocker] damage /= 100 damage
execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death,tag=!quadKill] run tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" was tagged by ","color":"yellow"},{"selector":"@a[tag=initial_shocker]","color":"yellow"},{"text":".","color":"yellow"}]
execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death] run scoreboard players add @a[tag=initial_shocker] kills 1
execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death] run scoreboard players add @a[tag=initial_shocker] kills2 1
execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death,tag=quadKill] run tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" lost their streak to ","color":"yellow"},{"selector":"@a[tag=initial_shocker]","color":"yellow"},{"text":".","color":"yellow"}]
execute as @a[scores={health=..0},tag=shocking,tag=!gun_death,tag=quadKill] run tag @s remove quadKill
execute as @a[scores={health=..0},tag=shocking,tag=!gun_death] run tag @s add gun_death
execute as @a[tag=shocking] run function flytre:guns/shock2_shocker
