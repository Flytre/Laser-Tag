####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################


playsound flytre.powerup.1 player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have healed your team!","color":"none"}]
execute rotated 180 0 run function flytre:particles/heal_1
execute rotated 0 0 run function flytre:particles/heal_1
execute rotated 0 0 run function flytre:particles/heal_2
execute as @a[team=green] run scoreboard players set @s[team=green,scores={health=1600..}] health 2000
execute as @s[team=green] run scoreboard players add @a[team=green,scores={health=..1599}] health 400
execute as @a[team=blue] run scoreboard players set @s[team=blue,scores={health=1600..}] health 2000
execute as @s[team=blue] run scoreboard players add @a[team=blue,scores={health=..1599}] health 400
scoreboard players set @s team_heal_cd -450
