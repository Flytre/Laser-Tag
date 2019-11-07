setblock 60 26 58 air


execute if score mode global matches 1 run setblock 60 26 58 minecraft:oak_wall_sign[facing=west]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135799\"}}",Text2:"[\"\",{\"text\":\"Team\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Deathmatch\",\"color\":\"dark_red\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute if score mode global matches 1 run scoreboard players set mode global 2
execute if score mode global matches 1 run scoreboard players set mode global 2

execute unless score mode global matches 1.. run setblock 60 26 58 minecraft:oak_wall_sign[facing=west]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135799\"}}",Text2:"[\"\",{\"text\":\"Capture\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"The Flag\",\"color\":\"dark_red\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute unless score mode global matches 1.. run scoreboard players set mode global 1

execute if score mode global matches 2 run scoreboard players set mode global 0


playsound minecraft:block.note_block.guitar block @s ~ ~ ~ 100