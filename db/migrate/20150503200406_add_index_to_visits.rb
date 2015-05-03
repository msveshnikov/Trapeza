class AddIndexToVisits < ActiveRecord::Migration
  def change
    add_index :visits, :recipe_id
  end
end
