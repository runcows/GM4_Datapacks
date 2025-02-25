# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.base_nerf -3 add_value
attribute @s minecraft:attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -1 add_value
attribute @s minecraft:movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.05 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 15
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 20
scoreboard players set $mob_armor gm4_ce_data 4
scoreboard players set $mob_toughness gm4_ce_data 8
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 90

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest
loot replace entity @s armor.head loot gm4_combat_expanded:mob/equip_armor/generic/head
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/generic

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# mountainous
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run function gm4_combat_expanded:mob/init/modifier/special/mountain_zombie
# burned
execute if entity @s[type=husk,predicate=gm4_combat_expanded:mob/modifier/burned] run function gm4_combat_expanded:mob/init/modifier/special/burned_husk
# flowering
execute if predicate gm4_combat_expanded:mob/modifier/flowering run tag @s add gm4_ce_spore_zombie
execute if entity @s[tag=gm4_ce_spore_zombie] run function gm4_combat_expanded:mob/init/modifier/special/flowering_zombie
# toxic
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_weakness_attacks
# deep
attribute @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/deep] minecraft:movement_speed modifier add gm4_combat_expanded:stat_change.deep 0.2 add_multiplied_base
# reef
execute if entity @s[type=drowned,predicate=gm4_combat_expanded:mob/modifier/reef] run function gm4_combat_expanded:mob/init/modifier/special/reef_drowned
# growth
execute if entity @s[type=!zombie_villager,tag=!gm4_ce_spore_zombie,predicate=gm4_combat_expanded:mob/modifier/growth] run function gm4_combat_expanded:mob/init/modifier/special/growth_zombie

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# | Other Modifiers
# only allow one of the following modifiers
scoreboard players set $modifier_picked gm4_ce_data 0
# replace "Zombie leaders" with minibosses
execute if data entity @s[type=!zombie_villager] attributes[{id:"minecraft:max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run function gm4_combat_expanded:mob/init/modifier/special/zombie_leader
execute if data entity @s[type=zombie_villager] attributes[{id:"minecraft:max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run data remove entity @s attributes[{id:"minecraft:max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]
execute if entity @s[type=zombie,tag=gm4_ce_miniboss] run function gm4_combat_expanded:mob/init/modifier/special/zombie_miniboss
execute if entity @s[type=husk,tag=gm4_ce_miniboss] run function gm4_combat_expanded:mob/init/modifier/special/husk_miniboss
execute if entity @s[type=drowned,tag=gm4_ce_miniboss] run function gm4_combat_expanded:mob/init/modifier/special/drowned_miniboss
# baby zombie (zombie leader is never a baby)
execute if score $modifier_picked gm4_ce_data matches 0 if data entity @s {IsBaby:1b} store success score $modifier_picked gm4_ce_data run attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.baby_zombie -0.6 add_multiplied_base
# sprinter
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/chance/zombie_sprinter store success score $modifier_picked gm4_ce_data run effect give @s speed infinite 0
# shielded
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/chance/zombie_shielded run function gm4_combat_expanded:mob/init/modifier/special/zombie_shielded
# dual wield
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/chance/zombie_dual_wield run function gm4_combat_expanded:mob/init/modifier/special/zombie_dual_wield
# solid (KB resist)
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/chance/zombie_solid store success score $modifier_picked gm4_ce_data run attribute @s minecraft:knockback_resistance modifier add gm4_combat_expanded:stat_change.solid 0.45 add_value

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
