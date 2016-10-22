class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :user_id
      t.integer :yield
      t.text :content

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
