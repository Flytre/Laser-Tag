scoreboard players set highestKills global 0
execute as @a run scoreboard players operation @s kills2 = @s kills3
scoreboard players operation highestKills global > @a kills3
scoreboard players operation @a kills2 -= highestKills global
tellraw @a ["",{"selector":"@a[scores={kills2=0..}]","color":"gold"},{"text":": ","color":"white"},{"score":{"name":"@a[limit=1,scores={kills2=0}]","objective":"kills"}}]
scoreboard players set @a[scores={kills2=0..}] kills3 -1
execute if entity @a[scores={kills3=0..}] run function flytre:game_logic/kills_leaderboard