class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @recipes }
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @recipe }
    end
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
  end

  def create
    # raise params.inspect
    @recipe = Recipe.new(recipe_params)
    if params[:add_ingredient]

      @recipe.ingredients.build
    else
      if @recipe.save
        current_user.favorites << @recipe
        flash[:notice] = "Recipe successfully created!"
        redirect_to user_path(current_user) and return
      end
    end
    render :new
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    # raise params.inspect
    @recipe = Recipe.find(params[:id])
    if params[:add_ingredient]
      unless params[:recipe][:ingredients_attributes].blank?
    	  params[:recipe][:ingredients_attributes].each do |k, v|
    	    @recipe.ingredients.build unless v.has_key?(:id)
    	  end
    	end
      @recipe.ingredients.build
    elsif params[:remove_ingredient]
      removed_ingredients = params[:recipe][:ingredients_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      Ingredient.delete(removed_ingredients)
      flash[:notice] = "Ingredients removed."
    else
      if @recipe.update_attributes(recipe_params)
        flash[:notice] = "Recipe successfully updated!"
        redirect_to user_path(current_user) and return
      end
    end
    render :edit
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    flash[:notice] = "Successfully deleted recipe."
    redirect_to user_path(current_user)
  end

  def favorite
    @recipe = Recipe.find(params[:id])
    type = params[:type]
    # if type == "favorite"
      current_user.favorites << @recipe
      # current_user.favorites.save
      redirect_to :back, notice: "You favorited #{@recipe.title}"

    # elsif type == "unfavorite"
    #   current_user.favorites.delete(@recipe)
    #   redirect_to :back, notice: "Unfavorited #{@recipe.title}"
    #
    # else
    #   # Type missing, nothing happens
    #   redirect_to :back, notice: "Nothing happened."
    # end
  end

  def unfavorite
    @recipe = Recipe.find(params[:id])
    current_user.favorites.delete(@recipe)
    redirect_to :back, notice: "Unfavorited #{@recipe.title}"
  end

  def shopping
    recipe = Recipe.find(params[:id])
    user = current_user
    recipe.ingredients.each do |ingredient|
      user.items << ingredient
    end
    user.save
    redirect_to user_shopping_list_path(current_user)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :yield, :content, :user_id, ingredients_attributes: [:id, :name, :quantity])
  end
end
