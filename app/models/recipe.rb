class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :user_recipes
  has_many :favorited_by, through: :user_recipes, source: :user
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  validates_presence_of :title
  validates_presence_of :content

  def self.filter_by_ingredients(ingredient)
    Recipe.order('recipes.title').all.to_a.select do |recipe|
      recipe.ingredients.to_a.any? { |ing| ing.name.downcase.strip == ingredient.name.downcase.strip }
    end
  end
end
