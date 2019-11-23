team modify blue nametagVisibility always
team modify green nametagVisibility always

tp @a @e[tag=shop,limit=1,sort=nearest]
execute as @a run function flytre:game_logic/basic_armor
scoreboard players reset * credits
scoreboard players set @a credits 120
scoreboard players set game_stage global 1
bossbar set flytre:waiting players @a

function flytre:game_logic/player_count
execute if score map global matches 0 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Moon Base","color":"gold"}, {"text":" has been picked.","color":"none"}]
execute if score map global matches 1 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Laboratory","color":"gold"}, {"text":" has been picked.","color":"none"}]
execute if score map global matches 2 run tellraw @a ["",{"text":"[","color":"green"},{"text":"Game","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" The map ","color":"none"}, {"text":"Globe","color":"gold"}, {"text":" has been picked.","color":"none"}]

schedule function flytre:tips/tip_1 5s
schedule function flytre:tips/tip_3 12s