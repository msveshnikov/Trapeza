class Category < ActiveRecord::Base
  has_many :recipes, foreign_key: "subcategory_id"
  has_many :categories, foreign_key: "ParentCategory_ID"
end
