class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
      t.integer :quantity, default: 1
    end
  end
end
