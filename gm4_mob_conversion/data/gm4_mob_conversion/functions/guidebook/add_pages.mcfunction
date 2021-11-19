# adds pages to the guidebook
# @s = player who's updating their guidebook
# located at @s
# run from gm4_mob_conversion:guidebook/verify_module

data modify storage gm4_guidebook:temp insert set value ['','["",{"text":"◀ ","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Back"},{"translate":"text.gm4.guidebook.back"}],"color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"text":"\\n"},{"text":"☶ ","color":"#864BC7","bold":true,"clickEvent":{"action":"open_url","value":"https://wiki.gm4.co/wiki/Mob_Conversion"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"}],"color":"#864BC7","clickEvent":{"action":"open_url","value":"https://wiki.gm4.co/wiki/Mob_Conversion"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"text":"\\n\\n"},{"text":"Mob Conversion","underlined":true},{"text":"\\n"},{"translate":"%1$s%3427655$s","with":[{"text":"Similar to Zombie curing, some mobs can be reverted to former versions.\\n\\nThese conversions require the player to splash the mob with a potion and drop an item at its feet."},{"translate":"text.gm4.guidebook.mob_conversion.1"}]}]','["",{"text":"???","hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Undiscovered"},{"translate":"text.gm4.guidebook.undiscovered"}],"italic":true,"color":"red"}]}}]','["",{"text":"???","hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Undiscovered"},{"translate":"text.gm4.guidebook.undiscovered"}],"italic":true,"color":"red"}]}}]']

# unlockable pages
execute if entity @s[advancements={gm4_mob_conversion:guidebook/page_1=true}] run data modify storage gm4_guidebook:temp insert[2] set value '["",{"translate":"%1$s%3427655$s","with":[{"text":"Pig from Zombified Piglin\\n - Swiftness\\n - Golden Carrot\\n\\nMooshroom from Cow\\n - Slowness\\n - Red Mushroom\\n - Brown Mushroom\\n\\nPotion Cleric from Witch\\n - Weakness\\n - Golden Apple"},{"translate":"text.gm4.guidebook.mob_conversion.2"}]}]'
execute if entity @s[advancements={gm4_mob_conversion:guidebook/page_2=true}] run data modify storage gm4_guidebook:temp insert[3] set value '["",{"translate":"%1$s%3427655$s","with":[{"text":"The potion cleric will trade the player certain potions for emeralds. Each potion trade is randomized from 2-6 emeralds.\\n\\nThe curer will be rewarded with some discounted potion prices."},{"translate":"text.gm4.guidebook.mob_conversion.3"}]}]'