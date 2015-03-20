class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :recipe_id
      t.string :ip

      t.timestamps
    end
  end
end
