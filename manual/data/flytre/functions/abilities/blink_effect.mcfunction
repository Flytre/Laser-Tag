

execute as @s[x=-7,y=7,z=65,dx=-37,dy=8,dz=-38,x_rotation=15..90] at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run tp @s ^ ^ ^1
execute as @s[x=-7,y=7,z=65,dx=-37,dy=8,dz=-38,x_rotation=0..14] at @s rotated ~ 0 if block ^ ^0.1 ^1 air if block ^ ^1.1 ^1 air run tp @s ^ ^0.1 ^1
execute as @s[x=-7,y=7,z=65,dx=-37,dy=8,dz=-38,x_rotation=-90..-1] at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run tp @s ^ ^ ^1

scoreboard players add @s custom_item 1

execute as @s[scores={custom_item=1}] at @s unless entity @s[x=-7,y=7,z=65,dx=-37,dy=8,dz=-38] run tellraw @s ["",{"text":"[","color":"green"},{"text":"Ability","color":"none"},{"text":"]","color":"green"},{"text":":","color":"none"},{"text":" You cannot blink here!","color":"none"}]

particle minecraft:smoke ~ ~-.1 ~0 0 .05 0 0 10 force

execute as @s[scores={custom_item=..10}] at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run function flytre:abilities/blink_effect
