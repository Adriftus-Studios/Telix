
### All bait will be formatted as 'af_bait_<name>' ###
### All rods will be formatted as 'af_rod_<name>' ###
### All Fish will be formatted as 'af_fish_<name>' ###



### RODS ###
# Need to add more rods. This is supposed to be a fully immersive mini game type system, where players will have to fish for a long time
# to unlock everything, and get the best rods. Fishing pays off, but only with the best bait, and best rods.
#  With that beign said, they will not be paid insanely more. Only a fraction added to the top tiers. This will ensure that just because you're
#  new, you won't be left extremely far behind, with no hope of catching up.

af_rod_basic:
  type: item
  material: fishing_rod
  display name: <&7>Basic Rod
  rod_rarity: <&7>Common
  weight: 5
  mechanisms:
  # starting at 1
    custom_model_data: 1
  lore:
  - "<&6><&l><&m>-------------<&r><&6>  Fishing Rod  <&l><&m>-------------"
  - "<&b>Basic rod for catching basic fish."
  - "<&6>"
  - "<&6>Rarity<&b><&co><&6> <script.yaml_key[rod_rarity].parsed>"
  - "<&6>"
  - "<&6><&l><&m>-------------<&r><&6>   Upgrades    <&l><&m>-------------"
  - "<&b>Slot: []"
  - "<&b>Slot: []"
  - "<&b>Slot: []"
  - "<&6><&l><&m>--------------<&r><&6>     Bait      <&l><&m>--------------"
  - "<&b>Right click to remove the bait"
  - "<&6>Baited with: <&7>Nothing"
  - "<&8>Item Weight: <script.yaml_key[weight]>"


### BAIT ###

af_bait_chum:
  type: item
  material: brown_dye
  display name: <&a>Chum
  weight: 0.25
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."
  - ""
  - "<&8>Item Weight: <script.yaml_key[weight]>"

af_bait_honeycomb:
  type: item
  material: honeycomb
  display name: <&a>Honeycomb
  weight: 0.25
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."
  - ""
  - "<&8>Item Weight: <script.yaml_key[weight]>"


### MISC ITEMS ###

af_merchant_button:
  type: item
  material: iron_nugget
  display name: <&a>Merchant
  mechanisms:
    custom_model_data: 34
  lore:
  - "<&b>Sell your caught fish here!"

af_bait_shop_button:
  type: item
  material: cod
  display name: <&a>Bait Shop
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&b>Purchase fresh bait!"
af_bait_shop_info:
  type: item
  material: cod
  display name: <&a>Bait Shop Info
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&b>Left Click - Purchase 1 Bait"
  - "<&b>Right Click - Purchase 8 Bait"

af_gutting_station_button:
  type: item
  material: minecart
  display name: <&a>Gutting Station
  lore:
  - "<&b>Gut and prepare your catch for market"


### Fish being Caught ###

af_fish_1:
  type: item
  material: cod
  display name: <&a>Redfish
  mechanisms:
    custom_model_data: 0
  weight: 0.20
  lore:
  - "<&8>Item Weight: <script.yaml_key[weight]>"