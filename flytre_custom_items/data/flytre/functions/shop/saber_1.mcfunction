####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

tellraw @s[scores={credits=25..}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You have bought a","color":"none"},{"text":" §rSaber","color":"gold"},{"text":".","color":"none"}]
tellraw @s[scores={credits=..24}] ["",{"text":"[","color":"green"},{"text":"Shop","color":"none"},{"text":"]","color":"green"},{"text":": You cannot afford a","color":"none"},{"text":" §rSaber","color":"gold"},{"text":".","color":"none"}]
give @s[scores={credits=25..},team=green] carrot_on_a_stick{display:{Name:"\"§rSaber\"",Lore:["\"§7Damage: §c7\"","\"§7Speed: §c1.5\"","\"§7Armor Pierce: §c100%\"","\"§7Health Regen: §c+10 §7hp/sec\""]},HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:13,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:"mainhand"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-2.5,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:"mainhand"}],type:"saber",CustomModelData:7}
give @s[scores={credits=25..},team=blue] carrot_on_a_stick{display:{Name:"\"§rSaber\"",Lore:["\"§7Damage: §c7\"","\"§7Speed: §c1.5\"","\"§7Armor Pierce: §c100%\"","\"§7Health Regen: §c+10 §7hp/sec\""]},HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:13,Operation:0,UUIDLeast:182591,UUIDMost:608443,Slot:"mainhand"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-2.5,Operation:0,UUIDLeast:824699,UUIDMost:990954,Slot:"mainhand"}],type:"saber",CustomModelData:8}
scoreboard players remove @s[scores={credits=25..}] credits 25
playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25
