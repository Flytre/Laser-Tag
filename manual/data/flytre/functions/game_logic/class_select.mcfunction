gamemode adventure @a[gamemode=!adventure]
effect give @a saturation 10 0 true
effect give @a resistance 1 4 true
effect give @a weakness 1 4 true

scoreboard players set @a health 120000
function flytre:generic_base

#need to edit this later
fill -25 7 66 -27 9 66 minecraft:iron_bars[west=true,east=true]
fill -27 7 25 -25 9 25 minecraft:iron_bars[west=true,east=true]

scoreboard players enable @a trigger
function flytre:shop_base


scoreboard players add @a credits 0

xp set @a 0 levels

scoreboard players set @a[x=-143,y=16,z=-65,dx=-5,dy=1,dz=3] rejoin 1
execute as @a[scores={rejoin=1..}] run tp @s @e[tag=shop,limit=1,sort=nearest]
execute as @a[scores={rejoin=1..}] run function flytre:game_logic/player_count
execute as @a[scores={rejoin=1..}] if score players_green global <= players_blue global run team join green
execute as @a[scores={rejoin=1..}] if score players_green global > players_blue global run team join blue
execute as @a[scores={rejoin=1..}] run effect clear @s
execute as @a[scores={rejoin=1..}] run scoreboard players set @s credits 120
execute as @a[scores={rejoin=1..}] run clear @s
execute as @a[scores={rejoin=1..}] run gamemode adventure @s
scoreboard players set @a[scores={rejoin=1..}] rejoin 0

execute as @e[type=item] at @s run tp @s @p
execute as @e[type=item] at @s run data merge entity @s {PickupDelay:0}

execute as @a[scores={credits=120},tag=!green_concrete] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] if block ~ ~-1 ~ lime_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" Select gear before marking yourself as ready!","color":"none"}]
execute as @a[scores={credits=120},tag=!green_concrete] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] if block ~ ~-1 ~ lime_concrete run tag @s add green_concrete
execute as @a at @s unless block ~ ~-1 ~ lime_concrete run tag @s remove green_concrete

execute as @a[scores={credits=..119}] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] if block ~ ~-1 ~ lime_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" Teleporting to the arena...","color":"none"}]
execute as @a[scores={credits=..119}] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] if block ~ ~-1 ~ lime_concrete run scoreboard players reset @s credits
execute as @a[team=green] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] unless score @s credits matches -1..1200 if block ~ ~-1 ~ lime_concrete run tp @s @e[tag=green_spawn,limit=1,sort=nearest]
execute as @a[team=blue] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] unless score @s credits matches -1..1200 if block ~ ~-1 ~ lime_concrete run tp @s @e[tag=blue_spawn,limit=1,sort=nearest]

execute as @a[scores={credits=120}] run clear @s
execute as @a[scores={credits=120}] run function flytre:game_logic/basic_armor
execute as @a[scores={credits=120},tag=!orange_concrete] at @s if block ~ ~-1 ~ orange_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":"Your loadout is already empty, and cannot be reset","color":"none"}]
execute as @a[scores={credits=120},tag=!orange_concrete] at @s if block ~ ~-1 ~ orange_concrete run tag @s add orange_concrete
execute as @a at @s unless block ~ ~-1 ~ orange_concrete run tag @s remove orange_concrete
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have reset your loadout!","color":"none"}]
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run kill @e[type=item,distance=..30]
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run tag @s add orange_concrete
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run clear @s
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run function flytre:game_logic/basic_armor
execute as @a[scores={credits=..119}] at @s if block ~ ~-1 ~ orange_concrete run scoreboard players set @s credits 120

execute as @a[gamemode=!spectator] at @s if entity @e[tag=shop,limit=1,sort=nearest,distance=..30] run title @s actionbar ["",{"text":"Credits: ","color":"gold"},{"score":{"name":"@s","objective":"credits"}}]

execute as @e[type=item_frame] run data merge entity @s {ItemRotation: 0b}

scoreboard players set ready global 0
execute as @a if entity @e[tag=map_center,limit=1,sort=nearest,distance=..100] run scoreboard players add ready global 1
function flytre:game_logic/player_count
execute store result bossbar flytre:waiting max run scoreboard players get playing global
execute store result bossbar flytre:waiting value run scoreboard players get ready global
execute as @e[tag=map_center,limit=1,sort=nearest] at @s unless entity @a[distance=60..] run function flytre:game_logic/to_game_start