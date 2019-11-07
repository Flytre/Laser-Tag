####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################


playsound entity.enderman.teleport player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have blinked!","color":"none"}]
function flytre:abilities/blink_effect
scoreboard players set @s blink_cd -400
