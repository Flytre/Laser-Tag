####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rCombat Pants","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rCombat Pants","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[scores={credits=25..},team=green] armor.legs leather_leggings{display:{Name:"\"§rCombat Pants\"",Lore:["\"§7Armor: §c25%\""],color:4325135},armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[scores={credits=25..},team=blue] armor.legs leather_leggings{display:{Name:"\"§rCombat Pants\"",Lore:["\"§7Armor: §c25%\""],color:262348},armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
