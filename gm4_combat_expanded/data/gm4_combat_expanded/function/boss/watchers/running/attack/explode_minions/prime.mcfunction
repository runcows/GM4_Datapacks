
tag @s add gm4_ce_boss.watcher.minion_exploding
attribute @s minecraft:movement_speed modifier add gm4_combat_expanded:freeze_minion -100 add_multiplied_total
attribute @s minecraft:attack_damage modifier add gm4_combat_expanded:freeze_minion -100 add_multiplied_total
playsound minecraft:entity.allay.death hostile @a ~ ~ ~ 1 2
