
### All bait will be formatted as 'af_bait_<name>' ###
### All rods will be formatted as 'af_rod_<name>' ###

### RODS ###

af_rod_basic:
  type: item
  material: fishing_rod
  display name: <&7>Basic Rod
  rod_rarity: common
  mechanisms:
  # starting at 1
    custom_model_data: 1
  lore:
  - "<&6><&l><&m>-------------<&r><&6>  Fishing Rod  <&l><&m>-------------"
  - "<&b>Basic rod for catching basic fish."
  - "<&6>"
  - "<&6><&l><&m>-------------<&r><&6>   Upgrades    <&l><&m>-------------"
  - "<&b>Slot: []"
  - "<&b>Slot: []"
  - "<&b>Slot: []"
  - "<&6><&l><&m>-------------<&r><&6>     Bait      <&l><&m>-------------"
  - "<&b>Right click to remove the bait"
  - "<&6>Baited with: <&7>Nothing"


### BAIT ###

af_bait_chum:
  type: item
  material: brown_dye
  display name: <&a>Chum
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."

af_bait_honeycomb:
  type: item
  material: honeycomb
  display name: <&a>Honeycomb
  lore:
  - "<&b>Drag and drop this bait on any"
  - "<&b>rod to apply the bait."


### MISC ITEMS ###

af_merchant_button:
  type: item
  material: emerald
  display name: <&a>Merchant
  lore:
  - "<&b>Sell your caught fish here!"


### Fish being Caught ###

af_fish_1:
  type: item
  material: cod
  display name: <&a>Redfish
  mechanisms:
    custom_model_data: 0