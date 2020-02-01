####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
playsound flytre.powerup.2 player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" Your Spectral Eye has activated, revealing nearby enemies!","color":"none"}]
execute rotated ~ 0 run function flytre:particles/spectral_eye
execute as @s[team=blue] run effect give @a[team=green,distance=..18] glowing 5 0 true
execute as @s[team=green] run effect give @a[team=blue,distance=..18] glowing 5 0 true

#Update the clip, reload time, cooldown, and item.
scoreboard players set @s spectral_eye_cd -500
