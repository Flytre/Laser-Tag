####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
playsound flytre.powerup.1 player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have healed!","color":"none"}]
execute rotated 0 45 run function flytre:particles/heal_2
execute rotated 90 45 run function flytre:particles/heal_2
execute rotated 180 45 run function flytre:particles/heal_2
execute rotated 270 45 run function flytre:particles/heal_2
scoreboard players set @s[scores={health=1400..}] health 2000
scoreboard players add @s[scores={health=..1399}] health 600

#Update the clip, reload time, cooldown, and item.
scoreboard players set @s weak_heal_cd -350
