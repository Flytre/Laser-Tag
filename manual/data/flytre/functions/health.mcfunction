#Regenerates player health
#Displays their health on the actionbar using either the custom font or the
#alternate font
#Displays their health under their name

scoreboard players set @a[scores={health=2001..}] health 2000
scoreboard players set @a[scores={health=1989..1999}] health 2000
scoreboard players add @a[scores={health=..1988}] health 1



title @a[scores={alt_font=0,health=..200}] actionbar {"text":"\u2668\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=201..400}] actionbar {"text":"\u2668\u2668\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=401..600}] actionbar {"text":"\u2668\u2668\u2668\u2666\u2666\u2666\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=601..800}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2666\u2666\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=801..1000}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2666\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=1001..1200}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2666\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=1201..1400}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2666\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=1401..1600}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2666\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=1601..1800}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2666\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=1801..2000}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"white"}
title @a[scores={alt_font=0,health=2000..}] actionbar {"text":"\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u2668\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200\u1200","color":"dark_red"}

title @a[scores={alt_font=1,health=..200}] actionbar ["",{"text":"\u2764","color":"dark_red"},{"text":" (1)","color":"gold"}]
title @a[scores={alt_font=1,health=201..400}] actionbar ["",{"text":"\u2764\u2764","color":"dark_red"},{"text":" (2)","color":"gold"}]
title @a[scores={alt_font=1,health=401..600}] actionbar ["",{"text":"\u2764\u2764\u2764","color":"dark_red"},{"text":" (3)","color":"gold"}]
title @a[scores={alt_font=1,health=601..800}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (4)","color":"gold"}]
title @a[scores={alt_font=1,health=801..1000}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (5)","color":"gold"}]
title @a[scores={alt_font=1,health=1001..1200}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (6)","color":"gold"}]
title @a[scores={alt_font=1,health=1201..1400}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (7)","color":"gold"}]
title @a[scores={alt_font=1,health=1401..1600}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (8)","color":"gold"}]
title @a[scores={alt_font=1,health=1601..1800}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (9)","color":"gold"}]
title @a[scores={alt_font=1,health=1801..2000}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764","color":"dark_red"},{"text":" (10)","color":"gold"}]
title @a[scores={alt_font=1,health=2000..}] actionbar ["",{"text":"\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764\u2764","color":"red"},{"text":" (10)","color":"gold"}]

scoreboard players operation @s health_bar = @s health
scoreboard players operation @s health_bar /= 20 health_bar
