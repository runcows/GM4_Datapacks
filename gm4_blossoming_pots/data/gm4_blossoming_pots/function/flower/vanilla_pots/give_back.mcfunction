# gives player the vanilla flower pot item back that they tried to plant in a custom flower pot
# @s = temp marker inside filled vanilla flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/vanilla_pots/as_marker

$execute at @p[nbt={UUID:$(UUID)},gamemode=!creative] run summon minecraft:item ~ ~ ~ {Item:{id:"$(Item)"}}