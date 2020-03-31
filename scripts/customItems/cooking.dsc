##Cooking Items
custom_bowl:
  material: bowl
  display name: <&7>Bowl
  weight: '1'
  type: item
  
##Custom Recipes
#Kebabs
custom_beef_kebab:
  material: stick
  display name: <&7>Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  type: Item
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_beef/1
      side_ingredients: custom_cooked_beef/1
      serving_dish: custom_stick/1
      cook_time: 1m
      xp_given: 10
      
custom_chicken_kebab:
  material: stick
  display name: <&7>Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  type: Item
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_chicken/1
      side_ingredients: custom_cooked_chicken/1
      serving_dish: custom_stick/1
      cook_time: 1m
      xp_given: 10
#Soups
