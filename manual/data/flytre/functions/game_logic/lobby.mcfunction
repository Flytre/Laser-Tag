gamemode adventure @a[gamemode=!adventure]
effect give @a saturation 10 0 true
effect give @a resistance 1 4 true
effect give @a weakness 1 4 true

tp @a[tag=!init] 87 28 44 -90 0
tag @a add init

execute as @a at @s unless entity @e[tag=lobby_start,distance=..60] run tp @s @e[tag=lobby_start,limit=1]
execute at @e[tag=lobby_start,limit=1,sort=nearest] run spawnpoint @a ~ ~ ~
scoreboard players set @a health 2000

execute as @a[team=!green] at @s if block ~ ~-1 ~ lime_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Team","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have joined the ","color":"none"},{"text":"Creeper Team","color":"green"},{"text":"!","color":"none"}]
execute as @a[tag=!green_join,team=green] at @s if block ~ ~-1 ~ lime_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Team","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You are already on the ","color":"none"},{"text":"Creeper Team","color":"green"},{"text":"!","color":"none"}]
execute as @a[tag=!green_join,team=green] at @s if block ~ ~-1 ~ lime_concrete run playsound minecraft:entity.evoker.prepare_summon player @s
execute as @a[team=!green] at @s if block ~ ~-1 ~ lime_concrete run playsound minecraft:entity.evoker.prepare_summon block @s ~ ~ ~ 5
execute as @a[team=!green] at @s if block ~ ~-1 ~ lime_concrete run team join green
execute as @a at @s if block ~ ~-1 ~ lime_concrete run tag @s add green_join
execute as @a at @s unless block ~ ~-1 ~ lime_concrete unless block ~ ~-2 ~ lime_concrete run tag @s remove green_join

execute as @a[team=!blue] at @s if block ~ ~-1 ~ light_blue_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Team","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have joined the ","color":"none"},{"text":"Guardian Team","color":"aqua"},{"text":"!","color":"none"}]
execute as @a[tag=!blue_join,team=blue] at @s if block ~ ~-1 ~ light_blue_concrete run tellraw @s ["",{"text":"[","color":"green"},{"text":"Team","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You are already on the ","color":"none"},{"text":"Guardian Team","color":"aqua"},{"text":"!","color":"none"}]
execute as @a[tag=!blue_join,team=blue] at @s if block ~ ~-1 ~ light_blue_concrete run playsound minecraft:entity.evoker.prepare_summon player @s
execute as @a[team=!blue] at @s if block ~ ~-1 ~ light_blue_concrete run playsound minecraft:entity.evoker.prepare_summon block @s ~ ~ ~ 5
execute as @a[team=!blue] at @s if block ~ ~-1 ~ light_blue_concrete run team join blue
execute as @a at @s if block ~ ~-1 ~ light_blue_concrete run tag @s add blue_join

execute as @a at @s unless block ~ ~-1 ~ light_blue_concrete unless block ~ ~-2 ~ light_blue_concrete run tag @s remove blue_join

scoreboard players set @a[x=-143,y=16,z=-65,dx=-5,dy=1,dz=3] rejoin 1
execute as @a[scores={rejoin=1..}] run tp @s @e[tag=lobby_start,limit=1,sort=nearest]
execute as @a[scores={rejoin=1..}] run team leave @s
execute as @a[scores={rejoin=1..}] run effect clear @s
execute as @a[scores={rejoin=1..}] run clear @s
execute as @a[scores={rejoin=1..}] run gamemode adventure @s
scoreboard players set @a[scores={rejoin=1..}] rejoin 0

xp set @a 0 levels
scoreboard players set @a health_bar 100

execute if block 105 32 9 minecraft:stone_button[powered=true] positioned 105 32 9 run playsound flytre.button block @a[distance=..5] ~ ~ ~
execute if block 105 32 9 minecraft:stone_button[powered=true] run function flytre:game_logic/player_count
execute if block 105 32 9 minecraft:stone_button[powered=true] if score players global matches 1 run tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"Game","color":"red","bold":true},{"text":"]:","color":"dark_red","bold":false},{"text":" This game requires 2+ players.","color":"red"}]
execute if block 105 32 9 minecraft:stone_button[powered=true] if score players global matches 2.. if entity @a[team=] run tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"Game","color":"red","bold":true},{"text":"]:","color":"dark_red","bold":false},{"text":"  Every player must be on a team to start the game.","color":"red"}]
execute if block 105 32 9 minecraft:stone_button[powered=true] if score players global matches 2.. if score players_green global matches 0 unless entity @a[team=] run tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"Game","color":"red","bold":true},{"text":"]:","color":"dark_red","bold":false},{"text":"  At least 1 player must be on the Creeper team .","color":"red"}]
execute if block 105 32 9 minecraft:stone_button[powered=true] if score players global matches 2.. if score players_blue global matches 0 unless entity @a[team=] run tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"Game","color":"red","bold":true},{"text":"]:","color":"dark_red","bold":false},{"text":"  At least 1 player must be on the Guardian team is required.","color":"red"}]
execute if block 105 32 9 minecraft:stone_button[powered=true] if score players global matches 2.. unless entity @a[team=] if score players_green global matches 1.. if score players_blue global matches 1.. run function flytre:game_logic/to_class_select
execute if block 105 32 9 minecraft:stone_button[powered=true] run setblock 105 32 9 minecraft:stone_button[facing=south,powered=false,face=wall]

#setting
scoreboard players enable @a trigger
execute as @a[scores={trigger=135798}] at @s run function flytre:settings/map
execute as @a[scores={trigger=135799}] at @s run function flytre:credits

scoreboard players set @a trigger 0