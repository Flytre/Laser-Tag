####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=95..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §6FlyteForce §rNightmare","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..94}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §6FlyteForce §rNightmare","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=95..},team=green] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rNightmare\"",Lore:["\"§7Damage: §c22\"","\"§7Speed: §c0.18\"","\"§7Range: §c50\"","\"§7Spray: §c0\"","\"§7Armor Pierce: §c95%\"","\"§7Dropoff: §c0.0\"","\"§7Movement Speed: §c-10%\""]},ability:"hard_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:12182,UUIDMost:119041,Slot:"mainhand"}],CustomModelData:3}
give @s[scores={credits=95..},team=blue] carrot_on_a_stick{display:{Name:"\"§6FlyteForce §rNightmare\"",Lore:["\"§7Damage: §c22\"","\"§7Speed: §c0.18\"","\"§7Range: §c50\"","\"§7Spray: §c0\"","\"§7Armor Pierce: §c95%\"","\"§7Dropoff: §c0.0\"","\"§7Movement Speed: §c-10%\""]},ability:"hard_sniper",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:1,UUIDLeast:12182,UUIDMost:119041,Slot:"mainhand"}],CustomModelData:4}
scoreboard players remove @s[scores={credits=95..}] credits 95
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
