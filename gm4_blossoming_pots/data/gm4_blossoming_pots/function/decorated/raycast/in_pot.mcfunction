# checks if execution context is inside the decorated pots hit box
# @s = player who interacted with a decorated pot
# at @s anchored eyes, then marched forward 0.005 over and over. Complicated.
# run from decorated/raycast/loop

# early return if not dec pot
execute unless block ~ ~ ~ minecraft:decorated_pot run return fail

# summon marker for checking
summon minecraft:marker ~ ~ ~ {Tags:["gm4_blossoming_pots.temp.decorated_pot","smithed.strict","smithed.entity"],CustomName:'{"text":"gm4_blossoming_pots.temp_marker"}'}

# if temp marker in physical hit box, return 1
# dxdydz all 0 bc of MC-123441.
execute as @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.decorated_pot,distance=..0.1] \
    align xyz positioned ~0.062499 ~ ~0.062499 if entity @s[dx=0,dy=0,dz=0] at @s align xyz positioned ~-0.062499 ~ ~-0.062499 if entity @s[dx=0,dy=0,dz=0] \
    run return 1

# else, kill marker, return fail
kill @e[type=minecraft:marker,tag=gm4_blossoming_pots.temp.decorated_pot,distance=..0.1,sort=nearest]
return fail