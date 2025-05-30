# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_smelteries:relocate/place_down_check

scoreboard players set $placed_block gm4_rl_data 1

summon armor_stand ~ ~-0.3 ~ {Small:1b,NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Silent:1b,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_smeltery_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1b,CustomName:"gm4_smeltery_stand",equipment:{head:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":"block/smeltery_unlit"}}},Rotation:[180.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_smeltery",Rotation:[180.0f,0.0f]}
execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[type=armor_stand,tag=gm4_new_machine,distance=..2] run data modify entity @s equipment set from storage gm4_relocators:temp gm4_relocation.entity_data.equipment

execute rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run summon armor_stand ^ ^-1.5 ^-1 {NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Silent:1b,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_smeltery_cauldron","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1b,CustomName:"gm4_smeltery_cauldron",Rotation:[180.0f,0.0f]}

execute store result score $new gm4_smelt_id run data get entity @e[type=marker,distance=..0.1,tag=gm4_new_machine,limit=1] UUID[3]
scoreboard players operation @e[distance=..3,tag=gm4_new_machine] gm4_smelt_id = $new gm4_smelt_id

execute as @e[tag=gm4_new_machine,distance=..3] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
scoreboard players set @e[distance=..3,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..3] remove gm4_new_machine
