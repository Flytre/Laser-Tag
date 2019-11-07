setblock -46 6 25 structure_block{showboundingbox:1b, sizeZ: 32, sizeY: 12, name: "flytre:arena_3",showair:0b,integrity:1.0f, mode:"LOAD", powered: 0b}
setblock -45 6 25 minecraft:redstone_block
schedule function flytre:load_map/load_up 10t
schedule function flytre:load_map/to_stone 20t