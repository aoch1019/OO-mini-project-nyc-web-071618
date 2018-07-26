class User

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes

    recipe_array = []

    RecipeCard.all.each do |card|
      if card.user == self
        recipe_array << card.recipe
      end
    end

    recipe_array
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(recipe, self, rating)
  end

  def my_recipe_cards
    RecipeCard.all.select do |card|
      card.user == self
    end
  end

  def top_three_recipes

    rating_array = my_recipe_cards.sort_by do |card|
      card.rating
    end

    rating_array[-3..-1]
  end

  def most_recent_recipe
    my_recipe_cards.last.recipe
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    ingredient_array = []

    Allergen.all.each do |allergen|
      if allergen.user == self
        ingredient_array << allergen.ingredient
      end
    end

    ingredient_array

  end

  def safe_recipes
    safe_array = []

    allergens.each do |ingredient|
      RecipeIngredient.all.each do |ri|
        if ri.ingredient != ingredient
          safe_array << ri.recipe
        end
      end
    end

    safe_array.uniq
  end

end
