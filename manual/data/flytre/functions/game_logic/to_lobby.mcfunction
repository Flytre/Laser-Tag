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

function flytre:game_logic/gen_leaderboard

tellraw @a {"text":"Click here to go to Flytre's Twitter.","color":"aqua","clickEvent":{"action":"open_url","value":"https://twitter.com/Flytre7"}}
scoreboard players set green_score global 0
scoreboard players set blue_score global 0

tag @a remove quadKill

team leave @a

#reset teams
function flytre:game_logic/recreate_teams

effect clear @a