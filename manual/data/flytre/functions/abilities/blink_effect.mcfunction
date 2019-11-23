

execute as @s at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run tp @s ^ ^ ^1
execute as @s at @s rotated ~ 0 if block ^ ^0.1 ^1 air if block ^ ^1.1 ^1 air run tp @s ^ ^0.1 ^1
execute as @s at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run tp @s ^ ^ ^1

scoreboard players add @s custom_item 1

particle minecraft:smoke ~ ~-.1 ~0 0 .05 0 0 10 force

execute as @s[scores={custom_item=..10}] at @s if block ^ ^ ^1 air if block ^ ^1 ^1 air run function flytre:abilities/blink_effect
