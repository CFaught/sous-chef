class CreateUserRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_recipes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
