# @s = player with feigning pneuma who has been damaged and has less than 8 health
# run from advancement_triggers/player_damaged

# apply effects
effect give @s invisibility 10 255 true
effect give @s resistance 10 255 true
effect give @s slowness 10 255 true
effect give @s weakness 10 255 true
effect give @s regeneration 10 0 false
attribute @s minecraft:jump_strength modifier add gm4_orb_of_ankou:prevent_jump -1024 add_multiplied_total
scoreboard players set @s gm4_oa_jump_stop 13

# set data of hostile mobs
tag @e[type=#gm4_orb_of_ankou:feigning_affected,distance=..50] add gm4_oa_feigning
scoreboard players set @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,distance=..50] gm4_oa_feign_t 0
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,scores={gm4_oa_feign_t=0}] run attribute @s minecraft:follow_range modifier add minecraft:375cd73a-ea26-4ec8-b2a3-e999cfa3167e -1024 add_value

# push nearby mobs away
tag @s add gm4_feigning_player
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,scores={gm4_oa_feign_t=0},distance=..2] run function gm4_orb_of_ankou:pneumas/feigning/move_away
tag @a remove gm4_feigning_player

# give mobs their follow range back
schedule function gm4_orb_of_ankou:pneumas/temp_tick/feigning_revert 1t
