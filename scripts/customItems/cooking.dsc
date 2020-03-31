##Cooking Items
custom_bowl:
  material: bowl
  display name: <&7>Bowl
  weight: '1'
  type: item
  
##Custom Recipes
#Kebabs
custom_raw_beef_kebab:
  material: beef
  display name: <&7>Raw Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  type: Item
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_beef/1
      side_ingredients: custom_beef/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 10
      
custom_raw_chicken_kebab:
  material: chicken
  display name: <&7>Raw Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  type: Item
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_chicken/1
      side_ingredients: custom_chicken/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 10

custom_cooked_beef_kebab:
  material: cooked_beef
  display name: <&7>Cooked Beef Kebab
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
      cook_time: 30s
      xp_given: 10
      
custom_cooked_chicken_kebab:
  material: cooked_chicken
  display name: <&7>Cooked Chicken Kebab
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
      cook_time: 30s
      xp_given: 10
#Soups
