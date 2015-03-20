class Category < ActiveRecord::Base
  has_many :recipes, foreign_key: 'subcategory_id'
  has_many :categories, foreign_key: 'ParentCategory_ID'

  scope :post, ->(onlypost) { onlypost ? (where Language_ID: 0) : all }

  def keyword_recipes
    words = keywords.split(',')
    words.each do |word|
      word.replace "TitleSearch LIKE '%#{word}%'"
    end
    where = words.join(' OR ')
    Recipe.where(where)
  end
end
