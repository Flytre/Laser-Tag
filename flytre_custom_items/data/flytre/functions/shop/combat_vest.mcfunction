####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=30..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rCombat Vest","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..29}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rCombat Vest","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[scores={credits=30..},team=green] armor.chest leather_chestplate{display:{Name:"\"§rCombat Vest\"",Lore:["\"§7Armor: §c35%\""],color:4325135},armor:35,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[scores={credits=30..},team=blue] armor.chest leather_chestplate{display:{Name:"\"§rCombat Vest\"",Lore:["\"§7Armor: §c35%\""],color:262348},armor:35,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[scores={credits=30..}] credits 30
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
