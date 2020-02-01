####################################################################################################
#Automatically Generated File
#Created Using: Flytre's Custom Item Generator
#Created: 02/01/2020 17:56
####################################################################################################

effect clear @a[scores={fatigue=0,rightclick=0}] mining_fatigue
execute as @a store result score @s fatigue run data get entity @s SelectedItem.tag.Damage 100
effect give @a[scores={fatigue=1..}] mining_fatigue 1 255 true
effect give @a[scores={rightclick=1..}] mining_fatigue 1 255 true



#Ability: soft_sniper

#Update cooldown.
scoreboard players add @a soft_sniper_cd 0
scoreboard players add @a[scores={soft_sniper_cd=..-1}] soft_sniper_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={soft_sniper_rl=-1}] soft_sniper_cl 5
scoreboard players add @a[scores={soft_sniper_rl=..-1}] soft_sniper_rl 1
scoreboard players add @a soft_sniper_rl 0
scoreboard players add @a soft_sniper_cl 0

#Update the durability bar based on the cooldown bar.
scoreboard players add @a soft_sniper_cd 1
execute as @a[scores={soft_sniper_rl=0..,soft_sniper_cd=..-1},nbt={Inventory:[{tag:{ability:"soft_sniper"}}]}] run function flytre:abilities/loot/soft_sniper
scoreboard players remove @a soft_sniper_cd 1

#Update the charges and reload durability bar when needed.
execute as @a[scores={soft_sniper_cd=0..,soft_sniper_rl=0,soft_sniper_cl=1..}] run function flytre:abilities/loot/soft_sniper_clip
scoreboard players add @a soft_sniper_rl 1
execute as @a[scores={soft_sniper_rl=..0},nbt={Inventory:[{tag:{ability:"soft_sniper"}}]}] run function flytre:abilities/loot/soft_sniper_reload
scoreboard players remove @a soft_sniper_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,soft_sniper_cd=0,soft_sniper_cl=1..,soft_sniper_rl=0},nbt={SelectedItem:{tag:{ability:"soft_sniper"}}}] at @s run function flytre:abilities/soft_sniper



#Ability: hard_sniper

#Update cooldown.
scoreboard players add @a hard_sniper_cd 0
scoreboard players add @a[scores={hard_sniper_cd=..-1}] hard_sniper_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"hard_sniper"}}]}] run function flytre:abilities/loot/hard_sniper

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,hard_sniper_cd=0},nbt={SelectedItem:{tag:{ability:"hard_sniper"}}}] at @s run function flytre:abilities/hard_sniper



#Ability: pistol_1

#Update cooldown.
scoreboard players add @a pistol_1_cd 0
scoreboard players add @a[scores={pistol_1_cd=..-1}] pistol_1_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={pistol_1_rl=-1}] pistol_1_cl 10
scoreboard players add @a[scores={pistol_1_rl=..-1}] pistol_1_rl 1
scoreboard players add @a pistol_1_rl 0
scoreboard players add @a pistol_1_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={pistol_1_cd=0..,pistol_1_rl=0,pistol_1_cl=1..}] run function flytre:abilities/loot/pistol_1_clip
scoreboard players add @a pistol_1_rl 1
execute as @a[scores={pistol_1_rl=..0},nbt={Inventory:[{tag:{ability:"pistol_1"}}]}] run function flytre:abilities/loot/pistol_1_reload
scoreboard players remove @a pistol_1_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,pistol_1_cd=0,pistol_1_cl=1..,pistol_1_rl=0},nbt={SelectedItem:{tag:{ability:"pistol_1"}}}] at @s run function flytre:abilities/pistol_1
execute as @a[scores={rightclick=1..,pistol_1_cd=0,pistol_1_cl=1..,pistol_1_rl=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"pistol_1"}}]}] at @s run function flytre:abilities/pistol_1



#Ability: pistol_2

#Update cooldown.
scoreboard players add @a pistol_2_cd 0
scoreboard players add @a[scores={pistol_2_cd=..-1}] pistol_2_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={pistol_2_rl=-1}] pistol_2_cl 20
scoreboard players add @a[scores={pistol_2_rl=..-1}] pistol_2_rl 1
scoreboard players add @a pistol_2_rl 0
scoreboard players add @a pistol_2_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={pistol_2_cd=0..,pistol_2_rl=0,pistol_2_cl=1..}] run function flytre:abilities/loot/pistol_2_clip
scoreboard players add @a pistol_2_rl 1
execute as @a[scores={pistol_2_rl=..0},nbt={Inventory:[{tag:{ability:"pistol_2"}}]}] run function flytre:abilities/loot/pistol_2_reload
scoreboard players remove @a pistol_2_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,pistol_2_cd=0,pistol_2_cl=1..,pistol_2_rl=0},nbt={SelectedItem:{tag:{ability:"pistol_2"}}}] at @s run function flytre:abilities/pistol_2
execute as @a[scores={rightclick=1..,pistol_2_cd=0,pistol_2_cl=1..,pistol_2_rl=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"pistol_2"}}]}] at @s run function flytre:abilities/pistol_2



#Ability: pistol_3

#Update cooldown.
scoreboard players add @a pistol_3_cd 0
scoreboard players add @a[scores={pistol_3_cd=..-1}] pistol_3_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={pistol_3_rl=-1}] pistol_3_cl 20
scoreboard players add @a[scores={pistol_3_rl=..-1}] pistol_3_rl 1
scoreboard players add @a pistol_3_rl 0
scoreboard players add @a pistol_3_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={pistol_3_cd=0..,pistol_3_rl=0,pistol_3_cl=1..}] run function flytre:abilities/loot/pistol_3_clip
scoreboard players add @a pistol_3_rl 1
execute as @a[scores={pistol_3_rl=..0},nbt={Inventory:[{tag:{ability:"pistol_3"}}]}] run function flytre:abilities/loot/pistol_3_reload
scoreboard players remove @a pistol_3_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,pistol_3_cd=0,pistol_3_cl=1..,pistol_3_rl=0},nbt={SelectedItem:{tag:{ability:"pistol_3"}}}] at @s run function flytre:abilities/pistol_3
execute as @a[scores={rightclick=1..,pistol_3_cd=0,pistol_3_cl=1..,pistol_3_rl=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"pistol_3"}}]}] at @s run function flytre:abilities/pistol_3



#Ability: smg

#Update cooldown.
scoreboard players add @a smg_cd 0
scoreboard players add @a[scores={smg_cd=..-1}] smg_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={smg_rl=-1}] smg_cl 40
scoreboard players add @a[scores={smg_rl=..-1}] smg_rl 1
scoreboard players add @a smg_rl 0
scoreboard players add @a smg_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={smg_cd=0..,smg_rl=0,smg_cl=1..}] run function flytre:abilities/loot/smg_clip
scoreboard players add @a smg_rl 1
execute as @a[scores={smg_rl=..0},nbt={Inventory:[{tag:{ability:"smg"}}]}] run function flytre:abilities/loot/smg_reload
scoreboard players remove @a smg_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,smg_cd=0,smg_cl=1..,smg_rl=0},nbt={SelectedItem:{tag:{ability:"smg"}}}] at @s run function flytre:abilities/smg



#Ability: ar_1

#Update cooldown.
scoreboard players add @a ar_1_cd 0
scoreboard players add @a[scores={ar_1_cd=..-1}] ar_1_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={ar_1_rl=-1}] ar_1_cl 25
scoreboard players add @a[scores={ar_1_rl=..-1}] ar_1_rl 1
scoreboard players add @a ar_1_rl 0
scoreboard players add @a ar_1_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={ar_1_cd=0..,ar_1_rl=0,ar_1_cl=1..}] run function flytre:abilities/loot/ar_1_clip
scoreboard players add @a ar_1_rl 1
execute as @a[scores={ar_1_rl=..0},nbt={Inventory:[{tag:{ability:"ar_1"}}]}] run function flytre:abilities/loot/ar_1_reload
scoreboard players remove @a ar_1_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,ar_1_cd=0,ar_1_cl=1..,ar_1_rl=0},nbt={SelectedItem:{tag:{ability:"ar_1"}}}] at @s run function flytre:abilities/ar_1



#Ability: ar_2

#Update cooldown.
scoreboard players add @a ar_2_cd 0
scoreboard players add @a[scores={ar_2_cd=..-1}] ar_2_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={ar_2_rl=-1}] ar_2_cl 30
scoreboard players add @a[scores={ar_2_rl=..-1}] ar_2_rl 1
scoreboard players add @a ar_2_rl 0
scoreboard players add @a ar_2_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={ar_2_cd=0..,ar_2_rl=0,ar_2_cl=1..}] run function flytre:abilities/loot/ar_2_clip
scoreboard players add @a ar_2_rl 1
execute as @a[scores={ar_2_rl=..0},nbt={Inventory:[{tag:{ability:"ar_2"}}]}] run function flytre:abilities/loot/ar_2_reload
scoreboard players remove @a ar_2_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,ar_2_cd=0,ar_2_cl=1..,ar_2_rl=0},nbt={SelectedItem:{tag:{ability:"ar_2"}}}] at @s run function flytre:abilities/ar_2



#Ability: shotty

#Update cooldown.
scoreboard players add @a shotty_cd 0
scoreboard players add @a[scores={shotty_cd=..-1}] shotty_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={shotty_rl=-1}] shotty_cl 2
scoreboard players add @a[scores={shotty_rl=..-1}] shotty_rl 1
scoreboard players add @a shotty_rl 0
scoreboard players add @a shotty_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={shotty_cd=0..,shotty_rl=0,shotty_cl=1..}] run function flytre:abilities/loot/shotty_clip
scoreboard players add @a shotty_rl 1
execute as @a[scores={shotty_rl=..0},nbt={Inventory:[{tag:{ability:"shotty"}}]}] run function flytre:abilities/loot/shotty_reload
scoreboard players remove @a shotty_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,shotty_cd=0,shotty_cl=1..,shotty_rl=0},nbt={SelectedItem:{tag:{ability:"shotty"}}}] at @s run function flytre:abilities/shotty



#Ability: ar_3

#Update cooldown.
scoreboard players add @a ar_3_cd 0
scoreboard players add @a[scores={ar_3_cd=..-1}] ar_3_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={ar_3_rl=-1}] ar_3_cl 3
scoreboard players add @a[scores={ar_3_rl=..-1}] ar_3_rl 1
scoreboard players add @a ar_3_rl 0
scoreboard players add @a ar_3_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={ar_3_cd=0..,ar_3_rl=0,ar_3_cl=1..}] run function flytre:abilities/loot/ar_3_clip
scoreboard players add @a ar_3_rl 1
execute as @a[scores={ar_3_rl=..0},nbt={Inventory:[{tag:{ability:"ar_3"}}]}] run function flytre:abilities/loot/ar_3_reload
scoreboard players remove @a ar_3_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,ar_3_cd=0,ar_3_cl=1..,ar_3_rl=0},nbt={SelectedItem:{tag:{ability:"ar_3"}}}] at @s run function flytre:abilities/ar_3



#Ability: goo

#Update cooldown.
scoreboard players add @a goo_cd 0
scoreboard players add @a[scores={goo_cd=..-1}] goo_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={goo_rl=-1}] goo_cl 10
scoreboard players add @a[scores={goo_rl=..-1}] goo_rl 1
scoreboard players add @a goo_rl 0
scoreboard players add @a goo_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={goo_cd=0..,goo_rl=0,goo_cl=1..}] run function flytre:abilities/loot/goo_clip
scoreboard players add @a goo_rl 1
execute as @a[scores={goo_rl=..0},nbt={Inventory:[{tag:{ability:"goo"}}]}] run function flytre:abilities/loot/goo_reload
scoreboard players remove @a goo_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,goo_cd=0,goo_cl=1..,goo_rl=0},nbt={SelectedItem:{tag:{ability:"goo"}}}] at @s run function flytre:abilities/goo



#Ability: rocket

#Update cooldown.
scoreboard players add @a rocket_cd 0
scoreboard players add @a[scores={rocket_cd=..-1}] rocket_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"rocket"}}]}] run function flytre:abilities/loot/rocket

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,rocket_cd=0},nbt={SelectedItem:{tag:{ability:"rocket"}}}] at @s run function flytre:abilities/rocket



#Ability: shocker

#Update cooldown.
scoreboard players add @a shocker_cd 0
scoreboard players add @a[scores={shocker_cd=..-1}] shocker_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"shocker"}}]}] run function flytre:abilities/loot/shocker

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,shocker_cd=0},nbt={SelectedItem:{tag:{ability:"shocker"}}}] at @s run function flytre:abilities/shocker



#Ability: minigun

#Update cooldown.
scoreboard players add @a minigun_cd 0
scoreboard players add @a[scores={minigun_cd=..-1}] minigun_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={minigun_rl=-1}] minigun_cl 100
scoreboard players add @a[scores={minigun_rl=..-1}] minigun_rl 1
scoreboard players add @a minigun_rl 0
scoreboard players add @a minigun_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={minigun_cd=0..,minigun_rl=0,minigun_cl=1..}] run function flytre:abilities/loot/minigun_clip
scoreboard players add @a minigun_rl 1
execute as @a[scores={minigun_rl=..0},nbt={Inventory:[{tag:{ability:"minigun"}}]}] run function flytre:abilities/loot/minigun_reload
scoreboard players remove @a minigun_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,minigun_cd=0,minigun_cl=1..,minigun_rl=0},nbt={SelectedItem:{tag:{ability:"minigun"}}}] at @s run function flytre:abilities/minigun



#Ability: firecracker

#Update cooldown.
scoreboard players add @a firecracker_cd 0
scoreboard players add @a[scores={firecracker_cd=..-1}] firecracker_cd 1

#Update reload time and refill clip when fully reloaded.
scoreboard players set @a[scores={firecracker_rl=-1}] firecracker_cl 20
scoreboard players add @a[scores={firecracker_rl=..-1}] firecracker_rl 1
scoreboard players add @a firecracker_rl 0
scoreboard players add @a firecracker_cl 0

#Update the charges and reload durability bar when needed.
execute as @a[scores={firecracker_cd=0..,firecracker_rl=0,firecracker_cl=1..}] run function flytre:abilities/loot/firecracker_clip
scoreboard players add @a firecracker_rl 1
execute as @a[scores={firecracker_rl=..0},nbt={Inventory:[{tag:{ability:"firecracker"}}]}] run function flytre:abilities/loot/firecracker_reload
scoreboard players remove @a firecracker_rl 1

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,firecracker_cd=0,firecracker_cl=1..,firecracker_rl=0},nbt={SelectedItem:{tag:{ability:"firecracker"}}}] at @s run function flytre:abilities/firecracker



#Ability: weak_heal

#Update cooldown.
scoreboard players add @a weak_heal_cd 0
scoreboard players add @a[scores={weak_heal_cd=..-1}] weak_heal_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"weak_heal"}}]}] run function flytre:abilities/loot/weak_heal

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,weak_heal_cd=0},nbt={SelectedItem:{tag:{ability:"weak_heal"}}}] at @s run function flytre:abilities/weak_heal
execute as @a[scores={rightclick=1..,weak_heal_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"weak_heal"}}]}] at @s run function flytre:abilities/weak_heal



#Ability: strong_heal

#Update cooldown.
scoreboard players add @a strong_heal_cd 0
scoreboard players add @a[scores={strong_heal_cd=..-1}] strong_heal_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"strong_heal"}}]}] run function flytre:abilities/loot/strong_heal

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,strong_heal_cd=0},nbt={SelectedItem:{tag:{ability:"strong_heal"}}}] at @s run function flytre:abilities/strong_heal
execute as @a[scores={rightclick=1..,strong_heal_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"strong_heal"}}]}] at @s run function flytre:abilities/strong_heal



#Ability: dash

#Update cooldown.
scoreboard players add @a dash_cd 0
scoreboard players add @a[scores={dash_cd=..-1}] dash_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"dash"}}]}] run function flytre:abilities/loot/dash

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,dash_cd=0},nbt={SelectedItem:{tag:{ability:"dash"}}}] at @s run function flytre:abilities/dash
execute as @a[scores={rightclick=1..,dash_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"dash"}}]}] at @s run function flytre:abilities/dash

#Overtime effect
execute as @a[scores={dash_cd=-300..-200}] at @s run function flytre:abilities/dash_time



#Ability: blink

#Update cooldown.
scoreboard players add @a blink_cd 0
scoreboard players add @a[scores={blink_cd=..-1}] blink_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"blink"}}]}] run function flytre:abilities/loot/blink

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,blink_cd=0},nbt={SelectedItem:{tag:{ability:"blink"}}}] at @s run function flytre:abilities/blink
execute as @a[scores={rightclick=1..,blink_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"blink"}}]}] at @s run function flytre:abilities/blink



#Ability: team_heal

#Update cooldown.
scoreboard players add @a team_heal_cd 0
scoreboard players add @a[scores={team_heal_cd=..-1}] team_heal_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"team_heal"}}]}] run function flytre:abilities/loot/team_heal

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,team_heal_cd=0},nbt={SelectedItem:{tag:{ability:"team_heal"}}}] at @s run function flytre:abilities/team_heal
execute as @a[scores={rightclick=1..,team_heal_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"team_heal"}}]}] at @s run function flytre:abilities/team_heal



#Ability: spectral_eye

#Update cooldown.
scoreboard players add @a spectral_eye_cd 0
scoreboard players add @a[scores={spectral_eye_cd=..-1}] spectral_eye_cd 1

#Update the durability bar based on the cooldown bar.
execute as @a[nbt={Inventory:[{tag:{ability:"spectral_eye"}}]}] run function flytre:abilities/loot/spectral_eye

#Run the ability when the conditions are right.
execute as @a[scores={rightclick=1..,spectral_eye_cd=0},nbt={SelectedItem:{tag:{ability:"spectral_eye"}}}] at @s run function flytre:abilities/spectral_eye
execute as @a[scores={rightclick=1..,spectral_eye_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:"spectral_eye"}}]}] at @s run function flytre:abilities/spectral_eye
scoreboard players set @a[scores={rightclick=1..}] rightclick 0
scoreboard players set @a custom_item 0
