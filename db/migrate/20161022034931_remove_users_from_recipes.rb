class RemoveUsersFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :user_id
  end
end
