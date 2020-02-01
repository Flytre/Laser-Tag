####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

#Add a sound, message, and all effects.
playsound entity.enderman.teleport player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have Blinked!","color":"none"}]
function flytre:abilities/blink_effect

#Update the clip, reload time, cooldown, and item.
scoreboard players set @s blink_cd -400
