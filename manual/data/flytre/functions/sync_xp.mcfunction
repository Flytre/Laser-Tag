xp set @s 0 points
xp set @s 0 levels

scoreboard players operation @s xp_bar = @s damage
scoreboard players operation @s xp_bar /= 20 xp_bar


execute as @s[scores={damage=8192..}] run xp set @s 8192 levels
scoreboard players set @s[scores={damage=8192..}] damage 0

execute as @s[scores={damage=4096..}] run xp add @s 4096 levels
scoreboard players remove @s[scores={damage=4096..}] damage 4096

execute as @s[scores={damage=2048..}] run xp add @s 2048 levels
scoreboard players remove @s[scores={damage=2048..}] damage 2048

execute as @s[scores={damage=1024..}] run xp add @s 1024 levels
scoreboard players remove @s[scores={damage=1024..}] damage 1024

execute as @s[scores={damage=512..}] run xp add @s 512 levels
scoreboard players remove @s[scores={damage=512..}] damage 512

execute as @s[scores={damage=256..}] run xp add @s 256 levels
scoreboard players remove @s[scores={damage=256..}] damage 256

execute as @s[scores={damage=128..}] run xp add @s 128 levels
scoreboard players remove @s[scores={damage=128..}] damage 128

execute as @s[scores={damage=64..}] run xp add @s 64 levels
scoreboard players remove @s[scores={damage=64..}] damage 64

execute as @s[scores={damage=32..}] run xp add @s 32 levels
scoreboard players remove @s[scores={damage=32..}] damage 32

execute as @s[scores={damage=16..}] run xp add @s 16 levels
scoreboard players remove @s[scores={damage=16..}] damage 16

execute as @s[scores={damage=8..}] run xp add @s 8 levels
scoreboard players remove @s[scores={damage=8..}] damage 8

execute as @s[scores={damage=4..}] run xp add @s 4 levels
scoreboard players remove @s[scores={damage=4..}] damage 4

execute as @s[scores={damage=2..}] run xp add @s 2 levels
scoreboard players remove @s[scores={damage=2..}] damage 2

execute as @s[scores={damage=1..}] run xp add @s 1 levels
scoreboard players remove @s[scores={damage=1..}] damage 1

execute store result score @s damage run xp query @s levels