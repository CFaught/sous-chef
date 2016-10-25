class CreateShoppingList < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_lists do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
