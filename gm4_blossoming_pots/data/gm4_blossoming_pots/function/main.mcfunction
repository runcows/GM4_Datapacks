execute as @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.decorated_pot] at @s unless block ~ ~ ~ minecraft:decorated_pot run kill @s
execute as @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot] at @s unless block ~ ~ ~ minecraft:flower_pot run kill @s
execute as @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot] at @s unless block ~ ~ ~ minecraft:flower_pot run function gm4_blossoming_pots:flower/item/break with entity @s data

schedule function gm4_blossoming_pots:main 16t