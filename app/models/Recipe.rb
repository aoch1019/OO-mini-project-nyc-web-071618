class Recipe

  attr_accessor :ingredients
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end ##TEMPORARY INITIALIZATION

  def self.all
    @@all
  end

  def self.most_popular_helper(curr_recipe)

    new_array = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == curr_recipe
    end

    new_array.count
  end


  def self.most_popular

    sorted_recipes = self.all.sort_by do |recipe|
      most_popular_helper(recipe)
    end

    sorted_recipes.last
  end

  def users
    my_cards = RecipeCards.all.select do |card|
      card.recipe == self
    end

    my_cards.map do |card|
      card.user
    end
  end

  def ingredients
      ingredient_array = []

      RecipeIngredient.each do |ri|
        if ri.recipe == self
          ingredient_array << ri.ingredient
        end
      end

      ingredient_array
  end

  def allergens
    allergens = []

    ingredients.each do |ingredient|
      Allergen.all.each do |allergen|
        if allergen.ingredient == ingredient
          allergens << ingredient
        end
      end
    end

    allergens.uniq
  end

  def add_ingredients(ingredient_array)

    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
    
  end

end
