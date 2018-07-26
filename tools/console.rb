require_relative '../config/environment.rb'



recipe1 = Recipe.new("Pizza")
recipe2 = Recipe.new("Spaghetti")
recipe3 = Recipe.new("Ramen")

user1 = User.new("Dick")
user2 = User.new("Vicky")
user3 = User.new("Evans")

my_card1 = RecipeCard.new(recipe1, user1, 100)
my_card2 = RecipeCard.new(recipe1, user2, 95)
my_card3 = RecipeCard.new(recipe2, user1, 90)
my_card4 = RecipeCard.new(recipe2, user2, 85)
my_card5 = RecipeCard.new(recipe2, user2, 80)
my_card6 = RecipeCard.new(recipe2, user2, 75)
my_card7 = RecipeCard.new(recipe3, user2, 70)

ingredient1 = Ingredient.new("Lettuce")
ingredient2 = Ingredient.new("Tomato")
ingredient3 = Ingredient.new("Peanuts")

allergen1 = Allergen.new(user1, ingredient1)
allergen2 = Allergen.new(user1, ingredient2)
allergen3 = Allergen.new(user2, ingredient2)
allergen4 = Allergen.new(user3, ingredient2)
allergen5 = Allergen.new(user2, ingredient3)


binding.pry
0
