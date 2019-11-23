bossbar set flytre:blue_score players 0
bossbar set flytre:green_score players 0
bossbar set flytre:blue_score value 0
bossbar set flytre:green_score value 0

team modify blue nametagVisibility always
team modify green nametagVisibility always

tp @a @e[tag=lobby_start,limit=1,sort=nearest]

gamemode adventure @a

clear @a
scoreboard players set game_stage global 0

clear @a minecraft:carved_pumpkin

execute if score mode global matches 1 if score green_score global matches 10000.. run scoreboard players set green_score global 10000
execute if score mode global matches 1 if score blue_score global matches 10000.. run scoreboard players set blue_score global 10000

title @a title ""
execute if score players_blue global matches 0 run title @a subtitle ["",{"text":"Creeper Victory!","color":"green","bold":true}]
execute if score players_green global matches 0 run title @a subtitle ["",{"text":"Guardian Victory!","color":"blue","bold":true}]
execute if score green_score global matches 10000.. run title @a subtitle ["",{"text":"Creeper Victory!","color":"green","bold":true}]
execute if score blue_score global matches 10000.. run title @a subtitle ["",{"text":"Guardian Victory!","color":"blue","bold":true}]


tellraw @a ["",{"text":"Final Score: "},{"score":{"name":"green_score","objective":"global"},"color":"green"},{"text":"-","color":"black"},{"score":{"name":"blue_score","objective":"global"},"color":"aqua"}]

scoreboard players set highestKills global 0
execute as @a run scoreboard players operation @s kills2 = @s kills
scoreboard players operation highestKills global > @a kills
scoreboard players operation @a kills2 -= highestKills global

tellraw @a ["",{"text":"Highest Kills: ","color":"white"},{"selector":"@a[scores={kills2=0..}]","color":"white"},{"text":" with ","color":"white"},{"score":{"name":"@a[limit=1,scores={kills2=0}]","objective":"kills"}}]


scoreboard players set @a kills2 0
scoreboard players set @a kills 0

tellraw @a ["",{"text":"Thank you for playing Laser Tag by Flytre.","color":"gold"}]

scoreboard players set green_score global 0
scoreboard players set blue_score global 0

tag @a remove quadKill

team leave @a

#reset teams
function flytre:game_logic/recreate_teams

effect clear @a