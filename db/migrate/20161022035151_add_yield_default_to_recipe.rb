class AddYieldDefaultToRecipe < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :yield, :integer, default: 1
  end
end
