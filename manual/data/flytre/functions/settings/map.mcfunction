#Outdated file
#

setblock 60 26 50 air

execute if score map global matches 2 run setblock 60 26 50 minecraft:oak_wall_sign[facing=west]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Bridges\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Rec. 2-7 ppl \",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute if score map global matches 2 run scoreboard players set map global 3

execute if score map global matches 1 run setblock 60 26 50 minecraft:oak_wall_sign[facing=west]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Warehouse\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Rec. 2-6 ppl \",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute if score map global matches 1 run scoreboard players set map global 2
execute if score map global matches 1 run scoreboard players set map global 2

execute unless score map global matches 1.. run setblock 60 26 50 minecraft:oak_wall_sign[facing=west]{Text1:"{\"text\":\"[Setting]\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger trigger set 135798\"}}",Text2:"[\"\",{\"text\":\"Map: \",\"color\":\"white\"},{\"text\":\"Labyrinth\",\"color\":\"dark_red\"}]",Text3:"{\"text\":\"Rec. 4-11 ppl \",\"color\":\"blue\"}",Text4:"[\"\",{\"text\":\"Click to change\",\"italic\":true,\"color\":\"dark_purple\"}]"}
execute unless score map global matches 1.. run scoreboard players set map global 1

execute if score map global matches 3 run scoreboard players set map global 0


playsound minecraft:block.note_block.guitar block @s ~ ~ ~ 100