class RemoveQuantityFromRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipe_ingredients, :quantity
  end
end
