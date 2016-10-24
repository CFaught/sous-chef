class AddQuantityToIngredient < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :quantity, :string
  end
end
