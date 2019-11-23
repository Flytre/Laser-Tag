execute as @e[type=item] at @s run data merge entity @s {Age:-32768,PickupDelay:32767,CustomNameVisible:1b}
execute as @e[type=item] at @s align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~
execute as @e[type=item] run data modify entity @s CustomName set from entity @s Item.tag.display.Name