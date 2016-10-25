class StaticController < ApplicationController
  def index
    @ingredients = Ingredient.all.to_a.uniq { |ingredient| ingredient.name.downcase }

    # filter the @recipes list based on user input
    if !params[:ingredient].blank?
      @ingredient = Ingredient.find_by(id: params[:ingredient])
      @recipes = Recipe.filter_by_ingredients(@ingredient)
    else
      # if no filters are applied, show all posts
      @recipes = Recipe.order('recipes.title').all
    end
  end
end
