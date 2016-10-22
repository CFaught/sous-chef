class StaticController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
