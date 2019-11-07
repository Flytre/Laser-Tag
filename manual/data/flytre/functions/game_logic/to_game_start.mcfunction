scoreboard players set game_stage global 2
scoreboard players set @a gunSneak 0
scoreboard players set @a sneak 0
scoreboard players set @a otherDamage 0
scoreboard players set @a health 2000
scoreboard players set @a rightclick 0


scoreboard players set @a kills 0

team modify blue nametagVisibility never
team modify green nametagVisibility never

bossbar set flytre:waiting players 0
bossbar set flytre:waiting value 0

#change this later
fill -25 7 66 -27 9 66 air
fill -27 7 25 -25 9 25 air

execute at @e[tag=green_spawn,limit=1,sort=nearest] run spawnpoint @a[team=green] ~ ~ ~
execute at @e[tag=blue_spawn,limit=1,sort=nearest] run spawnpoint @a[team=blue] ~ ~ ~

title @a title {"text":" "}
title @a subtitle ["",{"text":"The game has ","color":"white"},{"text":"begun","color":"gold"},{"text":"!","color":"white"}]

bossbar set flytre:blue_score players @a
bossbar set flytre:green_score players @a
bossbar set flytre:blue_score value 0
bossbar set flytre:green_score value 0

scoreboard players reset @a trigger

scoreboard objectives setdisplay sidebar

tellraw @a ["",{"text":"------------","color":"green"},{"text":"\n"},{"text":"\n"},{"text":"Objective: ","color":"dark_gray"},{"text":"Kill enemy players to gain points for your team.","color":"gold"},{"text":"\n"},{"text":"------------","color":"green"}]
scoreboard players add @a alt_font 0
scoreboard players enable @a alt_font
schedule function flytre:tips/tip_5 5s
schedule function flytre:tips/tip_2 15s
schedule function flytre:tips/tip_4 45s