# Sets up raycast, then redirects to as_marker, then revokes advancement
# @s = player who interacted with a filled vanilla flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_vanilla_flower_pot

# Raycast for the pot (set up range and search)
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 1
scoreboard players operation @s gm4_blossoming_pots.range *= $raycast_multiplier gm4_blossoming_pots.range
execute anchored eyes run function gm4_blossoming_pots:flower/vanilla_pots/raycast/loop

execute as @e[type=minecraft:marker,sort=nearest,tag=gm4_blossoming_pots.temp.vanilla_flower_pot] at @s \
    align xyz positioned ~.5 ~.5 ~.5 run function gm4_blossoming_pots:flower/vanilla_pots/as_marker

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_vanilla_flower_pot