####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################


playsound flytre.powerup.1 player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have healed!","color":"none"}]
execute rotated 180 0 run function flytre:particles/heal_1
execute rotated 0 0 run function flytre:particles/heal_1
execute rotated 0 0 run function flytre:particles/heal_2
scoreboard players set @s[scores={health=1400..}] health 2000
scoreboard players add @s[scores={health=..1399}] health 600
scoreboard players set @s weak_heal_cd -350
