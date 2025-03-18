# Adds a bit value to the marker at players location and continues
# @s = marker at players feet
# at @s
# with {bit, bit_tag}
# run from gm4_reeling_rods:player/received_bit

# add bit data
$data modify entity @e[type=minecraft:marker,distance=..0.001,tag=gm4_reeling_rods.player_marker,limit=1] data.gm4_reeling_rods.id.bit_$(bit) set value "$(bit_tag)"

# fail if not all bits
execute unless score @s gm4_reeling_rods.bit_count matches 16 run return fail

# all bits received
function gm4_reeling_rods:player/find_fished_entity with entity @s data.gm4_reeling_rods.id
