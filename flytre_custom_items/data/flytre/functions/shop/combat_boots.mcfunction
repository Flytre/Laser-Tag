####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/23/2019 09:23
####################################################################################################

tellraw @s[scores={credits=20..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rCombat Boots","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..19}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rCombat Boots","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[scores={credits=20..},team=green] armor.feet leather_boots{display:{Name:"\"§rCombat Boots\"",Lore:["\"§7Armor: §c25%\""],color:4325135},armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[scores={credits=20..},team=blue] armor.feet leather_boots{display:{Name:"\"§rCombat Boots\"",Lore:["\"§7Armor: §c25%\""],color:262348},armor:25,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[scores={credits=20..}] credits 20
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
