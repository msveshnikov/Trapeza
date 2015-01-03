class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
    add_index :comments, [:recipe_id, :created_at]
  end
end
