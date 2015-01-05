class Category < ActiveRecord::Base
  has_many :recipes, foreign_key: "subcategory_id"
  has_many :categories, foreign_key: "ParentCategory_ID"

  def keyword_recipes
	words=self.keywords.split(",")
	words.each do |word|
	  word.replace "TitleSearch LIKE '%#{word}%'"
	end
	where=words.join(' OR ')
	Recipe.where(where)
  end
end
