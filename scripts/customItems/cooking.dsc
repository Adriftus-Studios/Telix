##Cooking Items
custom_bowl:
  type: item
  material: bowl
  display name: <&7>Bowl
  weight: '1'
  
##Custom Recipes
#Kebabs
custom_raw_beef_kebab:
  type: item
  material: beef
  display name: <&7>Raw Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_beef/1
      side_ingredients: custom_beef/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 5
      
custom_raw_chicken_kebab:
  type: item
  material: chicken
  display name: <&7>Raw Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_chicken/1
      side_ingredients: custom_chicken/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 5

custom_cooked_beef_kebab:
  type: item
  material: cooked_beef
  display name: <&7>Cooked Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_beef/1
      side_ingredients: custom_cooked_beef/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 10
    2:
      type: smeltery
      output_quantity: 1
      input: custom_coal/1|custom_raw_beef_kebab/1
      cook_time: 1m
      
custom_cooked_chicken_kebab:
  type: item
  material: cooked_chicken
  display name: <&7>Cooked Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_chicken/1
      side_ingredients: custom_cooked_chicken/1
      serving_dish: custom_stick/1
      cook_time: 30s
      xp_given: 10
    2:
      type: smeltery
      output_quantity: 1
      input: custom_coal/1|custom_raw_chicken_kebab/1
      cook_time: 1m

#Soups
custom_mushroom_soup:
  type: item
  material: mushroom_stew
  display name: <&7>Mushroom Soup
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_brown_mushroom/2
      serving_dish: custom_bowl/1
      cook_time: 1m
      xp_given: 10

custom_chicken_soup:
  type: item
  material: mushroom_stew
  display name: <&7>Chicken Soup
  weight: '1'
  recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_raw_chicken/2
      serving_dish: custom_bowl/1
      cook_time: 1m
      xp_given: 12
    2:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_chicken/2
      serving_dish: custom_bowl/1
      cook_time: 30s
      xp_given: 10
