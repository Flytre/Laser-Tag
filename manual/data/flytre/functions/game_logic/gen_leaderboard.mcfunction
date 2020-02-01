scoreboard players reset @a[team=] kills

tellraw @a ["",{"text":"--------------------","color":"white"}]
tellraw @a ["",{"text":"Tags:","color":"gold"}]
execute as @a[team=!] run scoreboard players operation @s kills3 = @s kills
function flytre:game_logic/kills_leaderboard

tellraw @a ["",{"text":"","color":"white"}]

scoreboard players reset @a[team=] kills
scoreboard players set highestKills global 0
execute as @a run scoreboard players operation @s kills2 = @s kills
scoreboard players operation highestKills global > @a kills
scoreboard players operation @a kills2 -= highestKills global


tellraw @a ["",{"text":"MVP: ","color":"gold"},{"selector":"@a[scores={kills2=0..}]","color":"white"}]
tellraw @a ["",{"text":"Final Score: ","color":"gold"},{"score":{"name":"green_score","objective":"global"},"color":"green"},{"text":"-","color":"white"},{"score":{"name":"blue_score","objective":"global"},"color":"aqua"}]
tellraw @a ["",{"text":"--------------------","color":"white"}]

scoreboard players set @a kills2 0
scoreboard players set @a kills 0