# run from breed_cow.json (advancement)
# @s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=cow,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon marker ~ ~ ~ {Tags:["gm4_gemini_bred","gm4_gemini_cow"]}
advancement revoke @s only gm4_gemini_shamir:breed_cow
schedule function gm4_gemini_shamir:baby/find_baby 1t
