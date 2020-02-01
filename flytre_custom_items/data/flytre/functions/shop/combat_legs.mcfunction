####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{armor:30,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§rCombat Pants","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rCombat Pants","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rCombat Pants","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[tag=!preowner,scores={credits=25..},team=green] armor.legs leather_leggings{display:{Name:"\"§rCombat Pants\"",Lore:["\"§7Armor: §c30%\""],color:4325135},armor:30,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[tag=!preowner,scores={credits=25..},team=blue] armor.legs leather_leggings{display:{Name:"\"§rCombat Pants\"",Lore:["\"§7Armor: §c30%\""],color:262348},armor:30,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[tag=!preowner,scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
