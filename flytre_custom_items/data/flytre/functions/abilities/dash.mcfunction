####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
playsound block.beacon.activate player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have used Dash!","color":"none"}]
effect give @s speed 6 1 true

#Update the clip, reload time, cooldown, and item.
scoreboard players set @s dash_cd -300
