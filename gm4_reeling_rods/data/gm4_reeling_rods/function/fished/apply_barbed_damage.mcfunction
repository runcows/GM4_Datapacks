# Applies the barbed damage to the hooked entity
# @s = hooked entity
# at bobber position
# run from fished/select_type with {level:<barbed level>}

$damage @s $(damage) magic by @p[tag=gm4_reeling_rods.player]
