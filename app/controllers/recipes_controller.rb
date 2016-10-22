class RecipesController < ApplicationController
  def index

  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to user_path(current_user)
  end

  def edit
    @user = User.find(params[:user_id])
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.update(recipe_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to user_path(current_user)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :yield, :content, :user_id)
  end
end
