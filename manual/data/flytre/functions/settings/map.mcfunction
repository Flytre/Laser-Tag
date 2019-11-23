setblock 101 32 12 air
forceload remove all

execute if score map global matches 2 run setblock 101 32 12 minecraft:oak_wall_sign[facing=south]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Moon Base\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Dev Favorite\",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute if score map global matches 2 run forceload add 2997 -21 3083 -106
execute if score map global matches 2 run scoreboard players set map global 3



execute if score map global matches 1 run setblock 101 32 12 minecraft:oak_wall_sign[facing=south]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Laboratory\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Duck and Cover\",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute if score map global matches 1 run forceload add 1000 -8 952 -55
execute if score map global matches 1 run scoreboard players set map global 2

execute unless score map global matches 1.. run setblock 101 32 12 minecraft:oak_wall_sign[facing=south]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Globe\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Open\",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute unless score map global matches 1.. run forceload add 1980 26 2028 -28
execute unless score map global matches 1.. run scoreboard players set map global 1

execute if score map global matches 3 run scoreboard players set map global 0


playsound minecraft:block.note_block.guitar block @s ~ ~ ~ 100