#Uses a loot table to produce an RNG
loot replace block 0 4 0 container.0 loot flytre:rng
execute store result score num rng run data get block 0 4 0 Items[0].tag.Damage 1
