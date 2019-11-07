team modify blue nametagVisibility always
team modify green nametagVisibility always

tp @a @e[tag=shop,limit=1,sort=nearest]
execute as @a run function flytre:game_logic/basic_armor
scoreboard players reset * credits
scoreboard players set @a credits 120
scoreboard players set game_stage global 1
bossbar set flytre:waiting players @a

function flytre:game_logic/player_count
execute if score map global matches 0 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Bridges","color":"gold"}, {"text":" has been picked.","color":"none"}]
execute if score map global matches 0 run function flytre:load_map/arena_3

execute if score map global matches 1 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Labyrinth","color":"gold"}, {"text":" has been picked.","color":"none"}]
execute if score map global matches 1 run function flytre:load_map/arena_1

execute if score map global matches 2 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Warehouse","color":"gold"}, {"text":" has been picked.","color":"none"}]
execute if score map global matches 2 run function flytre:load_map/arena_2

execute if score mode global matches 0 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The game mode is ","color":"none"}, {"text":"Team Deathmatch","color":"gold"}, {"text":".","color":"none"}]


execute if score mode global matches 1 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The game mode is ","color":"none"}, {"text":"Capture The Flag","color":"gold"}, {"text":".","color":"none"}]


schedule function flytre:tips/tip_1 5s
schedule function flytre:tips/tip_3 12s