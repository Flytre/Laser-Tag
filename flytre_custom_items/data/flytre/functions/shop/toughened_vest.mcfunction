####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=10..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rToughened Vest","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..9}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rToughened Vest","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[scores={credits=10..},team=green] armor.chest leather_chestplate{display:{Name:"\"§rToughened Vest\"",Lore:["\"§7Armor: §c20%\""],color:4325135},armor:20,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[scores={credits=10..},team=blue] armor.chest leather_chestplate{display:{Name:"\"§rToughened Vest\"",Lore:["\"§7Armor: §c20%\""],color:262348},armor:20,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[scores={credits=10..}] credits 10
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
