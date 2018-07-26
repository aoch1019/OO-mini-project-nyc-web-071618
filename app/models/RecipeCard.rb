require 'date'
require 'pry'

class RecipeCard

  attr_accessor :rating
  attr_reader :recipe, :user, :date

  @@all = []

 def initialize(recipe, user, rating)
   @recipe = recipe
   @user = user
   @date = Date.today
   @rating = rating
   @@all << self
 end

 def self.all
   @@all
 end

end
