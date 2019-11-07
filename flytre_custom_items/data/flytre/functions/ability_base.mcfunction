####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 11/04/2019 07:50
####################################################################################################

scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"soft_sniper"}}}] soft_sniper_cd 0
scoreboard players add @a[scores={soft_sniper_cd=..-1}] soft_sniper_cd 1
scoreboard players remove @a[scores={soft_sniper_cd=..-1}] soft_sniper_cd 2
execute as @a store result entity @s Inventory[{tag:{ability:"soft_sniper"}}].tag.Damage int -0.48000 run scoreboard players get @s soft_sniper_cd
scoreboard players add @a[scores={soft_sniper_cd=..-1}] soft_sniper_cd 2
execute as @a[scores={rightclick=1..,soft_sniper_cd=0},nbt={SelectedItem:{tag:{ability:"soft_sniper"}}}] at @s run function flytre:abilities/soft_sniper
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"hard_sniper"}}}] hard_sniper_cd 0
scoreboard players add @a[scores={hard_sniper_cd=..-1}] hard_sniper_cd 1
scoreboard players remove @a[scores={hard_sniper_cd=..-1}] hard_sniper_cd 4
execute as @a store result entity @s Inventory[{tag:{ability:"hard_sniper"}}].tag.Damage int -0.21622 run scoreboard players get @s hard_sniper_cd
scoreboard players add @a[scores={hard_sniper_cd=..-1}] hard_sniper_cd 4
execute as @a[scores={rightclick=1..,hard_sniper_cd=0},nbt={SelectedItem:{tag:{ability:"hard_sniper"}}}] at @s run function flytre:abilities/hard_sniper
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"pistol_1"}}}] pistol_1_cd 0
scoreboard players add @a[scores={pistol_1_cd=..-1}] pistol_1_cd 1
execute as @a[scores={rightclick=1..,pistol_1_cd=0},nbt={SelectedItem:{tag:{ability:"pistol_1"}}}] at @s run function flytre:abilities/pistol_1
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"pistol_2"}}}] pistol_2_cd 0
scoreboard players add @a[scores={pistol_2_cd=..-1}] pistol_2_cd 1
execute as @a[scores={rightclick=1..,pistol_2_cd=0},nbt={SelectedItem:{tag:{ability:"pistol_2"}}}] at @s run function flytre:abilities/pistol_2
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"pistol_3"}}}] pistol_3_cd 0
scoreboard players add @a[scores={pistol_3_cd=..-1}] pistol_3_cd 1
execute as @a[scores={rightclick=1..,pistol_3_cd=0},nbt={SelectedItem:{tag:{ability:"pistol_3"}}}] at @s run function flytre:abilities/pistol_3
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"smg"}}}] smg_cd 0
scoreboard players add @a[scores={smg_cd=..-1}] smg_cd 1
execute as @a[scores={rightclick=1..,smg_cd=0},nbt={SelectedItem:{tag:{ability:"smg"}}}] at @s run function flytre:abilities/smg
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"ar_1"}}}] ar_1_cd 0
scoreboard players add @a[scores={ar_1_cd=..-1}] ar_1_cd 1
execute as @a[scores={rightclick=1..,ar_1_cd=0},nbt={SelectedItem:{tag:{ability:"ar_1"}}}] at @s run function flytre:abilities/ar_1
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"ar_2"}}}] ar_2_cd 0
scoreboard players add @a[scores={ar_2_cd=..-1}] ar_2_cd 1
execute as @a[scores={rightclick=1..,ar_2_cd=0},nbt={SelectedItem:{tag:{ability:"ar_2"}}}] at @s run function flytre:abilities/ar_2
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"weak_heal"}}}] weak_heal_cd 0
scoreboard players add @a[scores={weak_heal_cd=..-1}] weak_heal_cd 1
scoreboard players remove @a[scores={weak_heal_cd=..-1}] weak_heal_cd 14
execute as @a store result entity @s Inventory[{tag:{ability:"weak_heal"}}].tag.Damage int -0.06857 run scoreboard players get @s weak_heal_cd
scoreboard players add @a[scores={weak_heal_cd=..-1}] weak_heal_cd 14
execute as @a[scores={rightclick=1..,weak_heal_cd=0},nbt={SelectedItem:{tag:{ability:"weak_heal"}}}] at @s run function flytre:abilities/weak_heal
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"strong_heal"}}}] strong_heal_cd 0
scoreboard players add @a[scores={strong_heal_cd=..-1}] strong_heal_cd 1
scoreboard players remove @a[scores={strong_heal_cd=..-1}] strong_heal_cd 16
execute as @a store result entity @s Inventory[{tag:{ability:"strong_heal"}}].tag.Damage int -0.06000 run scoreboard players get @s strong_heal_cd
scoreboard players add @a[scores={strong_heal_cd=..-1}] strong_heal_cd 16
execute as @a[scores={rightclick=1..,strong_heal_cd=0},nbt={SelectedItem:{tag:{ability:"strong_heal"}}}] at @s run function flytre:abilities/strong_heal
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"dash"}}}] dash_cd 0
scoreboard players add @a[scores={dash_cd=..-1}] dash_cd 1
scoreboard players remove @a[scores={dash_cd=..-1}] dash_cd 12
execute as @a store result entity @s Inventory[{tag:{ability:"dash"}}].tag.Damage int -0.08000 run scoreboard players get @s dash_cd
scoreboard players add @a[scores={dash_cd=..-1}] dash_cd 12
execute as @a[scores={rightclick=1..,dash_cd=0},nbt={SelectedItem:{tag:{ability:"dash"}}}] at @s run function flytre:abilities/dash
execute as @a[scores={dash_cd=-300..-200}] at @s run function flytre:abilities/dash_time
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"blink"}}}] blink_cd 0
scoreboard players add @a[scores={blink_cd=..-1}] blink_cd 1
scoreboard players remove @a[scores={blink_cd=..-1}] blink_cd 16
execute as @a store result entity @s Inventory[{tag:{ability:"blink"}}].tag.Damage int -0.06000 run scoreboard players get @s blink_cd
scoreboard players add @a[scores={blink_cd=..-1}] blink_cd 16
execute as @a[scores={rightclick=1..,blink_cd=0},nbt={SelectedItem:{tag:{ability:"blink"}}}] at @s run function flytre:abilities/blink
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"team_heal"}}}] team_heal_cd 0
scoreboard players add @a[scores={team_heal_cd=..-1}] team_heal_cd 1
scoreboard players remove @a[scores={team_heal_cd=..-1}] team_heal_cd 18
execute as @a store result entity @s Inventory[{tag:{ability:"team_heal"}}].tag.Damage int -0.05333 run scoreboard players get @s team_heal_cd
scoreboard players add @a[scores={team_heal_cd=..-1}] team_heal_cd 18
execute as @a[scores={rightclick=1..,team_heal_cd=0},nbt={SelectedItem:{tag:{ability:"team_heal"}}}] at @s run function flytre:abilities/team_heal
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"spectral_eye"}}}] spectral_eye_cd 0
scoreboard players add @a[scores={spectral_eye_cd=..-1}] spectral_eye_cd 1
scoreboard players remove @a[scores={spectral_eye_cd=..-1}] spectral_eye_cd 20
execute as @a store result entity @s Inventory[{tag:{ability:"spectral_eye"}}].tag.Damage int -0.04800 run scoreboard players get @s spectral_eye_cd
scoreboard players add @a[scores={spectral_eye_cd=..-1}] spectral_eye_cd 20
execute as @a[scores={rightclick=1..,spectral_eye_cd=0},nbt={SelectedItem:{tag:{ability:"spectral_eye"}}}] at @s run function flytre:abilities/spectral_eye
scoreboard players add @a[nbt={SelectedItem:{tag:{ability:"shotty"}}}] shotty_cd 0
scoreboard players add @a[scores={shotty_cd=..-1}] shotty_cd 1
scoreboard players remove @a[scores={shotty_cd=..-1}] shotty_cd 0
execute as @a store result entity @s Inventory[{tag:{ability:"shotty"}}].tag.Damage int -1.20000 run scoreboard players get @s shotty_cd
scoreboard players add @a[scores={shotty_cd=..-1}] shotty_cd 0
execute as @a[scores={rightclick=1..,shotty_cd=0},nbt={SelectedItem:{tag:{ability:"shotty"}}}] at @s run function flytre:abilities/shotty
scoreboard players set @a[scores={rightclick=1..}] rightclick 0
scoreboard players set @a custom_item 0
