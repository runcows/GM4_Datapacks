# verifies that the placed down machine minecart was from this module
# @s = machine minecart
# located at the machine minecart
# run from #gm4_machines:place_cart

execute if score $placed_block gm4_machine_data matches 0 if data entity @s {CustomName:{"translate":"item.gm4.liquid_minecart","fallback":"Minecart with Liquid Tank","italic":false}} run function gm4_liquid_minecarts:machine/create_cart
