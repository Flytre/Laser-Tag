####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################


playsound block.beacon.activate player @s
tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You have used dash!","color":"none"}]
effect give @s speed 6 1 true
scoreboard players set @s dash_cd -300
