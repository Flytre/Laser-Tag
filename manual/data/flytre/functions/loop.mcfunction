#Game-stage 0: lobby
#Game-stage 1: Class Select
#Game-stage 2: in a round
forceload add 84 44
execute unless score game_stage global matches 1.. run function flytre:game_logic/lobby
execute if score game_stage global matches 1 run function flytre:game_logic/class_select
execute if score game_stage global matches 2 run function flytre:game_logic/game

#Custom Ambience
execute as @a at @s if score musicTime global matches 0 run playsound minecraft:flytre.ambience.1 record @s
execute as @a at @s if score musicTime global matches 2620 run playsound minecraft:flytre.ambience.2 record @s
execute as @a at @s if score musicTime global matches 4860 run playsound minecraft:flytre.ambience.3 record @s
execute if score musicTime global matches 11900 run scoreboard players set musicTime global 0

scoreboard players add musicTime global 1