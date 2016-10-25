class IngredientsController < ApplicationController
  def index
  end

  def show
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
  
  def delete_item
    item = Ingredient.find(params[:id])
    current_user.items.delete(item)
    current_user.save
    redirect_to user_shopping_list_path(current_user)
  end
end
