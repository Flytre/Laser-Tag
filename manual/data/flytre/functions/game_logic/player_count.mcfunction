scoreboard players set players global 0
scoreboard players set playing global 0
scoreboard players set players_green global 0
scoreboard players set players_blue global 0

execute as @a[gamemode=!spectator] run scoreboard players add playing global 1
execute as @a run scoreboard players add players global 1
execute as @a[team=green] run scoreboard players add players_green global 1
execute as @a[team=blue] run scoreboard players add players_blue global 1

