
### All bait will be formatted as 'af_bait_<name>' ###
### All rods will be formatted as 'af_rod_<name>' ###
### All Fish will be formatted as 'af_fish_<name>' ###



### RODS ###
# Need to add more rods. This is supposed to be a fully immersive mini game type system, where players will have to fish for a long time
# to unlock everything, and get the best rods. Fishing pays off, but only with the best bait, and best rods.
#  With that being said, they will not be paid insanely more. Only a fraction added to the top tiers. This will ensure that just because you're
#  new, you won't be left extremely far behind, with no hope of catching up.



# I need to inject this massive block of lore into the item somehow.
af_rod_basic:
  type: item
  material: fishing_rod
  display name: <&7>Basic Rod
  rod_rarity: <&7>Common
  weight: 5
  category: fishing_rod
  rod_upgrade_slots: 3
  mechanisms:
  # starting at 1
    custom_model_data: 1
  lore:
  - "<&b>Basic rod for catching basic fish."
  # building statistical lore is done with build_item task. dont include it here

### BAIT ###

af_bait_chum:
  type: item
  material: brown_dye
  display name: <&a>Chum
  yaml_name: chum
  weight: 0.25
  category: bait
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."

af_bait_honeycomb:
  type: item
  material: honeycomb
  display name: <&a>Honeycomb
  yaml_name: honeycomb
  weight: 0.25
  category: bait
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."


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

af_rod_shop_button:
  type: item
  material: fishing_rod
  display name: <&a>Rod Shop
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&b>Purchase a brand new rod!"

af_gutting_station_button:
  type: item
  material: minecart
  display name: <&a>Gutting Station
  lore:
  - "<&b>Gut and prepare your catch for market"

af_fish_token:
  type: item
  material: paper
  display name: <&a>Fishing Token
  lore:
  - "<&b>General admission ticket to the"
  - "<&b>monthly fishing event!"

### Info Icons ###
af_bait_shop_info:
  type: item
  material: cod
  display name: <&a>Bait Shop Info
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&b>Left Click - Purchase 1 Bait"
  - "<&b>Right Click - Purchase 8 Bait"

af_rod_shop_info:
  type: item
  material: fishing_rod
  display name: <&a>Rod Shop Info
  mechanisms:
    custom_model_data: 0
  lore:
  - "<&b>Left Click - Purchase fishing rod"

af_gutting_station_info:
  type: item
  material: minecart
  display name: <&a>Gutting Station Info
  lore:
  - "<&b>Gut and prepare your catch for market"
  - "<&b>You can only sell prepared fish on the market"

### Fish being Caught ###

af_fish_1:
  type: item
  material: cod
  display name: <&a>Redfish
  mechanisms:
    custom_model_data: 18
  weight: 0.20
  category: fish
  
af_fish_2:
  type: item
  material: cod
  display name: <&a>Coi
  mechanisms:
    custom_model_data: 1
  weight: 0.20
  category: fish
  lore:
  
af_fish_3:
  type: item
  material: cod
  display name: <&a>Mackeral
  mechanisms:
    custom_model_data: 2
  weight: 0.20
  category: fish

debug_item_1:
  type: item
  material: dirt
  display name: <&a>Debug 1
  lore:
  - "<&8>Item Weight: ERROR"

debug_item_2:
  type: item
  material: dirt
  display name: <&a>Debug 2
  lore:
  - "<&8>Item Weight: ERROR"

debug_item_3:
  type: item
  material: dirt
  display name: <&a>Debug 3
  lore:
  - "<&8>Item Weight: ERROR"
  
debug_item_4:
  type: item
  material: dirt
  display name: <&a>Debug 4
  lore:
  - "<&8>Item Weight: ERROR"
