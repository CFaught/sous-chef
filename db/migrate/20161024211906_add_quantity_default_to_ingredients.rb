class AddQuantityDefaultToIngredients < ActiveRecord::Migration[5.0]
  def change
    change_column :ingredients, :quantity, :string, default: "1"
  end
end
