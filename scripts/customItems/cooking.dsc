##Cooking Items
custom_bowl:
  type: item
  material: bowl
  display name: <&7>Bowl
  weight: '1'
  recipe_book_category: cooking.items
  custom_recipes:
    '0':
      input:
      - air|air|air
      - custom_stick|air|custom_stick
      - air|custom_stick|air
      output_quantity: 1
      type: shaped
    '1':
      input:
      - custom_stick|air|custom_stick
      - air|custom_stick|air
      - air|air|air
      output_quantity: 1
      type: shaped
  
custom_skewer:
  type: item
  material: stick
  display name: <&7>Skewer
  weight: '1'
  recipe_book_category: cooking.items
  custom_recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - air|air|air
        - custom_iron_ingot|air|air
        - custom_iron_ingot|air|air
    2:
      type: shaped
      output_quantity: 1
      input:
        - custom_iron_ingot|air|air
        - custom_iron_ingot|air|air
        - air|air|air
    3:
      type: shaped
      output_quantity: 1
      input:
        - air|custom_iron_ingot|air
        - air|custom_iron_ingot|air
        - air|air|air
    4:
      type: shaped
      output_quantity: 1
      input:
        - air|air|air
        - air|custom_iron_ingot|air
        - air|custom_iron_ingot|air
    5:
      type: shaped
      output_quantity: 1
      input:
        - air|air|custom_iron_ingot
        - air|air|custom_iron_ingot
        - air|air|air
    6:
      type: shaped
      output_quantity: 1
      input:
        - air|air|air
        - air|air|custom_iron_ingot
        - air|air|custom_iron_ingot
  
##Custom Recipes
#Kebabs
custom_raw_beef_kebab:
  type: item
  material: beef
  display name: <&7>Raw Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  food: -10
  thirst: -5
  recipe_book_category: cooking.food
  custom_recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_beef/1
      side_ingredients: custom_beef/1
      serving_dish: custom_skewer/1
      cook_time: 30s
      xp_given: 5
      
custom_raw_chicken_kebab:
  type: item
  material: chicken
  display name: <&7>Raw Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  food: -10
  thirst: -5
  recipe_book_category: cooking.food
  custom_recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_chicken/1
      side_ingredients: custom_chicken/1
      serving_dish: custom_skewer/1
      cook_time: 30s
      xp_given: 5

custom_cooked_beef_kebab:
  type: item
  material: cooked_beef
  display name: <&7>Cooked Beef Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  food: 15
  thirst: 2
  recipe_book_category: cooking.food
  custom_recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_beef/1
      side_ingredients: custom_cooked_beef/1
      serving_dish: custom_skewer/1
      cook_time: 30s
      xp_given: 10
    2:
      type: campfire
      output_quantity: 1
      cook_time: 20s
      input: custom_raw_beef_kebab
      
custom_cooked_chicken_kebab:
  type: item
  material: cooked_chicken
  display name: <&7>Cooked Chicken Kebab
  #mechanisms:
  #  custom_model_data: 0
  weight: '1'
  food: 15
  thirst: 2
  recipe_book_category: cooking.food
  custom_recipes:
    1:
      type: cooking
      output_quantity: 1
      main_ingredient: custom_cooked_chicken/1
      side_ingredients: custom_cooked_chicken/1
      serving_dish: custom_skewer/1
      cook_time: 30s
      xp_given: 10
    2:
      type: campfire
      output_quantity: 1
      cook_time: 20s
      input: custom_raw_chicken_kebab
      

#Soups
custom_mushroom_soup:
  type: item
  material: mushroom_stew
  display name: <&7>Mushroom Soup
  weight: '1'
  food: 5
  thirst: 15
  recipe_book_category: cooking.food
  custom_recipes:
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
  food: 8
  thirst: 15
  recipe_book_category: cooking.food
  custom_recipes:
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
