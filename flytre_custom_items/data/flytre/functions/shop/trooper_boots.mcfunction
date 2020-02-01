####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

tag @s[nbt={Inventory:[{tag:{armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}}]}] add preowner
tellraw @s[tag=preowner] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You've already bought a ","color":"none"},{"text":"§rTrooper Boots","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=10..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rTrooper Boots","color":"gold"},{"text":".","color":"none"}]
tellraw @s[tag=!preowner,scores={credits=..9}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rTrooper Boots","color":"gold"},{"text":".","color":"none"}]
replaceitem entity @s[tag=!preowner,scores={credits=10..},team=green] armor.feet leather_boots{display:{Name:"\"§rTrooper Boots\"",Lore:["\"§7Armor: §c15%\""],color:4325135},armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
replaceitem entity @s[tag=!preowner,scores={credits=10..},team=blue] armor.feet leather_boots{display:{Name:"\"§rTrooper Boots\"",Lore:["\"§7Armor: §c15%\""],color:262348},armor:15,HideFlags:63,AttributeModifiers:[],Enchantments:[{id:"minecraft:binding_curse",lvl:1}],Unbreakable:1b}
scoreboard players remove @s[tag=!preowner,scores={credits=10..}] credits 10
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
tag @s remove preowner
